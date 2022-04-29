package kr.or.ddit.project.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.project.vo.PjtApplyVO;
import kr.or.ddit.project.vo.ProjectParticipantVO;

public interface RecruitmentService {
	
	//모집중인 프로젝트 메인화면에서 뿌리기
	public List<Map<String, Object>> getYforMain();
	
	//모집중인 프로젝트 가져오기
	public List<Map<String, Object>> getY();
	
	//지원 인서트
	public Integer applyInsert(PjtApplyVO vo);    
	
	//이미 지원한 프로젝트인지 확인
	public int checkApply(PjtApplyVO vo);
	
	//해당 프로젝트의 구성원인지 확인
	public int teamCheck(PjtApplyVO vo);
	
	//내가 신청한 프로젝트 정보들
	public List<Map<String , Object>> getApplyPjt(String id);
	
	//지원 취소하기
	public int delApply(String applyNo);
}
