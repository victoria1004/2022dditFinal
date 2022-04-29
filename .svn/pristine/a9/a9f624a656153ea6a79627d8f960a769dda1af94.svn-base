package kr.or.ddit.project.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.project.service.LayoutService;

@Controller
@RequestMapping("/aside")
public class LayoutController {
	private static final Logger logger = LoggerFactory.getLogger(LayoutController.class);
	
	@Autowired
	LayoutService layoutService;
	
	@ResponseBody
	@RequestMapping(value = "/selectPrj", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public void setProjectNo(@RequestParam String prjNo, HttpSession session) {
		session.setAttribute("prjNo", prjNo);
		logger.info("projNoSession>>>>>>>>>>>>" + session.getAttribute("prjNo"));
	}
	
	@ResponseBody
	@RequestMapping(value = "/projectSubmenu", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Map<String, Object>> projectSubmenu(HttpSession session, @RequestParam String sessionNo) {
		String prjNo = sessionNo;
		List<Map<String, Object>> list = this.layoutService.projectSubmenu(prjNo);
		return list;
	}
}
