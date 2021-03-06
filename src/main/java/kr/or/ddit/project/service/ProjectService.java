package kr.or.ddit.project.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.project.vo.ProjectParticipantVO;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.user.vo.MemberVO;

public interface ProjectService {

	//해당 프로젝트의 모든 구성원 목록
	public List<MemberVO> getAllMbr(Map<String, String> map);
	
	//사용자가 참여 중인 프로젝트 목록
	public List<ProjectVO> getMyPjtList(String mbrId);
	
	//프로젝트 번호로 프로젝트 이름 꺼내기 <-이거 왜했는지 기억이 안남
	public String getPjtNm(String pjtNo);
	
	//프로젝트 번호로 프로젝트 꺼내서 세션 저장용
	public ProjectVO getPjt(String pjtNo);
	
	//해당 프로젝트의 모든 구성원 목록(모집 중인 프로젝트 신청 승인 뷰에서 사용하는 메서드)
	public List<Map<String, Object>> allPrtpnt(String pjtNo);
	
	//신청자 프로젝트 구성원 insert
	public int beMyMember(Map<String, Object> map);
	
	// 프로젝트 인원 이름
	public String getMbrNm(String pjtNo);
	
	// 프로젝트 번호
	public ProjectVO pjtInfo(String pjtNo);
	
	// 프로젝트 리더 찾기
	public Map<String, Object> selectPl(String pjtNo);
	
	// 프로젝트 마감남은순으로 4가지 뽑기
	public List<Map<String, Object>> projectList(String mbrId);
	
	//프로젝트 생성자 찾기
	public String pjtMaker(String pjtNO);
	
	// 관리자가 만드 프로젝트 리스트 마감직전인거 4개 출력
	public List<Map<String, Object>> projectAdminList(String pjtWrtrNm);
	
	//사용자 프로젝트 역할 찾기
	public String myRole(ProjectParticipantVO vo);
}
