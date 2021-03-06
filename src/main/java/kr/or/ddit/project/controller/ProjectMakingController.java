package kr.or.ddit.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.ddit.cloud.service.CloudService;
import kr.or.ddit.project.service.ProjectMakingService;
import kr.or.ddit.project.vo.DevelopmentEnvmVO;
import kr.or.ddit.project.vo.KeywordVO;
import kr.or.ddit.project.vo.LayoutVO;
import kr.or.ddit.project.vo.MarkerVO;
import kr.or.ddit.project.vo.ProjectLanguageVO;
import kr.or.ddit.project.vo.ProjectParticipantVO;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.user.service.AlarmService;
import kr.or.ddit.user.vo.MemberVO;


@Controller
@RequestMapping("/project")
public class ProjectMakingController {
	@Autowired
	ProjectMakingService service;
	@Autowired
	CloudService cloudService;
	@Autowired
	AlarmService alarmService;
	
	private static final Logger logger= LoggerFactory.getLogger(ProjectMakingController.class);

	@RequestMapping("/projectMaking.do")
	public String projectMaking(HttpSession session, Model model) {
		model.addAttribute("me",
				service.basicTeam(((MemberVO)session.getAttribute("member")).getMbrId()));
		return "project/projectMaking";
	}
	
	@ResponseBody
	@RequestMapping(value="/getInfo.do", method=RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
	public List<String> getInfo(@RequestParam Map<String, Object> nameArr) {
		Gson gson = new Gson();
		List<String> list = gson.fromJson((String)nameArr.get("nameArr"), List.class);
		logger.info(list.toString());
		List<String> deptList = new ArrayList<String>();
		
		  for(String mbrId : list) {
			  deptList.add(service.getInfo(mbrId));
		  }
		  
		  logger.info("????????? ??????:"+deptList);
		  return deptList;
	}
	
	@ResponseBody
	@RequestMapping(value="/getLogo.do", method=RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
	public List<DevelopmentEnvmVO> getLogo(){
		List<DevelopmentEnvmVO> list = service.getLogo();
		
		for(DevelopmentEnvmVO vo: list) {
			logger.info("vo : " + vo.toString());
		}
		return list;
				
	}
	
	@ResponseBody
	@RequestMapping(value="/getAll.do", method=RequestMethod.POST)
	public String getAll(HttpSession session, ProjectVO pjtVO, @RequestParam(required = false) Map<String, Object> layouts, @RequestParam(required = false) Map<String, Object> idArr,
			@RequestParam(required = false) Map<String, Object> langArr,@RequestParam(required = false) Map<String, Object> keywordArr,
			@RequestParam(required = false)  Map<String, Object> mkNameArr,@RequestParam(required = false)  Map<String, Object> mkColorArr,
			@RequestParam(required = false) Map<String, Object> mkIconArr,@RequestParam(required=false) Map<String, Object>roleArr) {
		
		//???????????? ????????? ?????? ??? ?????????
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		if(memberVO.getMbrCtgrCd().equals("M01")) { //?????????????????? ?????? ???????????? 
			pjtVO.setPjtCtgrNo("P01");
		}else {
			pjtVO.setPjtCtgrNo("P02");  //???????????? ?????? ?????? ????????????
		}
		
		pjtVO.setPjtWrtrNm(memberVO.getMbrId());
		  
	    String[] Date = pjtVO.getPjtStrtYmd().split("~");
	    logger.info("start:"+Date[0].trim()+"trimCheck");
	    logger.info("end:"+Date[1].trim());
	  
	    pjtVO.setPjtStrtYmd(Date[0].trim()); 
	    pjtVO.setPjtEndYmd(Date[1].trim());
	  
	    //pjtNo : null
	    logger.info("projectVO:"+pjtVO.toString());
	    int result = service.pjtInsert(pjtVO);
	    logger.info("projectVO:"+pjtVO.toString());
	    
	    //???????????? ?????? ?????? ????????? ?????? ??? ?????????
		Gson gson = new Gson();
		List<String> modules = gson.fromJson((String)layouts.get("layouts"), List.class);
		
		if(modules.size()>0||modules!=null) {
			for(String module: modules) {
				LayoutVO layoutVO = new LayoutVO();
				layoutVO.setLytNo(module);
				layoutVO.setPjtNo(pjtVO.getPjtNo());
				
				service.moduleInsert(layoutVO);
				}
		}
		//???????????? ???????????? ????????? ?????? ??? ?????????
		List<String> languages = gson.fromJson((String)langArr.get("langArr"), List.class);
		
		if(languages.size()>0||languages!=null) {
			for(String language : languages) {
				ProjectLanguageVO langVO = new ProjectLanguageVO();
				langVO.setDvlLng(language);
				langVO.setPjtNo(pjtVO.getPjtNo());
				
				service.langInsert(langVO);
				}
		}
		//???????????? ????????? ????????? ?????? ??? ?????????
		  List<String> keywords = gson.fromJson((String)keywordArr.get("keywordArr"),List.class);
		  
		  if(keywords.size()>0||keywords!=null) {
			  for(String keyword: keywords) {
				  KeywordVO keywordVO = new KeywordVO();
				  keywordVO.setKwdNm(keyword);
				  keywordVO.setPjtNo(pjtVO.getPjtNo());
				  
				  service.keywordInsert(keywordVO);
			  
			  }
		 }
		
		//?????? ?????? ????????? ?????? ??? ?????????
		List<String> mkNames = gson.fromJson((String)mkNameArr.get("mkNameArr"), List.class);
		List<String> mkColors = gson.fromJson((String)mkColorArr.get("mkColorArr"), List.class);
		List<String> mkIcons = gson.fromJson((String)mkIconArr.get("mkIconArr"), List.class);
		
		if(mkNames.size()>0||mkNames!=null) {
			for(int i=0;i<mkNames.size();i++) {
				MarkerVO markerVO = new MarkerVO();
				markerVO.setPjtNo(pjtVO.getPjtNo());
				markerVO.setMrkrNm(mkNames.get(i));
				markerVO.setMrkrIcn(mkIcons.get(i));
				markerVO.setMrkrClr(mkColors.get(i));
				
				service.markerInsert(markerVO);
			}
		}
		
		//????????? ?????? ????????? ?????? ??? ?????????
		List<String> ids = gson.fromJson((String)idArr.get("idArr"), List.class);
		List<String> roles = gson.fromJson((String)roleArr.get("roleArr"), List.class);
		
		if(ids.size()>0||ids!=null) {
			for(int i=0;i<ids.size();i++) {
				ProjectParticipantVO partVO = new ProjectParticipantVO();
				partVO.setPjtNo(pjtVO.getPjtNo());
				partVO.setMbrId(ids.get(i));
				partVO.setPjtPrtpntRl(roles.get(i));
				if(!((MemberVO)session.getAttribute("member")).getMbrId().equals(memberVO.getMbrId())) {
				alarmService.insertAlarmMsg(memberVO.getMbrId(), "A06", ids.get(i),pjtVO.getPjtNo());
				}
				service.teamInsert(partVO);
			}
		}
		
		session.setAttribute("project", pjtVO);
		
		cloudService.mkCloud(pjtVO.getPjtNo(), pjtVO.getPjtNm());
		
		return pjtVO.getPjtNo();
	}
	
	//???????????? ??????
	@RequestMapping(value="/projectDelete.do")
	public String projectDelete(@RequestParam String pjtNo) {
		service.pjtDelete(pjtNo);
		return "project/main";
	}

}
