package kr.or.ddit.user.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import kr.or.ddit.user.controller.LoginController;



@Service
public class MailService {
	private static final Logger logger = 
			LoggerFactory.getLogger(MailService.class);
	@Autowired
	private MailSender mailSender;
	
	public void sendEmail(String fromAddr,String toAddr,String subject,String body) {
		
		SimpleMailMessage smm = new SimpleMailMessage();
		smm.setFrom(fromAddr);
		smm.setTo(toAddr);
		smm.setSubject(subject);
		smm.setText(body);
//		mailSender.send(smm);
		
		logger.info("mailSender=" + mailSender + ", toAddr =" + toAddr);
		
		try{
            this.mailSender.send(smm);
        }
        catch (MailException ex) {
            System.err.println(ex.getMessage());
        }
		
	}
}
