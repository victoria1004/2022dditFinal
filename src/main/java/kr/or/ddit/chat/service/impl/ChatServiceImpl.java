package kr.or.ddit.chat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.chat.mapper.ChatMapper;
import kr.or.ddit.chat.service.ChatService;
import kr.or.ddit.chat.vo.ChatRoomVO;
import kr.or.ddit.chat.vo.ChatVO;

@Service
public class ChatServiceImpl implements ChatService {

	
	@Autowired
	ChatMapper chatMapper;
	
	@Override
	public List<ChatVO> chatContent(String chatrmNo) {
		return this.chatMapper.chatContent(chatrmNo);
	}

	@Override
	public int chatBubbleInsert(ChatVO chatVo) {
		return this.chatMapper.chatBubbleInsert(chatVo);
	}

}
