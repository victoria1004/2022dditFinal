package kr.or.ddit.user.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.user.vo.AlarmVO;

public interface AlarmService {

	//사용자가 안읽은 모든 메시지
	public List<AlarmVO> getAllNotReadedMsg(String mbrId);
	
	//사용자가 안읽은 모든 메시지의 갯수
	public int getAllNotReadedCount(String mbrId);
	
	//멘션,일감,프로젝트에 참여시 알림 insert
	public int insertAlarmMsg(String sender, String CategoryCd, String mbrId, String data, String location);
	
	//채팅,메일,회의에 참여시 알림 insert
	public int insertAlarmMsg(String sender, String CategoryCd, String mbrId, String data);
	
	//알림메시지 읽었을때 확인 표시
	public int updateAlarmMsg(Map<String, String> map);
	
	
	
	
}
