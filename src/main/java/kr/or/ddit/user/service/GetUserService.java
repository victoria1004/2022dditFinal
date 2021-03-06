package kr.or.ddit.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.user.vo.MemberVO;

public interface GetUserService {

	
	//전체 멤버 가져오는 메서드
	public List<MemberVO> getAllUsers(String keyword);
	//한명 멤버 정보 가져오기
	public MemberVO getUser(String mbrId);
	//미승인 멤버 정보 가져오기
	public List<MemberVO> getM03Users(Map<String, String> map);
	//승인 멤버 정보 가져오기
	public List<MemberVO> getM02Users(Map<String, String> map);
	//승인 미승인 업데이트
	public int updateUsersStts(Map<String, String> map);
	//사용자 상태 변경
	public int changeMyStts(Map<String, Object> map);
	//사용자 현재 상태 가져오기
	public int getMyStts(String mbrId);
	//사용자 꺼내기
	public MemberVO getMyInfo(String mbrId);
	//관리자로 지정
	public int addAdmin(String mbrId);
	//관리자 취소
	public int removeAdmin(String mbrId);
	
	
	
}
