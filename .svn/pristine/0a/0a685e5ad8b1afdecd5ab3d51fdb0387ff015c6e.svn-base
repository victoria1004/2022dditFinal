package kr.or.ddit.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.project.mapper.ProjectUpdateMapper;
import kr.or.ddit.project.service.ProjectUpdateService;
import kr.or.ddit.project.vo.KeywordVO;
import kr.or.ddit.project.vo.LayoutVO;
import kr.or.ddit.project.vo.MarkerVO;
import kr.or.ddit.project.vo.ProjectLanguageVO;
import kr.or.ddit.project.vo.ProjectParticipantVO;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.user.vo.MemberVO;

@Service
public class ProjectUpdateServiceImpl implements ProjectUpdateService {
	@Autowired 
	ProjectUpdateMapper mapper;

	@Override
	public ProjectVO getPjt(String pjtNo) {
		return mapper.getPjt(pjtNo);
	}

	@Override
	public List<LayoutVO> getModule(String pjtNo) {
		return mapper.getModule(pjtNo);
	}

	@Override
	public List<MarkerVO> getMarker(String pjtNo) {
		return mapper.getMarker(pjtNo);
	}

	@Override
	public List<ProjectLanguageVO> getLang(String pjtNo) {
		return mapper.getLang(pjtNo);
	}

	@Override
	public List<ProjectParticipantVO> getMem(String pjtNo) {
		return mapper.getMem(pjtNo);
	}

	@Override
	public MemberVO getTeamInfo(String mbrId) {
		return mapper.getTeamInfo(mbrId);
	}

	@Override
	public List<KeywordVO> getKeyword(String pjtNo) {
		return mapper.getKeyword(pjtNo);
	}

	@Override
	public int delMarker(String pjtNo) {
		return mapper.delMarker(pjtNo);
	}

	@Override
	public int delMem(String pjtNo) {
		return mapper.delMem(pjtNo);
	}

	@Override
	public int delLang(String pjtNo) {
		return mapper.delLang(pjtNo);
	}

	@Override
	public int delKeyword(String pjtNo) {
		return mapper.delKeyword(pjtNo);
	}

	@Override
	public int updatePjt(ProjectVO vo) {
		return mapper.updatePjt(vo);
	}
	
}
