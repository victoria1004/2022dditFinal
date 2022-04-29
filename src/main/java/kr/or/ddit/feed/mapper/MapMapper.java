package kr.or.ddit.feed.mapper;

import java.util.List;

import kr.or.ddit.feed.vo.MapVO;

public interface MapMapper {
	
	//지도 등록
	public int insertMap(MapVO mapVO);

	//지도 목록
	public List<MapVO> selectMap();
	
	//지도 수정
	public int updateMap(MapVO mapVO);

	//지도 삭제
	public int deleteMap(String mapNo);
}
