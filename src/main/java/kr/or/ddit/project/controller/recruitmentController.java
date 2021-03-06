package kr.or.ddit.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.project.service.ProjectUpdateService;
import kr.or.ddit.project.service.RecruitmentService;
import kr.or.ddit.project.vo.KeywordVO;
import kr.or.ddit.project.vo.PjtApplyVO;
import kr.or.ddit.project.vo.ProjectLanguageVO;
import kr.or.ddit.project.vo.ProjectParticipantVO;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.user.vo.MemberVO;

@Controller
@RequestMapping("/project")
public class recruitmentController {
	@Autowired
	RecruitmentService service;
	@Autowired
	ProjectUpdateService updateService;
	
	private static final Logger logger= LoggerFactory.getLogger(recruitmentController.class);

	@RequestMapping("/recruitment.do")
	public String recruitmentMain(Model model) {
		
		model.addAttribute("projectList",service.getY());
		return "project/recruitment";
	}
	
	@RequestMapping("/recruitmentDetail.do")
	public String recruitmentDetail(@RequestParam String pjtNo,Model model) {
		model.addAttribute("pjtNo", pjtNo);
		ProjectVO projectVO = updateService.getPjt(pjtNo);
		model.addAttribute("projectVO", projectVO);
		return "project/recruitmentDetail";
	}
	
	//프로젝트 번호에 해당하는 개발언어 가져오기
		@ResponseBody
		@RequestMapping(value="/rcrtLang.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
		public List<String> getLang(@RequestParam String pjtNo){
			List<String> langList = new ArrayList<String>();
			List<ProjectLanguageVO> langs=updateService.getLang(pjtNo);
			
			for(ProjectLanguageVO langVO:langs) {
				langList.add(langVO.getDvlLng());
			}
			
			return langList;
		}
		
		//프로젝트 번호에 해당하는 팀원들 가져오기
		@ResponseBody
		@RequestMapping(value="/rcrtMem.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
		public List<ProjectParticipantVO> getMem(@RequestParam String pjtNo){
			List<ProjectParticipantVO> memList=updateService.getMem(pjtNo);
			logger.info("memList"+memList.toString());
			return memList;
		}
		
		
		  //프로젝트 번호에 해당하는 팀원들의 소속명 가져오기
		  @ResponseBody
		  @RequestMapping(value="/rcrtTeamInfo.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE) 
		  public List<MemberVO> getTeamInfo(@RequestBody Map<String, List<String>> team){
			  List<MemberVO> memList = new ArrayList<MemberVO>();
			  
			  logger.info("받은 파라미터: "+team);
			  for (String mbrId  : team.get("team")) {
				MemberVO member = updateService.getTeamInfo(mbrId);
				 
				memList.add(member);
			  }
			  return memList;
		  }
		  
		  //프로젝트 번호에 해당하는 키워드 가져오기
		  @ResponseBody
		  @RequestMapping(value="/rcrtKeyword.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
		  public List<KeywordVO> getKeyword(@RequestParam String pjtNo){
			  
			  List<KeywordVO> keywordList=updateService.getKeyword(pjtNo);
			  
			  return keywordList;
		  }
		  
		//지원 인서트
			@ResponseBody
			@RequestMapping(value="/applyInsert.do", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
			public void applyInsert(@RequestParam String pjtNo, String content, HttpSession session) {
				logger.info(content);
				
				PjtApplyVO applyVO = new PjtApplyVO();
				
				applyVO.setPjtNo(pjtNo);
				applyVO.setPjtApplyCn(content);
				applyVO.setPjtApplyWrtrId(((MemberVO)session.getAttribute("member")).getMbrId());
				
				Integer result = service.applyInsert(applyVO);
			}
			
		  //이미 신청한 프로젝트인지 혹은 이미 프로젝트 구성원인지 체크
		  @ResponseBody
		  @RequestMapping(value="/checkApply.do", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
		  public String checkApply(@RequestParam String pjtNo,HttpSession session) {
			  PjtApplyVO applyVO = new PjtApplyVO();
			  applyVO.setPjtNo(pjtNo);
			  applyVO.setPjtApplyWrtrId(((MemberVO)session.getAttribute("member")).getMbrId());
			  
			  int result = service.checkApply(applyVO);
			  int result2 = service.teamCheck(applyVO);
			  
			  logger.info("1:" + result);
			  logger.info("2:" + result2);
			  
			  if(result>0 || result2>0) { //이미 신청한 경우이거나 이미 프로젝트 구성원인경우
				  return "no";
			  }
			  return "yes";
		  }
		  
		//내가 신청한 프로젝트 게시판 메인이동
		 @RequestMapping(value="/applyList.do")
		 public String applyList(HttpSession session, Model model) {
			 
			model.addAttribute("applyList",
					service.getApplyPjt(((MemberVO)session.getAttribute("member")).getMbrId()));
			 
			 return "project/applyList";
		 }
		 
		 //지원 취소하기
		 @RequestMapping(value="/applyListDelete.do", method = RequestMethod.POST)
		 public String applyListDelete(String applyNo) {
			 service.delApply(applyNo);
			 return "project/applyList";
		 }
		

}
