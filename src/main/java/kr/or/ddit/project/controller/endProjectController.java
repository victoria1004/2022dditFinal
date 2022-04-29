package kr.or.ddit.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.project.service.ProjectMakingService;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.user.vo.MemberVO;

@Controller
@RequestMapping("/project")
public class endProjectController {
	@Autowired ProjectMakingService service;
	
	private static final Logger logger= LoggerFactory.getLogger(endProjectController.class);

	@RequestMapping(value="/endProject.do")
	public String endProject(HttpSession session, Model model) {
		List<ProjectVO> endProjectList= service.endProject(((MemberVO)session.getAttribute("member")).getMbrId());
		List<ProjectVO> earlyEndProjectList = service.earlyEndProject(((MemberVO)session.getAttribute("member")).getMbrId());
		
		model.addAttribute("endProjectList",endProjectList);
		model.addAttribute("earlyEndProjectList",earlyEndProjectList);
		return "project/endProject";
	}

}
