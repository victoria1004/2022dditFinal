package kr.or.ddit.reservation.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.MapUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.ddit.reservation.service.MtrService;
import kr.or.ddit.reservation.vo.MtrRsvtVO;
import kr.or.ddit.reservation.vo.MtrVO;
import kr.or.ddit.user.controller.LoginController;
import kr.or.ddit.user.service.AlarmService;
import kr.or.ddit.user.service.GetUserService;
import kr.or.ddit.user.vo.MemberVO;


@Controller
@RequestMapping(value = "/mtr")
public class MtrController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(MtrController.class);
	
	@Autowired
	MtrService mtrService;
	
	@Autowired
	AlarmService alarmService;
	
	@Autowired
	GetUserService userService;
	
	//Get방식 예약페이지 연결
	@GetMapping("/mtr.do")
	public String meetingRoom() {
		return "reservation/mtrReservation";
	}
	
	//해당일 예약정보 보내기
	@PostMapping("/resSelect.do")
	public @ResponseBody List<Map<String,Object>> resSelect(@RequestParam HashMap<String, Object> params) {
		//받은 날짜 확인
		logger.info("rsvt_ymd : {}", params);
		
		//받은 날짜
		String rsvtYmd = MapUtils.getString(params, "rsvt_ymd");
		System.out.println(rsvtYmd);
		
		//해당일 예약정보 조회
		List<Map<String,Object>> mtrRsvtList = this.mtrService.todayRes(rsvtYmd);
		
		if(mtrRsvtList==null) {
			System.out.println("srList : null");
		}else{
			logger.info("mtrRsvtList :"+mtrRsvtList.toString());
		}
		return mtrRsvtList;
	}
	
	//예약하기
	@PostMapping("/resInsert.do")
	@ResponseBody
	public Map<String,Object> resInsert(@RequestParam HashMap<String, Object> params) {
		//받은 예약정보(mtrNo,mbrId,rsvtStrtHr,rsvtYmd) 확인
		logger.info("res : "+params);
		
		//변수에 분류
		int mtrNo = MapUtils.getInteger(params, "mtrNo"); //방번호
		String mbrId = MapUtils.getString(params, "mbrId"); //sender
		String rsvtStrtHr = MapUtils.getString(params, "rsvtStrtHr"); //예약시간
		String rsvtYmd = MapUtils.getString(params, "rsvtYmd"); //예약일
		
		//VO에 담기
		MtrRsvtVO resVO = new MtrRsvtVO();
		resVO.setMtrNo(mtrNo);
		resVO.setMbrId(mbrId);
		resVO.setRsvtStrtHr(rsvtStrtHr);
		resVO.setRsvtYmd(rsvtYmd);
		
		//DB에 저장
		int res = this.mtrService.resInsert(resVO);
		
		if(res>=1) {
			Map<String, Object> result = new HashMap<>();
			result.put("sta", "success");
			
			String finalMtrNo = "10" + mtrNo; //회의실 방 번호
			String info = finalMtrNo + "/" + rsvtYmd + "/" + rsvtStrtHr;
			
			List<MemberVO> list = new ArrayList<MemberVO>();
			Gson gson = new Gson();
			List<String> strList = gson.fromJson((String) params.get("data"), List.class); //선택된 사람 목록
			List<String> sendList = new ArrayList<String>(); //알림메시지 보낼사람 명단
		
			for(String str2: strList) {
				alarmService.insertAlarmMsg(mbrId, "A05", str2, info);
				MemberVO vo = new MemberVO();
				vo = userService.getUser(str2);
				list.add(vo);
				sendList.add(str2);
			}
			result.put("list", sendList);
			return result;
		}else {
			Map<String,Object> result = new HashMap<>();
			result.put("sta", "fail");
			return result;
		}
	}
	
	//예약 취소
	@RequestMapping(value = "resDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> resDelete(@RequestParam HashMap<String, Object> params) {
		
		//받은 예약정보(mtrNo,mbrId,rsvtStrtHr,rsvtYmd) 확인
		logger.info("params : "+params);
		
		//변수에 분류
		int mtrNo = MapUtils.getInteger(params, "mtrNo");
		String mbrId = MapUtils.getString(params, "mbrId");
		String rsvtStrtHr = MapUtils.getString(params, "rsvtStrtHr");
		String rsvtYmd = MapUtils.getString(params, "rsvtYmd");
		
		//VO에 담기
		MtrRsvtVO resVO = new MtrRsvtVO();
		resVO.setMtrNo(mtrNo);
		resVO.setMbrId(mbrId);
		resVO.setRsvtStrtHr(rsvtStrtHr);
		resVO.setRsvtYmd(rsvtYmd);
		
		//해당 예약정보 조회
		MtrRsvtVO mrVO = this.mtrService.resSelectOne(resVO);
		
		if(mrVO==null) {
			System.out.println("예약정보없음");
			Map<String, Object> result = new HashMap<>();
			result.put("sta", "noResData");
			return result;
		}else {
			int res = this.mtrService.resDelete(resVO);
			
			if(res>=1) {
				System.out.println("예약취소 성공");
				Map<String, Object> result = new HashMap<>();
				result.put("sta", "success");
				return result;
			}else {
				Map<String,Object> result = new HashMap<>();
				result.put("sta", "fail");
				return result;
			}//else
		}//else
	}
	
	//회의실 비품 구비현황 조회
	@RequestMapping(value = "/mtrStts.do", method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> mtrStts() {
		
		List<Map<String,Object>> mtrSttsList = this.mtrService.mtrStts();
		logger.info("mtrSttsList : "+mtrSttsList);
		return mtrSttsList;
	}
	
	//회의실 비품 추가
	@RequestMapping(value = "/mtrSttsInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> mtrSttsInsert(@RequestParam HashMap<String, Object> params) {
		
		//받은 비품정보(mtrNo,mtrGdsNo) 확인
		logger.info("params : "+params);
		
		//변수에 분류
		int mtrNo = MapUtils.getInteger(params, "mtrNo");
		int mtrGdsNo = MapUtils.getInteger(params, "mtrGdsNo");
		
		
		//VO에 담기
		MtrVO mtrVO = new MtrVO();
		mtrVO.setMtrNo(mtrNo);
		mtrVO.setMtrGdsNo(mtrGdsNo);
		
		//해당 비품정보 등록
		int result = this.mtrService.mtrSttsInsert(mtrVO);
		
		if(result==0) {
			System.out.println("등록실패");
			Map<String, Object> res = new HashMap<>();
			res.put("sta", "fail");
			return res;
		}else {
			System.out.println("등록성공");
			Map<String, Object> res = new HashMap<>();
			res.put("sta", "success");
			return res;
		}//else
	}
	//회의실 비품 삭제
	@RequestMapping(value = "/mtrSttsDelete.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> mtrSttsDelete(@RequestParam HashMap<String, Object> params) {
		
		//받은 비품정보(mtrNo,mtrGdsNo) 확인
		logger.info("params : "+params);
		
		//변수에 분류
		int mtrNo = MapUtils.getInteger(params, "mtrNo");
		int mtrGdsNo = MapUtils.getInteger(params, "mtrGdsNo");
		
		
		//VO에 담기
		MtrVO mtrVO = new MtrVO();
		mtrVO.setMtrNo(mtrNo);
		mtrVO.setMtrGdsNo(mtrGdsNo);
		logger.info("삭제할mtrVO"+mtrVO);
		
		//해당 비품정보 삭제
		int result = this.mtrService.mtrSttsDelete(mtrVO);
		System.out.println(result);
		
		if(result==0) {
			Map<String, Object> res = new HashMap<>();
			res.put("sta", "fail");
			return res;
		}else {
			Map<String, Object> res = new HashMap<>();
			res.put("sta", "success");
			return res;
		}//else
	}
	
	
}
