package kr.or.ddit.project.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.project.service.KanbanCardService;
import kr.or.ddit.project.vo.KanbanCardVO;
import kr.or.ddit.user.service.LoginService;
import kr.or.ddit.user.vo.MemberVO;

@RequestMapping("/project")
@Controller
public class KanbanCardController {

	private static final Logger logger = LoggerFactory.getLogger(KanbanCardController.class);
	
	@Autowired
	KanbanCardService kanbanCardService;
	@Autowired
	LoginService loginService;
	
	//칸반 카드 등록
	@ResponseBody
	@PostMapping("/kanbanCard/insert")
	public String kbCardInsert(@ModelAttribute KanbanCardVO kanbanCardVO, HttpSession session) {
		
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		
		MemberVO member = this.loginService.loginPost(memberVO);
		
		String kbCardWrtrNm = member.getMbrNm();
		
		logger.info("칸반카드등록이름 - "+ kbCardWrtrNm);
		
		kanbanCardVO.setKbCardWrtrNm(kbCardWrtrNm);
		
		int result = kanbanCardService.kanbanCardInsert(kanbanCardVO);
		
		logger.info("칸반카드등록"+ result);
		
		return "redirect:/project/kanban.do";
	}
	
	//칸반 카드 삭제
	@ResponseBody
	@PostMapping("/kanbanCard/delete")
	public String kbCardDelete(@RequestParam String kbCardNo) {
		
		int result = kanbanCardService.kanbanCardDelete(kbCardNo);
		
		logger.info("칸반카드삭제 ->" + result );
		
		return "redirect:/project/kanban.do";
	}
	
	//칸반 카드 수정
	@ResponseBody
	@PostMapping("/kanbanCard/update")
	public String kanbanCardUpdate(@ModelAttribute KanbanCardVO kanbanCardVO) {
		
		int result = kanbanCardService.kanbanCardUpdate(kanbanCardVO);
		
		logger.info("칸반 카드 수정 : " + result );
		
		return "redirect:/project/kanban.do";
	}
	
	
	
	
	//칸반 카드 순서 
	//같은칸반 1 -> 4
	@ResponseBody
	@PostMapping("/kanbanCard/update2")
	public int kanbanCardUpdate2(@RequestParam int positionA, 
								@RequestParam int positionB, @RequestParam  int kbNo) {
		
		//map에 넣어서... 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("positionA", positionA);
		map.put("positionB", positionB);
		map.put("kbNo", kbNo);
		
		logger.info("map에서 뽑은 애들 - " + map.toString());
		
		int result = kanbanCardService.kanbanCardUpdate2(map);
		
		logger.info("칸반 카드 이동 : " + result );
		
		return result;
	}
	
	//같은칸반 4 -> 1
	@ResponseBody
	@PostMapping("/kanbanCard/update3")
	public int kanbanCardUpdate3(@RequestParam int positionA, 
								@RequestParam int positionB, @RequestParam  int kbNo) {
		
		//map에 넣어서... 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("positionA", positionA);
		map.put("positionB", positionB);
		map.put("kbNo", kbNo);
		
		logger.info("map에서 뽑은 애들 - " + map.toString());
		
		int result = kanbanCardService.kanbanCardUpdate3(map);
		
		logger.info("칸반 카드 이동 : " + result );
		
		return result;
	}
	//다른칸반 
	
}
