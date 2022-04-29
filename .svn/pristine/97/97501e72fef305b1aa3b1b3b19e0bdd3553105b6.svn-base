package kr.or.ddit.project.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.project.mapper.ProjectMakingMapper;
import kr.or.ddit.project.service.ProjectMakingService;
import kr.or.ddit.project.vo.DevelopmentEnvmVO;
import kr.or.ddit.project.vo.KeywordVO;
import kr.or.ddit.project.vo.LayoutVO;
import kr.or.ddit.project.vo.MarkerVO;
import kr.or.ddit.project.vo.ProjectLanguageVO;
import kr.or.ddit.project.vo.ProjectParticipantVO;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.user.vo.MemberVO;

@Service
public class ProjectMakingServiceImpl implements ProjectMakingService {
	@Autowired 
	ProjectMakingMapper mapper;
	
	@Override
	public String getInfo(String mbrId) {
		return mapper.getInfo(mbrId);
	}

	@Override
	public List<DevelopmentEnvmVO> getLogo() {
		return mapper.getLogo();
	}

	@Override
	public int pjtInsert(ProjectVO vo) {
		return mapper.pjtInsert(vo);
	}

	@Override
	public int moduleInsert(LayoutVO vo) {
		return mapper.moduleInsert(vo);
	}

	@Override
	public int langInsert(ProjectLanguageVO vo) {
		return mapper.langInsert(vo);
	}

	@Override
	public int markerInsert(MarkerVO vo) {
		return mapper.markerInsert(vo);
	}

	@Override
	public int keywordInsert(KeywordVO vo) {
		return mapper.keywordInsert(vo);
	}

	@Override
	public int teamInsert(ProjectParticipantVO vo) {
		return mapper.teamInsert(vo);
	}

	@Override
	public MemberVO basicTeam(String id) {
		return mapper.basicTeam(id);
	}

	@Override
	public int pjtDelete(String pjtNo) {
		return mapper.pjtDelete(pjtNo);
	}

	@Override
	public List<ProjectVO> endProject(String id) {
		return mapper.endProject(id);
	}

	@Override
	public List<ProjectVO> earlyEndProject(String id) {
		return mapper.earlyEndProject(id);
	}
	
	

}
