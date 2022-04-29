package kr.or.ddit.chat.service;

import java.util.List;

import kr.or.ddit.chat.vo.ChatRoomVO;
import kr.or.ddit.chat.vo.ChatVO;

public interface ChatService {

	
	// room마다 채팅List
	public List<ChatVO> chatContent(String chatrmNo);
	
	// 채팅 말풍선 삽입
	public int chatBubbleInsert(ChatVO chatVo);
	
}
