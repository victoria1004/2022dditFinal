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

import com.google.gson.Gson;

import kr.or.ddit.project.service.ProjectMakingService;
import kr.or.ddit.project.service.ProjectUpdateService;
import kr.or.ddit.project.vo.KeywordVO;
import kr.or.ddit.project.vo.LayoutVO;
import kr.or.ddit.project.vo.MarkerVO;
import kr.or.ddit.project.vo.ProjectLanguageVO;
import kr.or.ddit.project.vo.ProjectParticipantVO;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.user.service.AlarmService;
import kr.or.ddit.user.vo.MemberVO;
import lombok.extern.java.Log;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/project")
public class ProjectUpdateController {
	@Autowired
	ProjectUpdateService service;
	@Autowired
	ProjectMakingService makingService;
	@Autowired
	AlarmService alarmService;
	
	private static final Logger log= LoggerFactory.getLogger(ProjectUpdateController.class);

	//프로젝트 번호에 해당하는 프로젝트 객체 가져오기
	@RequestMapping("/projectUpdate.do")
	public String projectUpdate(Model model,@RequestParam String pjtNo) {
		ProjectVO projectVO = service.getPjt(pjtNo); //나중에 세션에서 프젝 번호 가져오기
		log.info("projectVO: "+ projectVO);
		model.addAttribute("projectVO", projectVO);
		return "project/projectUpdate";
	}
	
	//프로젝트 번호에 해당하는 모듈 가져오기
	@ResponseBody
	@RequestMapping(value="/getModule.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<String> getModule(String pjtNo){
		log.info("11111111111111111111 : " + pjtNo);
		List<String> modules = new ArrayList<String>();
		
		List<LayoutVO> moduleList = service.getModule(pjtNo); //나중에 세션에서 프젝 번호 가져오기
		for(LayoutVO module: moduleList) {
			modules.add(module.getLytNo());
		}
		log.info(modules.toString());
		return modules;
	}
	
	//프로젝트 번호에 해당하는 마커 가져오기
	@ResponseBody
	@RequestMapping(value="/getMarker.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<MarkerVO> getMarker(String pjtNo){
		log.info("22222222222222222 : " + pjtNo);
		List<MarkerVO> markerList=service.getMarker(pjtNo);  //나중에 세션에서 프젝 번호 가져오기
		
		return markerList;
	}
	
	//프로젝트 번호에 해당하는 개발언어 가져오기
	@ResponseBody
	@RequestMapping(value="/getLang.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<String> getLang(String pjtNo){
		log.info("3333333333333333333 : " + pjtNo);
		List<String> langList = new ArrayList<String>();
		List<ProjectLanguageVO> langs=service.getLang(pjtNo);
		
		for(ProjectLanguageVO langVO:langs) {
			langList.add(langVO.getDvlLng());
		}
		
		return langList;
	}
	
	//프로젝트 번호에 해당하는 팀원들 가져오기
	@ResponseBody
	@RequestMapping(value="/getMem.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<ProjectParticipantVO> getMem(String pjtNo){
		log.info("444444444444444 : " + pjtNo);
		List<ProjectParticipantVO> memList=service.getMem(pjtNo);
		log.info("memList"+memList.toString());
		return memList;
	}
	
	
	  //프로젝트 번호에 해당하는 팀원들의 소속명 가져오기
	  @ResponseBody
	  @RequestMapping(value="/getTeamInfo.do", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE) 
	  public List<MemberVO> getTeamInfo(@RequestParam Map<String, Object> team,@RequestBody String pjtNo){
		  Gson gson = new Gson();
		  List<String> teams = gson.fromJson((String)team.get("team"),List.class);
		  
		  List<MemberVO> memList = new ArrayList<MemberVO>();
		  
		  log.info("555555555555555555 : " + pjtNo);
		  log.info("받은 파라미터: "+team);
		  for (String mbrId  : teams) {
			MemberVO member = service.getTeamInfo(mbrId);
			 
			memList.add(member);
		  }
		  return memList;
	  }
	  
	  //프로젝트 번호에 해당하는 키워드 가져오기
	  @ResponseBody
	  @RequestMapping(value="/getKeyword", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	  public List<KeywordVO> getKeyword(String pjtNo){
		  log.info("6666666666666666666 : " + pjtNo);
		  List<KeywordVO> keywordList=service.getKeyword(pjtNo);
		  
		  return keywordList;
		  
	  }
	  
	  //업데이트
	  @ResponseBody
	  @RequestMapping(value="/allUpdate.do", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	  public String allUpdate(HttpSession session,ProjectVO pjtVO,@RequestParam(required = false) Map<String, Object> idArr,
				@RequestParam(required = false) Map<String, Object> langArr,@RequestParam(required = false) Map<String, Object> keywordArr,
				@RequestParam(required = false)  Map<String, Object> mkNameArr,@RequestParam(required = false)  Map<String, Object> mkColorArr,
				@RequestParam(required = false) Map<String, Object> mkIconArr,@RequestParam(required=false) Map<String, Object>roleArr) {
		  
		    Gson gson = new Gson();
			String pjtNo = (String) session.getAttribute("prjNo");

			// 마커삭제
			service.delMarker(pjtNo);
			// 개발언어 삭제
			service.delLang(pjtNo);
			// 키워드 삭제
			service.delKeyword(pjtNo);
			
			//프로젝트 업데이트
			pjtVO.setPjtNo(pjtNo);
			String[] Date = pjtVO.getPjtStrtYmd().split("~");
			log.info("start:" + Date[0].trim() + "trimCheck");
			log.info("end:" + Date[1].trim());

			pjtVO.setPjtStrtYmd(Date[0].trim());
			pjtVO.setPjtEndYmd(Date[1].trim());

			service.updatePjt(pjtVO);
			
			//프로젝트 키워드 데이터 정리 및 인서트
			  List<String> keywords = gson.fromJson((String)keywordArr.get("keywordArr"),List.class);
			  
			  for(String keyword: keywords) {
				  KeywordVO keywordVO = new KeywordVO();
				  keywordVO.setKwdNm(keyword);
				  keywordVO.setPjtNo(pjtNo);
				  
				  makingService.keywordInsert(keywordVO);
			  
			  }
			 
			//프로젝트 개발언어 데이터 정리 및 인서트
				List<String> languages = gson.fromJson((String)langArr.get("langArr"), List.class);
				
				for(String language : languages) {
					ProjectLanguageVO langVO = new ProjectLanguageVO();
					langVO.setDvlLng(language);
					langVO.setPjtNo(pjtNo);
					
					makingService.langInsert(langVO);
				}
			  
			
			//이슈 마커 데이터 정리 및 인서트
			List<String> mkNames = gson.fromJson((String)mkNameArr.get("mkNameArr"), List.class);
			List<String> mkColors = gson.fromJson((String)mkColorArr.get("mkColorArr"), List.class);
			List<String> mkIcons = gson.fromJson((String)mkIconArr.get("mkIconArr"), List.class);
			
			for(int i=0;i<mkNames.size();i++) {
				MarkerVO markerVO = new MarkerVO();
				markerVO.setPjtNo(pjtNo);
				markerVO.setMrkrNm(mkNames.get(i));
				markerVO.setMrkrIcn(mkIcons.get(i));
				markerVO.setMrkrClr(mkColors.get(i));
				
				makingService.markerInsert(markerVO);
			}
			
			//멤버와 역할 데이터 정리 및 인서트
			List<String> ids = gson.fromJson((String)idArr.get("idArr"), List.class);
			List<String> roles = gson.fromJson((String)roleArr.get("roleArr"), List.class);
			
			//기존 멤버 가져오기
			List<ProjectParticipantVO> memList=service.getMem(pjtNo);
			//아이디만 들어있는 list 만들기
			List<String> onlyId = new ArrayList<String>();
			for(ProjectParticipantVO vo: memList) {
				onlyId.add(vo.getMbrId());
			}
			
			//새로 받은 멤버 리스트와 기존 멤버리스트를 비교하여 새로 추가된 멤버 리스트 가리기
			List<String> newMem = new ArrayList<String>();
			
			for(int i=0;i<ids.size();i++) {
				for(int j=0;j<onlyId.size();j++) {
					if(!(ids.get(i).equals(onlyId.get(j)))) {
						newMem.add(ids.get(i));
					}
				}
			}
			
			// 프로젝트 멤버 삭제
			service.delMem(pjtNo);
			
			for(int i=0;i<ids.size();i++) {
				ProjectParticipantVO partVO = new ProjectParticipantVO();
				partVO.setPjtNo(pjtNo);
				partVO.setMbrId(ids.get(i));
				partVO.setPjtPrtpntRl(roles.get(i));
				
				makingService.teamInsert(partVO);
			}
			
			//새로 추가된 멤버에게만 알림 보내기
			for(String newOne: newMem) {
				alarmService.insertAlarmMsg(((MemberVO)session.getAttribute("member")).getMbrId(), "A06", newOne,pjtNo);
			}
			return pjtNo;
		    
	  }
	  
	  //프로젝트 정보 페이지(수정 불가 페이지)
	  @RequestMapping(value="/projectInfo.do")
	  public String projectInfo(Model model,@RequestParam String pjtNo) {
		  ProjectVO projectVO = service.getPjt(pjtNo); //나중에 세션에서 프젝 번호 가져오기
			log.info("projectVO: "+ projectVO);
			model.addAttribute("projectVO", projectVO);
		  return "project/projectInfo";
	  }
}
