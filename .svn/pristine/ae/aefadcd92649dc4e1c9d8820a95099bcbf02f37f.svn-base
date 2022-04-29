package kr.or.ddit.project.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.project.mapper.LayoutMapper;
import kr.or.ddit.project.service.LayoutService;

@Service
public class LayoutServiceImpl implements LayoutService{

	
	@Autowired
	LayoutMapper layoutMapper;
	
	@Override
	public List<Map<String, Object>> projectSubmenu(String prjNo) {
		return this.layoutMapper.projectSubmenu(prjNo);
	}

}