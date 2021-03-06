package kr.or.ddit.project.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.project.mapper.RecruitmentMapper;
import kr.or.ddit.project.service.RecruitmentService;
import kr.or.ddit.project.vo.PjtApplyVO;
import kr.or.ddit.project.vo.ProjectParticipantVO;
@Service
public class RecruitmentServiceImpl implements RecruitmentService {
	@Autowired 
	RecruitmentMapper mapper;

	@Override
	public List<Map<String, Object>> getY() {
		return mapper.getY();
	}

	@Override   
	public Integer applyInsert(PjtApplyVO vo) {
		return mapper.applyInsert(vo);
	}

	@Override
	public int checkApply(PjtApplyVO vo) {
		return mapper.checkApply(vo);
	}

	@Override
	public int teamCheck(PjtApplyVO vo) {
		return mapper.teamCheck(vo);
	}

	@Override
	public List<Map<String, Object>> getApplyPjt(String id) {
		return mapper.getApplyPjt(id);
	}

	@Override
	public List<Map<String, Object>> getYforMain() {
		return mapper.getYforMain();
	}
	@Override
	public int delApply(String applyNo) {
		return mapper.delApply(applyNo);
	}

	
	
	

	
}
