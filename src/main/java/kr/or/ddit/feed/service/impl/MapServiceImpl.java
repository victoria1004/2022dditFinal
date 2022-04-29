package kr.or.ddit.feed.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.feed.mapper.MapMapper;
import kr.or.ddit.feed.service.MapService;
import kr.or.ddit.feed.vo.MapVO;

@Service
public class MapServiceImpl implements MapService {
	
	@Autowired
	private MapMapper mapMapper;

	@Override
	public int insertMap(MapVO mapVO) {
		return mapMapper.insertMap(mapVO);
	}

	@Override
	public List<MapVO> selectMap() {
		return mapMapper.selectMap();
	}

	@Override
	public int updateMap(MapVO mapVO) {
		return mapMapper.updateMap(mapVO);
	}

	@Override
	public int deleteMap(String mapNo) {
		return mapMapper.deleteMap(mapNo);
	}

}
