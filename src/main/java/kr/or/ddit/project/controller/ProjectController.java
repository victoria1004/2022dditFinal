package kr.or.ddit.project.controller;

import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.cloud.service.CloudService;
import kr.or.ddit.project.service.IssueService;
import kr.or.ddit.project.service.ProjectParticipantService;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.project.service.TodoService;
import kr.or.ddit.project.vo.ProjectParticipantVO;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.user.vo.MemberVO;


/**
 * 좌측 메뉴에서 선택한 프로젝트의 상세 페이지
 * @author 정신애
 *
 */
@RequestMapping("/project")
@Controller
public class ProjectController {
	
	@Autowired CloudService cloudService;
	@Autowired ProjectService service;
	@Autowired TodoService todoService;
	@Autowired IssueService issueService;

	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
		/**
		 * 프로젝트 클릭 시 해당 프로젝트의 메인 페이지(상세 페이지)
		 * @param model
		 * @return 프로젝트 메인 뷰
		 */
		@GetMapping("/main.do")
		public String main(Model model, @RequestParam String pjtNo, HttpSession session) {
			//logger.info(pjtNo);
			int total = cloudService.getAllSz(pjtNo);
			model.addAttribute("total", total);																																		
			String changeMb = String.format("%.2f",(double)total/1024/1024); //MB로 변환
			model.addAttribute("changeMb", changeMb);
			logger.info("확인:"+changeMb);
			ProjectVO vo = service.getPjt(pjtNo);
			session.setAttribute("project", vo); //프로젝트 클릭시 세션에 프로젝트 저장
			logger.info("세션 세팅:", vo.toString());
			model.addAttribute("progress", todoService.projectProgress(pjtNo));
			ProjectVO date = service.pjtInfo(pjtNo);
			model.addAttribute("pjt", service.pjtInfo(pjtNo));
			model.addAttribute("pjtMbr", todoService.pjtMember(pjtNo));

			Map<String,Object> plMap  = service.selectPl(pjtNo);
			logger.info("plId: " + plMap.get("MBR_ID"));
			if((((MemberVO)session.getAttribute("member")).getMbrId()).equals( plMap.get("MBR_ID"))
					||(service.pjtMaker(pjtNo)).equals(((MemberVO)session.getAttribute("member")).getMbrId())) {
				model.addAttribute("grant","yes");
			}else {
				model.addAttribute("grant","no");
			}
			ProjectParticipantVO teamVO = new ProjectParticipantVO();
			teamVO.setMbrId((((MemberVO)session.getAttribute("member")).getMbrId()));
			teamVO.setPjtNo(pjtNo);
			
			String role = service.myRole(teamVO);
			
			Map<String , String> myRole = new HashMap<String, String>();
			myRole.put("name", (((MemberVO)session.getAttribute("member")).getMbrNm()));
			myRole.put("role", role);
			
			model.addAttribute("pl", plMap);
			model.addAttribute("issueList", issueService.issueSelectMem(pjtNo));
			model.addAttribute("myRole", myRole);
			
//			model.addAttribute("date",);
			return "project/main";
		}
		
		/**
		 * 프로젝트 메인 페이지 우측-해당 프로젝트의 구성원들 목록 출력
		 * @param pjtNo 메뉴에서 클릭한 프로젝트의 번호
		 * @return 해당 프로젝트의 구성원들 목록
		 */
		@ResponseBody
		@RequestMapping(value="/getAllMbr", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
		public List<MemberVO>  getAllMbr(@RequestParam String pjtNo, HttpSession session){
			MemberVO vo = (MemberVO) session.getAttribute("member");
			Map<String, String> map = new HashMap<String, String>();
			map.put("pjtNo",pjtNo);
			map.put("mbrId",vo.getMbrId()); //접속 중인 사용자부터 정렬하기 위해 세션에서 꺼내와서 넣어줌
			List<MemberVO> list = service.getAllMbr(map);
			logger.info("list"+list.toString());
			
			return service.getAllMbr(map);
		}
		
		/**
		 * 접속한 사용자가 참여 중인 프로젝트 목록 
		 * @param mbrId 접속한 사용자
		 * @return 참여 중인 프로젝트 목록
		 */
		@ResponseBody
		@GetMapping("/getMyPjtList")
		public List<ProjectVO> getMyPjtList(@RequestParam String mbrId){
			return service.getMyPjtList(mbrId);
		}
		
		/**
		 * 해당 프로젝트의 모든 구성원 목록 (신청 승인 뷰에서 사용하는 메서드. 역할까지 담겨있는 hashMap)
		 * @param pjtNo 해당 프로젝트 번호
		 * @return 해당 프로젝트의 모든 구성원 목록
		 */
		@ResponseBody
		@RequestMapping(value="/allPrtpnt", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
		public List<Map<String, Object>> allPrtpnt(@RequestParam String pjtNo){
			return service.allPrtpnt(pjtNo);
		}
		
		/**
		 * 내 일감 상태 개수 가져오기 (ex. 요청:3, 진행중: 4, 완료: 3)
		 * @param session
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="/myTodoCount", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
		public List<Map<String, Object>> myTodoCount(HttpSession session, @RequestParam String pjtNo) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mbrId", ((MemberVO)session.getAttribute("member")).getMbrId());
			map.put("pjtNo", pjtNo);
			
			List<Map<String, Object>> list = todoService.myTodoCount(map);
			return list;
		}
		
		/**
		 * 프젝 구성원 일감 상태 개수 가져오기
		 * @param session
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="/totalTodoCount", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
		public List<Map<String, Object>> totalTodoCount(HttpSession session, @RequestParam String pjtNo) {
			List<String> mbrList = todoService.pjtMember(pjtNo);
			List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
			
			for(int i = 0; i < mbrList.size(); i++) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("mbrId", mbrList.get(i));
				map.put("mbrNm", service.getMbrNm(mbrList.get(i)));
				map.put("pjtNo",  pjtNo);
				List<Map<String, Object>> oneList = todoService.myTodoCount(map);
				map.put("oneList", oneList);
				list.add(map);
			}
			logger.info("list >> " + list);
			return list;
		}
		
}


