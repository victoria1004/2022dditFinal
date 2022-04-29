package kr.or.ddit.feed.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.feed.service.MapService;
import kr.or.ddit.feed.vo.MapVO;

@RequestMapping("/map")
@Controller
public class MapController {
	private static final Logger logger = LoggerFactory.getLogger(MapController.class);
	
	@Autowired
	MapService mapService;
	
	//지도 등록하기
	@RequestMapping(value = "/insertMap.do", method = RequestMethod.POST)
	public void insertMap(@RequestParam String pstNo, @RequestParam String mapLat,
			@RequestParam String mapLot, @RequestParam String mapAddr, @RequestParam String mapPlc) {
		
		logger.info("pstNo"+pstNo);
		logger.info("mapLat"+mapLat);
		logger.info("mapLot"+mapLot);
		logger.info("mapAddr"+mapAddr);
		
		MapVO mapVO = new MapVO();
		mapVO.setPstNo(pstNo);
		mapVO.setMapLat(mapLat);
		mapVO.setMapLot(mapLot);
		mapVO.setMapAddr(mapAddr);

		int insertRes = mapService.insertMap(mapVO);
	}
	
}
