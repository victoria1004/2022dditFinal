package kr.or.ddit.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.project.service.GanttService;
import kr.or.ddit.project.vo.TodoVO;

@RequestMapping("/project")
@Controller
public class GanttController {
	
	@Autowired
	GanttService ganttService;
	
	@GetMapping("/gantt.do")
	public String ganttMain(Model model, @RequestParam String pjtNo) {
		model.addAttribute("pjtNo", pjtNo);
		return "project/gantt";
	}
	
	@ResponseBody
	@RequestMapping(value = "/todoList", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Map<String, Object>> todoList(HttpSession session) {
		String prjNo = (String) session.getAttribute("prjNo");
		List<Map<String, Object>> list = this.ganttService.todoList(prjNo);
		return list;
	}
	
	
	
	
}
