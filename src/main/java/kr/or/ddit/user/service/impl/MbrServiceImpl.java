package kr.or.ddit.user.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.user.mapper.MbrMapper;
import kr.or.ddit.user.service.MbrService;
import kr.or.ddit.user.vo.MemberVO;
@Service
public class MbrServiceImpl implements MbrService{

	@Autowired
	MbrMapper mbrMapper;
	
	private static final Logger logger = 
			LoggerFactory.getLogger(MbrServiceImpl.class);
	
	//아이디 중복확인
	@Override
	public int checkId(String mbrId) {
		logger.info("mbrId : " + mbrId);
		int result = this.mbrMapper.checkId(mbrId);
		return result;
	}
	
	//회원 등록
	@Override
	public int mbrInsert(MemberVO memberVO) {
		logger.info("insertMemberVO"+memberVO.toString());
		int result = this.mbrMapper.mbrInsert(memberVO);
		return result;
	}

	//회원정보 변경(사진 포함)
	@Override
	public int mbrUpdate(MemberVO memberVO) {
		logger.info("updateMemberVO"+memberVO.toString());
		int result = this.mbrMapper.mbrUpdate(memberVO);
		return result;
	}

	//회원정보 변경(사진 제외)
	@Override
	public int mbrNoImgUpdate(MemberVO memberVO) {
		logger.info("updateNoImgMemberVO"+memberVO.toString());
		int result = this.mbrMapper.mbrNoImgUpdate(memberVO);
		return result;
	}
	
	//회원정보 조회
	@Override
	public MemberVO mbrSelect(String mbrId) {
		MemberVO memberVO = this.mbrMapper.mbrSelect(mbrId);
		return memberVO;
	}

	//개인 프로젝트목록 조회
	@Override
	public List<Map<String, Object>> myProject(String mbrId) {
		List<Map<String,Object>> myProjectList = this.mbrMapper.myProject(mbrId); 
		return myProjectList;
	}
	
	//개인 일감목록 조회
	@Override
	public List<Map<String, Object>> myTodo(String mbrId) {
		List<Map<String,Object>> myTodoList = this.mbrMapper.myTodo(mbrId); 
		return myTodoList;
	}
	
	//개인 이슈목록 조회
	@Override
	public List<Map<String, Object>> myIssue(String mbrId) {
		List<Map<String,Object>> myIssueList = this.mbrMapper.myIssue(mbrId); 
		return myIssueList;
	}

	//개인 일정목록 조회
	@Override
	public List<Map<String, Object>> mySchedule(String mbrId) {
		List<Map<String,Object>> myScheduleList = this.mbrMapper.mySchedule(mbrId); 
		return myScheduleList;
	}

	//개인 회의실 대여현황 조회
	@Override
	public List<Map<String, Object>> myMtr(String mbrId) {
		List<Map<String,Object>> myMtrList = this.mbrMapper.myMtr(mbrId); 
		return myMtrList;
	}

	//개인 비품대여현황 조회
	@Override
	public List<Map<String, Object>> myGoods(String mbrId) {
		List<Map<String,Object>> myGoodsList = this.mbrMapper.myGoods(mbrId); 
		return myGoodsList;
	}

	

}
