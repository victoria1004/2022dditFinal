package kr.or.ddit.user.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.user.mapper.AlarmMapper;
import kr.or.ddit.user.service.AlarmService;
import kr.or.ddit.user.vo.AlarmVO;


@Service
public class AlarmServiceImpl implements AlarmService {
	
	private static final Logger logger = LoggerFactory.getLogger(AlarmServiceImpl.class);
	
	
	@Autowired AlarmMapper mapper;
	
	//사용자가 안읽은 모든 메시지
	public List<AlarmVO> getAllNotReadedMsg(String mbrId){
		List<AlarmVO> list = mapper.getAllNotReadedMsg(mbrId);
		//logger.info(list.toString());
		return mapper.getAllNotReadedMsg(mbrId);
	};
	
	//사용자가 안읽은 모든 메시지의 갯수
	public int getAllNotReadedCount(String mbrId) {
		return mapper.getAllNotReadedCount(mbrId);
	}

	/**
	 * 채팅,멘션,일감,메일,회의에 참여시 알림 insert
	 * @param sender 보내는 사람
	 * @param CategoryCd 알림 분류 번호(A02 : 멘션알림, A03 : 일감알림)
	 * @param mbrId 받는 사람 아이디
	 * @param data 채팅/멘션/메일 알림 시 보낸 사람의 이름, 일감 알림 시 일감이 추가된 프로젝트 이름, 프로젝트 알림 시 프로젝트 번호
	 * @param location 해당 메시지를 띄운 곳으로 가는 주소값
	 * @return insert 성공 시 1 리턴
	 */
	@Override
	public int insertAlarmMsg(String sender, String CategoryCd, String mbrId, String data, String location) {
		Map<String, String> map = new HashMap<String, String>();
		logger.info("알람보내줄 거 :"+ sender + CategoryCd + mbrId);
		map.put("alrmSndId", sender);
		map.put("alrmCtgrCd", CategoryCd);
		map.put("mbrId", mbrId);
		map.put("data", data);
		map.put("location", location);
		logger.info("알람보내줄 거 map:"+ map.toString());
		return mapper.insertAlarmMsg(map);
	}

	
	
	@Override
	public int updateAlarmMsg(Map<String, String> map) {
		return mapper.updateAlarmMsg(map);
	}

	/**
	 * 멘션, 채팅, 회의 알람 시 알람메시지 insert
	 * @param sender 보내는 사람
	 * @param CategoryCd 알림 분류 번호(A01 : 채팅알림, A04 : 메일알림, A05 : 회의알림, A06 : 프로젝트알림)
	 * @param mbrId 받는 사람 아이디
	 * @param data 채팅/멘션/메일 알림 시 보낸 사람의 이름, 일감 알림 시 일감이 추가된 프로젝트 이름, 프로젝트 알림 시 프로젝트 번호
	 * @return insert 성공 시 1 리턴
	 */
	@Override
	public int insertAlarmMsg(String sender, String CategoryCd, String mbrId, String data) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("alrmSndId", sender);
		map.put("alrmCtgrCd", CategoryCd);
		map.put("mbrId", mbrId);
		map.put("data", data);
		return mapper.insertAlarmMsg(map);
	};
	
	
	
	
	
}
