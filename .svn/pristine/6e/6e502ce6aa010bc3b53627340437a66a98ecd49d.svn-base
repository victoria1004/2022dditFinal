package kr.or.ddit.project.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.project.vo.DevelopmentEnvmVO;
import kr.or.ddit.project.vo.KeywordVO;
import kr.or.ddit.project.vo.LayoutVO;
import kr.or.ddit.project.vo.MarkerVO;
import kr.or.ddit.project.vo.ProjectLanguageVO;
import kr.or.ddit.project.vo.ProjectParticipantVO;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.user.vo.MemberVO;


@Mapper
public interface ProjectMakingMapper {
	//로그인한 회원의 정보 가져오기
	public MemberVO basicTeam(String id);
	
	//회원 아이디로 소속 찾기
	public String getInfo(String mbrId);
	
	//모든 개발언어 로고 가져오기
	public List<DevelopmentEnvmVO> getLogo();
	
	//프로젝트 인서트
	public int pjtInsert(ProjectVO vo);
	
	//모듈 인서트
	public int moduleInsert(LayoutVO vo);
	
	//프로젝트 개발 언어 인서트
	public int langInsert(ProjectLanguageVO vo);
	
	//이슈 마커 인서트
	public int markerInsert(MarkerVO vo);
	
	//키워드 인서트
	public int keywordInsert(KeywordVO vo);
	
	//프로젝트 팀원 인서트
	public int teamInsert(ProjectParticipantVO vo);
	
	//프로젝트 삭제
	public int pjtDelete(String pjtNo);
	
	//종료된 프로젝트
	public List<ProjectVO> endProject(String id);
	
	//일찍 종료된 프로젝트
	public List<ProjectVO> earlyEndProject(String id);
	
}
