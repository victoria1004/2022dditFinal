package kr.or.ddit.feed.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.ddit.feed.service.PstService;
import kr.or.ddit.feed.vo.PstCmntVO;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.user.service.AlarmService;
import kr.or.ddit.user.service.LoginService;
import kr.or.ddit.user.service.MbrService;
import kr.or.ddit.user.vo.MemberVO;

@RequestMapping("/feed")
@Controller
public class PstCmntController {
	private static final Logger logger = LoggerFactory.getLogger(PstCmntController.class);
	
	@Autowired
	PstService pstService;
	@Autowired
	AlarmService alarmService;
	@Autowired
	LoginService loginService;
	@Autowired
	MbrService mbrService;
	@Autowired
	ProjectService service;
	

	//댓글 등록
	@ResponseBody
	@RequestMapping(value = "/cmntInsert.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> cmntInsert(Model model, HttpSession session, @RequestParam String pstNo, @RequestParam String cmntCn,
				@RequestParam(required = false) Map<String, Object> alertId) {
		logger.info("cmnt pstNo"+pstNo);
		logger.info("cmnt cmntCn"+cmntCn);
		
		Gson gson = new Gson();
		
		//멘션 알림 받을 아이디
		String rcvId = "";
		
		List<String> getId = gson.fromJson((String)alertId.get("alertId"), List.class);
			for(int i = 0; i<getId.size(); i++) {
				rcvId = getId.get(i);
			}
			
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		MemberVO member = this.loginService.loginPost(memberVO);
		//세션에 member객체 세팅
		session.setAttribute("member", member);
		logger.info("댓글 세션 member: " + member.toString());
		
		PstCmntVO cmntVO = new PstCmntVO();
		cmntVO.setPstNo(pstNo);
		cmntVO.setCmntCn(cmntCn);
		cmntVO.setMbrId(member.getMbrId()); //로그인한 세션 아이디
		
		int intRes = pstService.cmntInsert(cmntVO);
		
		Map<String, Object> res = new HashMap<String, Object>();
		
		if(intRes > 0) { //등록이 성공하면
			//해당 멤버가 작성한 댓글이 담겨있는 리스트 중 
			List<Map<String, Object>> list = pstService.cmntMbr(cmntVO);
			//가장 최근에 작성한 VO를 뽑는다.
			res.put("vo",list.get(list.size()-1));
			String pjtNo = pstService.getPjtNo(pstNo);
			logger.info("pjtNo:", pjtNo);
			String data = pjtNo + "/" + pstNo;
			alarmService.insertAlarmMsg(memberVO.getMbrId(), "A02", rcvId, memberVO.getMbrNm(), data);
			
			res.put("rcvId", rcvId);
		}
		
		return res;
	}
	//멘션을 위해 해당 프로젝트 구성 멤버 가져오기
	@ResponseBody
	@GetMapping("/getMem.do")
	public List<Map<String, Object>> getMem(@RequestParam String pjtNo) {
	
		List<Map<String, Object>> res = service.allPrtpnt(pjtNo);
		logger.info("프로젝트 구성원 꺼내자 :" + res.toString());
		
		return res;
	}
	
	
	//댓글 수정
	@ResponseBody
	@RequestMapping(value = "/cmntUpdate.do", method = RequestMethod.POST)
	public int cmntUpdate(@RequestParam String cmntNo, @RequestParam String cmntCn) {
		logger.info(cmntNo);
		logger.info(cmntCn);
		
		PstCmntVO cmntVO = new PstCmntVO();
		cmntVO.setCmntNo(cmntNo);
		cmntVO.setCmntCn(cmntCn);
		
		return pstService.cmntUpdate(cmntVO);
	}
	
	//댓글 삭제
	@ResponseBody
	@RequestMapping(value = "/cmntDelete.do", method = RequestMethod.POST)
	public int cmntDelete(@RequestParam String cmntNo) {
		logger.info(cmntNo);
		
		return pstService.cmntDelete(cmntNo);
	}

}
