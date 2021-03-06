package kr.or.ddit.project.service.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.project.mapper.ProjectMapper;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.project.vo.ProjectParticipantVO;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.user.vo.MemberVO;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Inject ProjectMapper mapper;
	
	@Override
	public List<MemberVO> getAllMbr(Map<String, String> map) {
		return mapper.getAllMbr(map);
	}

	@Override
	public List<ProjectVO> getMyPjtList(String mbrId) {
		return mapper.getMyPjtList(mbrId);
	}

	@Override
	public String getPjtNm(String pjtNo) {
		return mapper.getPjtNm(pjtNo);
	}

	@Override
	public ProjectVO getPjt(String pjtNo) {
		return mapper.getPjt(pjtNo);
	}

	@Override
	public List<Map<String, Object>> allPrtpnt(String pjtNo) {
		return mapper.allPrtpnt(pjtNo);
	}

	@Override
	public int beMyMember(Map<String, Object> map) {
		return mapper.beMyMember(map);
	}

	@Override
	public String getMbrNm(String pjtNo) {
		return mapper.getMbrNm(pjtNo);
	}

	@Override
	public ProjectVO pjtInfo(String pjtNo) {
		return mapper.pjtInfo(pjtNo);
	}

	@Override
	public Map<String, Object> selectPl(String pjtNo) {
		return mapper.selectPl(pjtNo);
	}

	@Override
	public List<Map<String, Object>> projectList(String mbrId) {
		return mapper.projectList(mbrId);
	}

	@Override
	public String pjtMaker(String pjtNO) {
		return mapper.pjtMaker(pjtNO);
	}
 
	@Override
	public List<Map<String, Object>> projectAdminList(String pjtWrtrNm) {
		return mapper.projectAdminList(pjtWrtrNm);
	}

	@Override
	public String myRole(ProjectParticipantVO vo) {
		return mapper.myRole(vo);
	}

	
	
}
