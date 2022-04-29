package kr.or.ddit.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.project.service.PjtApplyService;
import kr.or.ddit.project.service.ProjectService;

/**
 * 모집 중인 프로젝트에 신청한 사용자 데이터
 * @author 정신애
 *
 */
@RequestMapping("/project")
@Controller
public class PjtApplyController {

	@Autowired PjtApplyService service;
	@Autowired ProjectService projectService;
	
	private static final Logger logger = LoggerFactory.getLogger(PjtApplyController.class);	
	
	
	/**
	 * 프로젝트 생성한 사용자가 모집 중인 프로젝트들에 신청한 사람들 목록 뷰
	 * @param mbrId 프로젝트 생성한 사용자
	 * @return
	 */
	@GetMapping("/pjtApply.do")
	public String pjtApply() {
		return "project/pjtApply";
	}
	
	/**
	 * 해당 프로젝트에 신청한 사용자 목록 
	 * @param mbrId 프로젝트 작성자
	 * @param user 작성자가 선택한 신청자 아이디
	 * 
	 * @return 신청자 목록
	 */
	@ResponseBody
	@RequestMapping(value="/getAllApplicant", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Map<String, Object>> getAllApplicant(@RequestParam String mbrId, @RequestParam(required = false) String user){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mbrId", mbrId); //프로젝트 작성자에게 신청한 모든 정보 조회
		map.put("user", user); //선택한 사용자의 신청내용 조회
		return service.getAllApplicant(map);
	}
	
	
	/**
	 * 신청 승인 시 신청여부 Y로 업데이트
	 * @param mbrId 승인할 신청자의 아이디
	 * @return 승인 성공 시 1 리턴
	 */
	@ResponseBody
	@GetMapping("/becomePrtpnt")
	public int becomePrtpnt(@RequestParam Map<String, Object> map) {
		int finalResult = 0;
		if(service.becomePrtpnt((String)map.get("mbrId")) > 0) { //구성원에도 추가
			finalResult = projectService.beMyMember(map);
		}
		return finalResult;
	}
	
	/**
	 * 내가 생성한 프로젝트에 신청한 사용자를 거절하는 메서드
	 * @param map - rsn : 거절사유, user : 거절하는 id, pjtNo : user가 신청한 프로젝트의 번호
	 * @return 업데이트 성공 시 1 리턴
	 */
	@ResponseBody
	@PostMapping("/denyUser")
	public int denyUser(@RequestParam Map<String, Object> map) {
		return service.denyUser(map);
	}
	
}
