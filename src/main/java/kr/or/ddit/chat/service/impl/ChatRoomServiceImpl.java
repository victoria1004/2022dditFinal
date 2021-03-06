package kr.or.ddit.chat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.admin.vo.LogVO;
import kr.or.ddit.chat.mapper.ChatMapper;
import kr.or.ddit.chat.service.ChatRoomService;
import kr.or.ddit.chat.vo.ChatRoomVO;
import kr.or.ddit.user.vo.MemberVO;

@Service
public class ChatRoomServiceImpl implements ChatRoomService{

	@Autowired
	ChatMapper chatMapper;
	
	@Override
	public List<ChatRoomVO> roomList(String mbrId) {
		return this.chatMapper.roomList(mbrId);
	}

	@Override
	public int chatRoomMake(ChatRoomVO chatRoomVO) {
		return this.chatMapper.chatRoomMake(chatRoomVO);
	}

	@Override
	public int chatMaxNum() {
		return this.chatMapper.chatMaxNum();
	}

	@Override
	public int userInsert(ChatRoomVO chatRoomVO) {
		return this.chatMapper.userInsert(chatRoomVO);
	}

	@Override
	public MemberVO memInfo(String mbrId) {
		return this.chatMapper.memInfo(mbrId);
	}

}
