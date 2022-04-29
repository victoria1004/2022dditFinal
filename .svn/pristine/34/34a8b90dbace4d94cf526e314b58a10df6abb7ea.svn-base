package kr.or.ddit.chat.service;

import java.util.List;

import kr.or.ddit.admin.vo.LogVO;
import kr.or.ddit.chat.vo.ChatRoomVO;
import kr.or.ddit.user.vo.MemberVO;

public interface ChatRoomService {
	
	// room list 출력
	public List<ChatRoomVO> roomList(String mbrId); 
	
	// 채팅방 만들기
	public int chatRoomMake(ChatRoomVO chatRoomVO);
	
	// 채팅방 번호 최대값 + 1
	public int chatMaxNum();
	
	// 채팅방 인원 추가하기
	public int userInsert(ChatRoomVO chatRoomVO);
	
	// 멤버 정보
	public MemberVO memInfo(String mbrId);
}
