package kr.or.ddit.admin.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.admin.vo.LogVO;

public interface LogMapper {
	
	// Log list 출력
	public List<LogVO> logList(Map<String, Object> map); 
	
	// Log 전체 개수
	public int getTotal(Map<String, Object> map);
	
	// Log 전체 리스트
	public List<LogVO> totalList();
	
	
}
