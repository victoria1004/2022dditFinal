package kr.or.ddit.project.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.project.mapper.PjtApplyMapper;
import kr.or.ddit.project.service.PjtApplyService;

@Service
public class PjtApplyServiceImpl implements PjtApplyService {

	@Autowired PjtApplyMapper mapper;

	@Override
	public List<Map<String, Object>> getAllApplicant(Map<String, Object> map) {
		return mapper.getAllApplicant(map);
	}

	@Override
	public int becomePrtpnt(String mbrId) {
		return mapper.becomePrtpnt(mbrId);
	}

	@Override
	public int denyUser(Map<String, Object> map) {
		return mapper.denyUser(map);
	}
	
	
	
	
	
	
	
	
}
