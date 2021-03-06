package kr.or.ddit.user.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.user.mapper.GetUserMapper;
import kr.or.ddit.user.service.GetUserService;
import kr.or.ddit.user.vo.MemberVO;

@Service
public class GetUserServiceImpl implements GetUserService {

	@Autowired GetUserMapper mapper;
	
	
	@Override
	public List<MemberVO> getAllUsers(String keyword) {
		return mapper.getAllUsers(keyword);
	}


	@Override
	public MemberVO getUser(String mbrId) {
		return mapper.getUser(mbrId);
	}


	@Override
	public List<MemberVO> getM03Users(Map<String, String> map) {
		return mapper.getM03Users(map);
	}


	@Override
	public List<MemberVO> getM02Users(Map<String, String> map) {
		return mapper.getM02Users(map);
	}


	@Override
	public int updateUsersStts(Map<String, String> map) {
		return mapper.updateUsersStts(map);
	}


	@Override
	public int changeMyStts(Map<String, Object> map) {
		return mapper.changeMyStts(map);
	}


	@Override
	public int getMyStts(String mbrId) {
		return mapper.getMyStts(mbrId);
	}

	@Override
	public MemberVO getMyInfo(String mbrId) {
		return mapper.getMyInfo(mbrId);
	}


	@Override
	public int addAdmin(String mbrId) {
		return mapper.addAdmin(mbrId);
	}


	@Override
	public int removeAdmin(String mbrId) {
		return mapper.removeAdmin(mbrId);
	}

	
	
	
	
}
