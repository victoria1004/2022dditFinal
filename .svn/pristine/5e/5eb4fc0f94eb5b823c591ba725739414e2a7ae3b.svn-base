package kr.or.ddit.admin.service.impl;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.admin.mapper.LogMapper;
import kr.or.ddit.admin.service.LogService;
import kr.or.ddit.admin.vo.LogVO;

@Service
public class LogServiceImpl implements LogService{
	
	@Autowired
	LogMapper logMapper;

	@Override
	public List<LogVO> logList(Map<String, Object> map) {
		return this.logMapper.logList(map);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return this.logMapper.getTotal(map);
	}

	@Override
	public List<LogVO> totalList() {
		return this.logMapper.totalList();
	}
	
}
