package kr.or.ddit.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.project.service.KanbanCardService;
import kr.or.ddit.project.service.KanbanService;
import kr.or.ddit.project.vo.KanbanCardVO;
import kr.or.ddit.project.vo.KanbanVO;
import kr.or.ddit.user.service.EmailService;
import kr.or.ddit.user.service.LoginService;
import kr.or.ddit.user.vo.MemberVO;

@RequestMapping("/project")
@Controller
public class KanbanController {
	private static final Logger logger = LoggerFactory.getLogger(KanbanController.class);
	
	@Autowired
	KanbanService kanbanService;
	
	@Autowired
	KanbanCardService kanbanCardService;
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	EmailService emailService;
	
	//칸반 조회(칸반 메인)
	@GetMapping("/kanban.do")
	public String kanbanSelect(Model model, @RequestParam String pjtNo, HttpSession session, HttpServletRequest request) {
		
		logger.info("칸반 프젝 넘버 가져와 : " + pjtNo);
		
		//칸반 조회(칸반 메인)
		List<KanbanVO> list = this.kanbanService.kanbanSelect(pjtNo);
			logger.info(pjtNo+ "의 프로젝트 칸반 list" + list);
		model.addAttribute("list", list);
		//logger.info("칸반조회:: " + list);
		
		
		List<KanbanCardVO> kbCardlist = this.kanbanCardService.kanbanCardSelect();
		model.addAttribute("kbCardlist", kbCardlist);
		
		List<MemberVO> memImg = this.emailService.memImg();
		logger.info("22222222222 " + memImg);
		model.addAttribute("memImgg", memImg);
		
		
		//logger.info("칸반 카드 조회 : " + kbCardlist);
		
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		MemberVO member = this.loginService.loginPost(memberVO);
		
		//세션 이름 가져오기
		String memberNm = member.getMbrNm();
		model.addAttribute("memberNm", memberNm);
		
		//세션 아이디 가져오기
		String mbrId = member.getMbrId();
		model.addAttribute("mbrId", mbrId);
		
		//프로젝트 PL 찾기
		String plId = kanbanService.plSelect(pjtNo);
		logger.info("PL가져왔냐 - "+ plId);
		model.addAttribute("plId", plId);
		
		return "project/kanban";
		
		
	}
	
	//칸반 추가
	@RequestMapping(value = "/kanban/insert", method = RequestMethod.GET)
	public String kanbanInsert(@ModelAttribute KanbanVO kanbanVO, @RequestParam String pjtNo){
		
		int result = kanbanService.kanbanInsert(kanbanVO);
		
		
		logger.info("칸반 추가 : " + result);
		
		return "project/kanban";
	}
	
	
	
	//칸반 삭제
	@ResponseBody
	@PostMapping("/kanban/delete")
	public String kanbanDelete(@RequestParam String kbNo) {
		
		 int result = kanbanService.kanbanDelete(kbNo);
		 logger.info("삭제할 칸반번호 : "+kbNo);
		 logger.info("칸반 삭제 : " + result );
		 
		return "project/kanban";
	}
	
	
	
	
	//칸반 카드 삭제
	@ResponseBody
	@PostMapping("/kanbanNo/delete")
	public String kanbanNoDelete(@RequestParam String kbNo) {
		
		int result = kanbanService.kanbanNoDelete(kbNo);
		
		logger.info("칸반 삭제(칸반 카드 전부 삭제)" + result);
		
		return "project/kanban";
	}
	
	//칸반 수정
	@ResponseBody
	@PostMapping("/kanban/update")
	public String kanbanUpdate(@ModelAttribute KanbanVO kanbanVO) {
		
		int result = kanbanService.kanbanUpdate(kanbanVO);
		
		logger.info("칸반 수정" + result);
		
		
		return "project/kanban";
		
	}
	
}
