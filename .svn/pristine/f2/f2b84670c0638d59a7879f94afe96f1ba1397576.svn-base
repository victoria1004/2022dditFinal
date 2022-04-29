package kr.or.ddit.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.user.mapper.EmailReceiverMapper;
import kr.or.ddit.user.service.EmailReceiverService;
import kr.or.ddit.user.vo.EmailReceiverVO;

@Service
public class EmailReceiverServiceImpl implements EmailReceiverService {

	@Autowired
	EmailReceiverMapper erMapper;

	@Override
	public int emailReceiverInsert(EmailReceiverVO emailReceiverVO) {
		return erMapper.emailReceiverInsert(emailReceiverVO);
	}
	
}
