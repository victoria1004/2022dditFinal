package kr.or.ddit.feed.controller;


import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.feed.service.LikesService;
import kr.or.ddit.feed.vo.LikesVO;

@RequestMapping("/feed")
@Controller
public class LikesController {
	private static Logger logger = LoggerFactory.getLogger(LikesController.class);
	
	@Autowired
	LikesService likesService;
	
	//좋아요 추가/삭제
	@ResponseBody
	@PostMapping("/checkLikes.do")
	public Map<String, Integer> CheckLikesPost(Model model, @RequestParam String pstNo, @RequestParam String mbrId) {
		logger.info("pstNo : ", pstNo);
		logger.info("mbrId : ", mbrId);
		
		LikesVO likesVO = new LikesVO();
		likesVO.setMbrId(mbrId);
		likesVO.setPstNo(pstNo);
		
		//좋아요 있는지 확인하기
		int res = likesService.checkLikes(likesVO);
		
		//like가 0이라면 좋아요가 없는 상태 -> insert
		//like가 0이 아니라면 좋아요가 있는 상태 -> delete
		if(res == 0) {
			likesService.insertLikes(likesVO);
		}else {
			likesService.deleteLikes(likesVO);
		}
		int count = likesService.selectLikes(pstNo);
		
		//ajax로 보내서 좋아요 카운트, 좋아요 색 변경할 값
		Map<String, Integer> resMap = new HashMap<String, Integer>();
		resMap.put("myLike", res);
		resMap.put("count", count);
		//0또는 1이 담겨진다.
		return resMap;
	}
	
	
	@RequestMapping(value = "test.do")
	public String test() {
		return "/feed/test";
	}
}
