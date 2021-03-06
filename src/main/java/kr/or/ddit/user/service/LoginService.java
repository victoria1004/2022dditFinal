package kr.or.ddit.user.service;

import kr.or.ddit.user.vo.MemberVO;

public interface LoginService {
	//회원 로그인
	public MemberVO loginPost(MemberVO memberVO);
	
	//아이디 찾기
	public MemberVO findId(MemberVO memberVO);
	
	//비밀번호 찾기
	public MemberVO findPw(MemberVO memberVO);
	
	//임시비밀번호로 업데이트
	public int pwUpdate(MemberVO memberVO);
	
}
