package kr.or.ddit.project.service;

import java.util.List;

import kr.or.ddit.project.vo.KeywordVO;
import kr.or.ddit.project.vo.LayoutVO;
import kr.or.ddit.project.vo.MarkerVO;
import kr.or.ddit.project.vo.ProjectLanguageVO;
import kr.or.ddit.project.vo.ProjectParticipantVO;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.user.vo.MemberVO;

public interface ProjectUpdateService {
	// 프로젝트 번호에 해당하는 프로젝트 객체 가져오기
	public ProjectVO getPjt(String pjtNo);

	// 프로젝트 번호에 해당하는 모듈 가져오기
	public List<LayoutVO> getModule(String pjtNo);

	// 프로젝트 번호에 해당하는 마커 가져오기
	public List<MarkerVO> getMarker(String pjtNo);

	// 프로젝트 번호에 해당하는 개발언어 가져오기
	public List<ProjectLanguageVO> getLang(String pjtNo);

	// 프로젝트 번호에 해당하는 프로젝트 팀원들 가져오기
	public List<ProjectParticipantVO> getMem(String pjtNo);

	// 프로젝트 번호에 해당하는 팀원들의 소속명 가져오기
	public MemberVO getTeamInfo(String mbrId);

	// 프로젝트 번호에 해당하는 키워드 가져오기
	public List<KeywordVO> getKeyword(String pjtNo);

	// 프로젝트 번호에 해당하는 마커들 삭제
	public int delMarker(String pjtNo);

	// 프로젝트 번호에 해당하는 팀원들 지우기
	public int delMem(String pjtNo);

	// 프로젝트 번호에 해당하는 개발언어들 지우기
	public int delLang(String pjtNo);

	// 프로젝트 번호에 해당하는 키워드 지우기
	public int delKeyword(String pjtNo);
	
	//프로젝트 수정
	public int updatePjt(ProjectVO vo);

}
