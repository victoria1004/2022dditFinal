package kr.or.ddit.project.service;

import java.util.List;
import java.util.Map;

public interface GanttService {
	
	// 일감 가져오기
	public List<Map<String, Object>> todoList(String pjtNo);	
}
