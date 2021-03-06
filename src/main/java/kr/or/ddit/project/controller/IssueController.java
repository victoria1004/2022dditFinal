package kr.or.ddit.project.controller;




import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.project.service.IssueService;
import kr.or.ddit.project.service.TodoService;
import kr.or.ddit.project.vo.IssueVO;
import kr.or.ddit.project.vo.MarkerVO;
import kr.or.ddit.project.vo.TodoVO;
import kr.or.ddit.user.service.LoginService;
import kr.or.ddit.user.vo.MemberVO;


@RequestMapping("/project")
@Controller
public class IssueController {
	private static final Logger logger = LoggerFactory.getLogger(IssueController.class);
	
	@Autowired
	IssueService issueService;
	@Autowired
	LoginService loginService;
	@Autowired
	TodoService todoService;
	
	//이슈  조회 (이슈 메인)
	@GetMapping("/issuemain.do")
	public String issueSelect(Model model, @RequestParam String pjtNo, HttpSession session, HttpServletRequest request ) {
		
		logger.info("이슈 프젝 넘버 가져와 : " + pjtNo);
		//프젝 넘버 가져와서 이슈 보여주기
		List<IssueVO> list = this.issueService.issueSelect(pjtNo);
			//logger.info(pjtNo+ "의 프로젝트 issue list" + list);
		model.addAttribute("list", list);
		
		//프젝 마커 가져오기 
		List<MarkerVO> mkList = this.todoService.getMarkers(pjtNo);
			//logger.info("마커 가져왔니 > " + mkList);
		model.addAttribute("mkList", mkList);
		
		//Todo 목록 가져오기
		List<TodoVO> todoList = this.issueService.todoList(pjtNo);
			//logger.info(pjtNo + ">>>>>>>>>>>>>>> todoList가지고왓니 : " + todoList);
		model.addAttribute("todoList", todoList);
		
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		MemberVO member = this.loginService.loginPost(memberVO);
		//세션 속성명으로 member 사용하여 member객체 세팅
		session.setAttribute("member", member);
		
			//logger.info("member 세션 받아 : " + member.toString());
		
		//글쓴이 이름 가져오기
		List<MemberVO> getMemName = this.issueService.memName();
			//logger.info("getname - " + getMemName);
		model.addAttribute("memName", getMemName);
		
		//일감 이름 가져오기 mainTodoList
		List<TodoVO> getTodoTitle = this.issueService.mainTodoList();
		model.addAttribute("mainTodo" , getTodoTitle);
		
		return "project/issuemain";
	}
	
	//이슈 등록
	@PostMapping("/issuemain.do")
	public String issueInsert(Model model, HttpSession session, @ModelAttribute IssueVO issueVO, @RequestParam String pjtNo) {
		
		String issueNo = this.issueService.issueNoSelect();
		logger.info("가져온 issueNo - "+issueNo);
		model.addAttribute("issueNo", issueNo);
		
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		MemberVO member = this.loginService.loginPost(memberVO);
		String mbrId = member.getMbrId();
		logger.info("가져온 mbrId - "+mbrId);
		model.addAttribute("mbrId", mbrId);
		
		//날짜
		SimpleDateFormat fourteen_format = new SimpleDateFormat ("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String issueYmd = fourteen_format.format(date);
		
		model.addAttribute("issueYmd", issueYmd);
		logger.info("가져온 issueYmd - "+issueYmd);
		
		logger.info("등록할 것 - " + issueVO.toString());
		issueVO.setIssueNo(issueNo);
		issueVO.setMbrId(mbrId);
		issueVO.setIssueYmd(issueYmd);
		logger.info("등록할 것2 - " + issueVO.toString());
		int result = issueService.issueInsert(issueVO);
		logger.info("이슈 등록 - " + issueVO.toString());
		
		return "redirect:/project/issuemain.do?pjtNo="+pjtNo;
	}
	
	//이슈 삭제
	@ResponseBody
	@PostMapping("/issuemain/delete")
	public String issueDelete(@RequestParam String issueNo, String pjtNo) {
		
		int result = issueService.issueDelete(issueNo);
				
		//logger.info("result: " + result);
		
		return "redirect:/project/issuemain.do"+pjtNo;
	}
	
	//이슈 수정
	@ResponseBody
	@PostMapping("/issuemain/update")
	public String issueUpdate(@ModelAttribute IssueVO issueVO, String pjtNo) {
		
		int result = issueService.issueUpdate(issueVO);
		
		logger.info("이슈 수정 : " + result);
		
		
		return "redirect:/project/issuemain.do"+pjtNo;
	}

	
}
