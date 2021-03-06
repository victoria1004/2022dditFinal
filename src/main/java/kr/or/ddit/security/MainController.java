package kr.or.ddit.security;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.project.service.RecruitmentService;
import kr.or.ddit.project.service.TodoService;
import kr.or.ddit.user.vo.MemberVO;

@Controller
public class MainController {
	
	@Autowired
	RecruitmentService recruitmentService;
	@Autowired 
	ProjectService projectService;
	@Autowired 
	TodoService todoService;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	
	
	@RequestMapping("/")
	public String main(HttpSession session, Model model) {
		session.setAttribute("prjNo", null);
		model.addAttribute("recruit", recruitmentService.getYforMain()); //프로젝트 모집 목록
		
		
		//forwarding
		return "main";
	}
	
	@ResponseBody
	@RequestMapping(value="/progressList", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> progressList(HttpSession session, Model model){
		Map<String, Object> totalMap = new HashMap<String, Object>();
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		if((((MemberVO)session.getAttribute("member")).getMbrCtgrCd()).equals("M01")){
			list = projectService.projectAdminList(((MemberVO)session.getAttribute("member")).getMbrId());
		} else {
			list = projectService.projectList(((MemberVO)session.getAttribute("member")).getMbrId());
		}
		List<Map<String, Object>> progressList = new ArrayList<Map<String,Object>>();
		for(int i = 0; i < list.size(); i++) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("progress", todoService.projectProgress((String) list.get(i).get("PJT_NO")));
			progressList.add(map);
		}
		totalMap.put("list", list);
		totalMap.put("progressList", progressList);
		return totalMap;
	}
	
	
	
	
	
}
