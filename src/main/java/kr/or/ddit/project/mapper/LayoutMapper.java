package kr.or.ddit.project.mapper;

import java.util.List;
import java.util.Map;

public interface LayoutMapper {
	
	
	// 프로젝트메뉴 출력
	public List<Map<String, Object>> projectSubmenu(String prjNo);
	
}
