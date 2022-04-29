package kr.or.ddit.project.service;

import java.util.List;
import java.util.Map;

public interface LayoutService {
	
	// 프로젝트메뉴 출력
	public List<Map<String, Object>> projectSubmenu(String prjNo);
	
}
