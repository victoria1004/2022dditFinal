package kr.or.ddit.feed.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.feed.service.VtRsltService;
import kr.or.ddit.feed.vo.VtRsltVO;

@RequestMapping("/vote")
@Controller
public class VtRsltController {
	private static final Logger logger = LoggerFactory.getLogger(VtRsltController.class);
	
	@Autowired
	VtRsltService vtRsltService;

	//투표 항목 선택 시 insert
	@ResponseBody
	@PostMapping("/insertRslt.do")
	public Map<String, Integer> getRslt(Model model, @RequestParam String vtNo, @RequestParam String optnNo, @RequestParam String mbrId) {
		logger.info("vtNo"+vtNo);
		logger.info("optnNo"+optnNo);
		
		VtRsltVO vtRsltVO = new VtRsltVO();
		
		vtRsltVO.setVtNo(vtNo);
		vtRsltVO.setOptnNo(optnNo);
		vtRsltVO.setMbrId(mbrId);
		
		//내 투표 확인하기
		int res = vtRsltService.checkRslt(vtRsltVO);
		
		//res가 0이면 투표 안한 상태 -> insert
		if(res == 0) {
			vtRsltService.insertRslt(vtRsltVO);
		}
		
		//투표 수
//		List<Map<String, Object>> getCount = vtRsltService.getCount(vtRsltVO);
		
		//투표 전체 결과 조회
		List<Map<String, Object>> resVt = vtRsltService.rsltList();
		
//		String counting = (String)resVt.get(resVt.size()-1).get("COUNT");
		
		//투표 항목별 사람 이름, 아이디 뽑기
		List<Map<String, Object>> voter = vtRsltService.getVoter(vtRsltVO);
		
//		model.addAttribute("resVt", resVt);
//		model.addAttribute("vtVoter", voter);
//		model.addAttribute("vtCnt",counting);
		
		Map<String, Integer> resMap = new HashMap<String, Integer>();
		resMap.put("vtRslt", res);
//		resMap.put("vtCount", getCount);
		
		return resMap;
	}
	
	//투표 선택 수정 
	@RequestMapping(value = "updateRslt.do", method = RequestMethod.POST)
	public String updateRslt() {
		
		return "";
	}
	
}
