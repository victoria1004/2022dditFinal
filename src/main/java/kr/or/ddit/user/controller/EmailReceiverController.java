package kr.or.ddit.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.user.service.EmailReceiverService;
import kr.or.ddit.user.vo.EmailReceiverVO;

@Controller
public class EmailReceiverController {

	private static final Logger logger = LoggerFactory.getLogger(EmailReceiverController.class);
	
	@Autowired
	EmailReceiverService erService;
	
		
	
	
}
