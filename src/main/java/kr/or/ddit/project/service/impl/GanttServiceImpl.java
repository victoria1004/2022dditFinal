package kr.or.ddit.project.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.project.mapper.GanttMapper;
import kr.or.ddit.project.mapper.LayoutMapper;
import kr.or.ddit.project.service.GanttService;
import kr.or.ddit.project.service.LayoutService;

@Service
public class GanttServiceImpl implements GanttService{

	@Autowired
	GanttMapper ganttMapper;

	@Override
	public List<Map<String, Object>> todoList(String pjtNo) {
		return this.ganttMapper.todoList(pjtNo);
	}

}
