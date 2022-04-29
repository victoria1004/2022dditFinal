package kr.or.ddit.user.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.user.mapper.LoginMapper;
import kr.or.ddit.user.mapper.MbrMapper;
import kr.or.ddit.user.service.LoginService;
import kr.or.ddit.user.vo.MemberVO;
@Service
public class LoginServiceImpl implements LoginService{
	@Autowired
	LoginMapper loginMapper;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(LoginServiceImpl.class);
	
	//회원 로그인
	@Override
	public MemberVO loginPost(MemberVO memberVO) {
		MemberVO member = this.loginMapper.loginPost(memberVO);
		if(member!=null){
			logger.info("memberId : "+ member.getMbrId());
		}	
		return member;
	}
	
	//아이디 찾기
	@Override
	public MemberVO findId(MemberVO memberVO) {
		logger.info("MemberVO"+memberVO.toString());
		MemberVO findMbr = this.loginMapper.findId(memberVO);
		return findMbr;
	}
	
	//비밀번호 찾기
	@Override
	public MemberVO findPw(MemberVO memberVO) {
		logger.info("MemberVO"+memberVO.toString());
		MemberVO findMbr = this.loginMapper.findPw(memberVO);
		return findMbr;
	}
	
	//임시비밀번호로 업데이트
	@Override
	public int pwUpdate(MemberVO memberVO) {
		logger.info("MemberVO"+memberVO.toString());
		int result = this.loginMapper.pwUpdate(memberVO);
		return result;
	}

}
