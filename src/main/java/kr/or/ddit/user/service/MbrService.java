package kr.or.ddit.user.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.user.vo.MemberVO;

public interface MbrService {

	//아이디 중복확인
	public int checkId(String mbrId);
	
	//회원 등록
	public int mbrInsert(MemberVO memberVO);
	
	//회원 정보 수정(사진 포함)
	public int mbrUpdate(MemberVO memberVO);
	
	//회원 정보 수정(사진 제외)
	public int mbrNoImgUpdate(MemberVO memberVO);
	
	//회원정보 조회
	public MemberVO mbrSelect(String mbrId);
	
	//개인 프로젝트 조회
	public List<Map<String,Object>> myProject(String mbrId);
	
	//개인 일감 조회
	public List<Map<String,Object>> myTodo(String mbrId);
	
	//개인 이슈 조회
	public List<Map<String,Object>> myIssue(String mbrId);
	
	//개인 일정 조회
	public List<Map<String,Object>> mySchedule(String mbrId);
	
	//개인 회의실 예약현황 조회
	public List<Map<String,Object>> myMtr(String mbrId);
	
	//개인  비품 대여현황 조회
	public List<Map<String,Object>> myGoods(String mbrId);
}
