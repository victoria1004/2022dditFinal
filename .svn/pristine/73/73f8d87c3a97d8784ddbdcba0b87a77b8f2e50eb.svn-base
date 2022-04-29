package kr.or.ddit.project.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.project.mapper.TodoHistoryMapper;
import kr.or.ddit.project.service.TodoHistoryService;
import kr.or.ddit.project.vo.TodoHistoryVO;

@Service
public class TodoHistoryServiceImpl implements TodoHistoryService {

	@Autowired TodoHistoryMapper mapper;

	@Override
	public int insertHistory(TodoHistoryVO vo) {
		return mapper.insertHistory(vo);
	}

	@Override
	public List<Map<String,Object>> getMyHistory(String tdNo) {
		return mapper.getMyHistory(tdNo);
	}


	
	
	
	
	
	
	
}

