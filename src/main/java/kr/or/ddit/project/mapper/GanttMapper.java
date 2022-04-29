package kr.or.ddit.project.mapper;

import java.util.List;
import java.util.Map;

public interface GanttMapper {
	
	// 일감 가져오기
	public List<Map<String, Object>> todoList(String pjtNo);
	
}
