package kr.or.ddit.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Type;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.reflect.TypeToken;
import com.google.gson.Gson;

import kr.or.ddit.user.service.AlarmService;
import kr.or.ddit.user.service.GetUserService;
import kr.or.ddit.user.vo.AlarmVO;
import kr.or.ddit.user.vo.MemberVO;
/**
 * 채팅,멘션,일감,메일,회의,프로젝트에 참여시 알림 메시지를 전달하는 컨트롤러
 * @author 정신애
 *
 */
@Controller
@RequestMapping("/alarm")
public class AlarmController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(AlarmController.class);
	
	@Autowired
	ReloadableResourceBundleMessageSource res;

	@Autowired
	AlarmService service;
	
	@Autowired
	GetUserService userService;
	
	//사용자가 안읽은 모든 메시지
	public List<AlarmVO> getAllNotReadedMsg(String mbrId){
		
		List<AlarmVO> list = service.getAllNotReadedMsg(mbrId);
		
		for(AlarmVO alarm : list) {
			
			logger.info("알람리스트 : " + alarm.toString());
			if(alarm.getAlrmCtgrNo() == "A01") {
				String str = res.getMessage("chat", null, alarm.getAlrmSndId(), null);
				logger.info(str);
			}
			
		}
		
		
		return list;
	}
	
	//사용자가 안읽은 모든 메시지의 갯수
	public int getAllNotReadedCount(String mbrId) {
//		int result = 0;
//		System.out.println("getAllNotReadedCount service >> " + service.toString());
//		result = Integer.parseInt(service.getAllNotReadedCount(mbrId));
//		System.out.println("getAllNotReadedCount result >> " + result);
		return service.getAllNotReadedCount(mbrId);
	}
	

	/**
	 * 알림메시지 확인 시 읽음으로 변경
	 * @param session 알림메시지 읽은 접속자
	 * @param alrmNo 읽은 메시지의 번호
	 * @return 업데이트 성공 시 1 리턴
	 */
	@ResponseBody
	@GetMapping("/readAlarm")
	public int updateAlarmMsg(HttpSession session, @RequestParam String alrmNo) {
		MemberVO vo = (MemberVO) session.getAttribute("member");
		String mbrId = vo.getMbrId();
		Map<String, String> map = new HashMap<String, String>();
		map.put("alrmNo", alrmNo);
		map.put("mbrId", mbrId);
		return service.updateAlarmMsg(map);
	}

	
	
	
}
