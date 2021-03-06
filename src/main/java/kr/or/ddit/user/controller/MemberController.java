package kr.or.ddit.user.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItem;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;

import org.apache.commons.io.IOUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import org.apache.commons.collections4.MapUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.project.ArticlePage;
import kr.or.ddit.project.service.ProjectMakingService;
import kr.or.ddit.project.service.RecruitmentService;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.user.service.MbrService;
import kr.or.ddit.user.vo.MemberVO;
import kr.or.ddit.util.LogCrud;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/mbr")
public class MemberController {

	private static final Logger logger = 
			LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MbrService mbrService;
	
	@Autowired
	LoginController loginController;
	
	@Autowired 
	ProjectMakingService service;
	
	
	//id중복검사
	@RequestMapping(value = "/checkId.do")
	//     @ResponseBody Object to Json 프로토콜로 변경
	public @ResponseBody int checkId(@RequestParam HashMap<String, Object> params) {
		//받은 데이터 확인
		logger.info("mbrId : {}", params);
		
		String mbrId = MapUtils.getString(params, "mbrId");
		//동일 아이디 수 세기
		int result = mbrService.checkId(mbrId);
		
		return result;
	}
	
	
	//회원등록
	@RequestMapping(value = "/mbrinsert.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> mbrInsert(MemberVO memberVO) throws Exception {
		
		//받은 데이터 확인
		logger.info("MemberVO : "+memberVO.toString());
		
		//업로드한 파일 객체(배열)
		MultipartFile[] mbrProfile = memberVO.getMbrProfile();
		String profileName = mbrProfile[0].getOriginalFilename();
		
		if(!profileName.equals("")){
		
			//파일명 처리(UUID 사용)
			//UUID:동일한 이름으로 업로드되면 기존 파일을 지우게 되므로 이를 방지하기위해 사용
			UUID uuid = UUID.randomUUID();
			String mbrImg = uuid.toString() + "-" + mbrProfile[0].getOriginalFilename();
			System.out.println("fileName"+mbrImg);
			
			//파일 저장 경로 설정
			String mbrImgPath = "D:\\A_TeachingMaterial\\7.LastProject\\workspace\\doIT\\src\\main\\webapp\\resources\\profileImage";
			
			//비밀번호 암호화
			String memberPw = memberVO.getMbrPw();
			String encMemberPw = loginController.getSHA256(memberPw);
			logger.info(encMemberPw);
					
			//VO에 세팅(회원구분 포함)
			memberVO.setMbrCtgrCd("M03");
			memberVO.setMbrNm(new String(memberVO.getMbrNm().getBytes("8859_1"), "UTF-8"));
			memberVO.setMbrDept(new String(memberVO.getMbrDept().getBytes("8859_1"), "UTF-8"));
			memberVO.setMbrIntro(new String(memberVO.getMbrIntro().getBytes("8859_1"), "UTF-8"));
			memberVO.setMbrImg(mbrImg);
			memberVO.setMbrImg(new String(memberVO.getMbrImg().getBytes("8859_1"), "UTF-8"));
			memberVO.setMbrImgPath(mbrImgPath);
			memberVO.setMbrImgPath(new String(memberVO.getMbrImgPath().getBytes("8859_1"), "UTF-8"));
			memberVO.setMbrPw(encMemberPw);
			memberVO.setMbrStts(1);
			
			System.out.println(mbrImg);
			//파일 생성
			File saveFile = new File(mbrImgPath,mbrImg);
			
			//파일 업로드
			try {
				mbrProfile[0].transferTo(saveFile);
			}catch (Exception e) {
				logger.info(e.getMessage());
			}
			
			//insert할 정보 확인
			logger.info("MemberVO : "+memberVO.toString());
			
			//insert처리
			int insertResult = mbrService.mbrInsert(memberVO);
			LogCrud.getCreate("LoginController");
			System.out.println(insertResult);
			if (insertResult>0) { //고객 등록 성공
				System.out.println("성공");
				Map<String, Object> result = new HashMap<>();
				result.put("msg", "가입 신청이 완료되었습니다.\\n가입 승인 후 로그인해 주세요.");
				result.put("sta", "success");
				
				return result;
			}else { //고객 등록 실패
				Map<String, Object> result = new HashMap<>();
				result.put("msg", "가입 신청에 실패했습니다.\\n,다시 신청해 주세요.");
				result.put("sta", "fail");
				return result;
			}
			
		}else {  //프로필 사진을 등록하지 않은 경우
			//File객체 생성
			File file = new File("D:\\A_TeachingMaterial\\7.LastProject\\workspace\\doIT\\src\\main\\webapp\\resources\\profileImage\\profileimage.png");
	        FileItem fileItem = new DiskFileItem("originFile", Files.probeContentType(file.toPath()), false, file.getName(), (int) file.length(), file.getParentFile());

	        try {
	            InputStream input = new FileInputStream(file);
	            OutputStream os = fileItem.getOutputStream();
	            IOUtils.copy(input, os);
	        } catch (IOException ex) {
	        }

	        //multipartFile 변환
	        MultipartFile mFile = new CommonsMultipartFile(fileItem);  
	       
			//파일명 처리(UUID 사용)
			//UUID:동일한 이름으로 업로드되면 기존 파일을 지우게 되므로 이를 방지하기위해 사용
			UUID uuid = UUID.randomUUID();
			String mbrImg = uuid.toString() + "-" + mFile.getOriginalFilename();
			System.out.println(mbrImg);
			
			//파일 저장 경로 설정
			String mbrImgPath = "D:\\A_TeachingMaterial\\7.LastProject\\workspace\\doIT\\src\\main\\webapp\\resources\\profileImage";
			
			//비밀번호 암호화
			String memberPw = memberVO.getMbrPw();
			String encMemberPw = loginController.getSHA256(memberPw);
			logger.info(encMemberPw);
					
			//VO에 세팅(회원구분 포함)
			memberVO.setMbrCtgrCd("M03");
			memberVO.setMbrNm(new String(memberVO.getMbrNm().getBytes("8859_1"), "UTF-8"));
			memberVO.setMbrDept(new String(memberVO.getMbrDept().getBytes("8859_1"), "UTF-8"));
			memberVO.setMbrIntro(new String(memberVO.getMbrIntro().getBytes("8859_1"), "UTF-8"));
			memberVO.setMbrImg(mbrImg);
			memberVO.setMbrImg(new String(memberVO.getMbrImg().getBytes("8859_1"), "UTF-8"));
			memberVO.setMbrImgPath(mbrImgPath);
			memberVO.setMbrImgPath(new String(memberVO.getMbrImgPath().getBytes("8859_1"), "UTF-8"));
			memberVO.setMbrPw(encMemberPw);
			memberVO.setMbrStts(1);
			
			//파일 생성
			File saveFile = new File(mbrImgPath,mbrImg);
			
			//파일 업로드
			try {
				mFile.transferTo(saveFile);
			}catch (Exception e) {
				logger.info(e.getMessage());
			}
			
			//insert할 정보 확인
			logger.info("MemberVO : "+memberVO.toString());
			
			//insert처리
			int insertResult = mbrService.mbrInsert(memberVO);
			LogCrud.getCreate("LoginController");
			System.out.println(insertResult);
			if (insertResult>0) { //고객 등록 성공
				System.out.println("성공");
				Map<String, Object> result = new HashMap<>();
				result.put("msg", "가입 신청이 완료되었습니다.\\n가입 승인 후 로그인해 주세요.");
				result.put("sta", "success");
				
				return result;
			}else { //고객 등록 실패
				Map<String, Object> result = new HashMap<>();
				result.put("msg", "가입 신청에 실패했습니다.\\n,다시 신청해 주세요.");
				result.put("sta", "fail");
				return result;
			}
		}
	}
	
	//회원정보 수정
	@RequestMapping(value = "/mbrUpdate.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> mbrUpdate(MemberVO memberVO) throws Exception {
		
		//받은 데이터 확인
		logger.info("originUpdateMemberVO : "+memberVO.toString());
		
		//업로드한 파일 객체(배열)
		MultipartFile[] mbrProfile = memberVO.getMbrProfile();
		String profileName = mbrProfile[0].getOriginalFilename();
		
		if(!profileName.equals("")){
		
			//파일명 처리(UUID 사용)
			//UUID:동일한 이름으로 업로드되면 기존 파일을 지우게 되므로 이를 방지하기위해 사용
			UUID uuid = UUID.randomUUID();
			String mbrImg = uuid.toString() + "-" + mbrProfile[0].getOriginalFilename();
			
			//파일 저장 경로 설정
			String mbrImgPath = "D:\\A_TeachingMaterial\\7.LastProject\\workspace\\doIT\\src\\main\\webapp\\resources\\profileImage";
			
			//비밀번호 암호화
			String memberPw = memberVO.getMbrPw();
			String encMemberPw = loginController.getSHA256(memberPw);
			logger.info(encMemberPw);
			
			//VO에 세팅(회원구분 포함)
			memberVO.setMbrCtgrCd("M02");
			memberVO.setMbrNm(new String(memberVO.getMbrNm().getBytes("8859_1"), "UTF-8"));
			memberVO.setMbrDept(new String(memberVO.getMbrDept().getBytes("8859_1"), "UTF-8"));
			memberVO.setMbrIntro(new String(memberVO.getMbrIntro().getBytes("8859_1"), "UTF-8"));
			memberVO.setMbrImg(mbrImg);
			memberVO.setMbrImg(new String(memberVO.getMbrImg().getBytes("8859_1"), "UTF-8"));
			memberVO.setMbrImgPath(mbrImgPath);
			memberVO.setMbrImgPath(new String(memberVO.getMbrImgPath().getBytes("8859_1"), "UTF-8"));
			memberVO.setMbrPw(encMemberPw);
			
			//파일 생성
			File saveFile = new File(mbrImgPath,mbrImg);
			
			//파일 업로드
			try {
				mbrProfile[0].transferTo(saveFile);
			}catch (Exception e) {
				logger.info(e.getMessage());
			}
			
			//update할 정보 확인
			logger.info("MemberVO : "+memberVO.toString());
			
			//update처리
			int updateResult = mbrService.mbrUpdate(memberVO);
			LogCrud.getModify("MemberController");
			System.out.println(updateResult);
			if (updateResult>0) { //고객 정보 수정 성공
				System.out.println("수정 성공");
				Map<String, Object> result = new HashMap<>();
				result.put("sta", "success");
				return result;
			}else { //고객 정보 수정 실패
				Map<String, Object> result = new HashMap<>();
				result.put("sta", "fail");
				return result;
			}
		}else {
			//비밀번호 암호화
			String memberPw = memberVO.getMbrPw();
			String encMemberPw = loginController.getSHA256(memberPw);
			logger.info(encMemberPw);
			
			//VO에 세팅(회원구분 포함)
			memberVO.setMbrCtgrCd("M02");
			memberVO.setMbrNm(new String(memberVO.getMbrNm().getBytes("8859_1"), "UTF-8"));
			memberVO.setMbrDept(new String(memberVO.getMbrDept().getBytes("8859_1"), "UTF-8"));
			memberVO.setMbrIntro(new String(memberVO.getMbrIntro().getBytes("8859_1"), "UTF-8"));
			memberVO.setMbrPw(encMemberPw);
			
			//update할 정보 확인
			logger.info("MemberVO : "+memberVO.toString());
			
			//update처리
			int updateResult = mbrService.mbrNoImgUpdate(memberVO);
			LogCrud.getModify("MemberController");
			System.out.println(updateResult);
			if (updateResult>0) { //고객 정보 수정 성공
				System.out.println("수정 성공");
				Map<String, Object> result = new HashMap<>();
				result.put("sta", "success");
				return result;
			}else { //고객 정보 수정 실패
				Map<String, Object> result = new HashMap<>();
				result.put("sta", "fail");
				return result;
			}
		}
		
	}
	
	//회원정보 조회
	@RequestMapping(value = "/mbrSelect.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> mbrSelect(String sesMbrId) {
		
		//받은 정보 확인
		String selectMbrId = sesMbrId; 
		//logger.info("selectMbrId:"+selectMbrId);
		//받은 정보로 회원정보 조회
		MemberVO memVO = this.mbrService.mbrSelect(selectMbrId);
		
		if(memVO==null){
			
			Map<String,Object> result = new HashMap<>();
			result.put("sta", "fail");
			return result;
		}else {
			
			Map<String,Object> result = new HashMap<>();
			result.put("sta", "success");
			result.put("member", memVO);
			return result;
		}
	}
	//회원 개인 업무정보 페이지 연결
	@GetMapping("/myTask.do")
	public String getTask(String mbrId, HttpSession session, Model model) {
		
		List<ProjectVO> endProjectList= service.endProject(((MemberVO)session.getAttribute("member")).getMbrId());
		List<ProjectVO> earlyEndProjectList = service.earlyEndProject(((MemberVO)session.getAttribute("member")).getMbrId());
		
		model.addAttribute("endProjectList",endProjectList);
		model.addAttribute("earlyEndProjectList",earlyEndProjectList);
		return "user/myTask";
	}
	
	//개인 업무정보 조회
	@RequestMapping(value = "/myTodo.do", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String,Object>> mbrTodo(String mbrId) {
	  
		System.out.println(mbrId);
		List<Map<String,Object>> todoList = mbrService.myTodo(mbrId);
		
		if(todoList==null) {
			System.out.println("todoList : null");
		}else{
			logger.info("todoList :"+todoList.toString());
		}
		
		return todoList;
	}
	
	//개인 일정 조회
	@RequestMapping(value = "/mySchedule.do", method = RequestMethod.POST) 
	@ResponseBody
	public List<Map<String, Object>> mbrSchedule(String mbrId) {
		
		System.out.println(mbrId);
		
		List<Map<String,Object>> scheduleList = mbrService.mySchedule(mbrId);
		if(scheduleList==null) {
			System.out.println("scheduleList : null");
		}else{
			logger.info("scheduleList :"+scheduleList.toString());
		}
		return scheduleList; 
	}
	
	//개인 이슈 조회
	@RequestMapping(value = "/myIssue.do", method = RequestMethod.POST) 
	@ResponseBody
	public List<Map<String, Object>> mbrIssue(String mbrId) {
		
		System.out.println(mbrId);
		
		List<Map<String,Object>> issueList = mbrService.myIssue(mbrId);
		if(issueList==null) {
			System.out.println("issueList : null");
		}else{
			logger.info("issueList :"+issueList.toString());
		}
		return issueList; 
	}
	
	//개인 회의실 예약 현황 조회
	@RequestMapping(value = "/myMtrRes.do", method = RequestMethod.POST) 
	@ResponseBody
	public List<Map<String, Object>> mbrMtrRes(String mbrId) {
		
		System.out.println(mbrId);
		
		List<Map<String,Object>> mtrResList = mbrService.myMtr(mbrId);
		if(mtrResList==null) {
			System.out.println("mtrResList : null");
		}else{
			logger.info("mtrResList :"+mtrResList.toString());
		}
		return mtrResList; 
	}
	
	//개인 비품 대여 현황 조회
	@RequestMapping(value = "/myGoods.do", method = RequestMethod.POST) 
	@ResponseBody
	public List<Map<String, Object>> mbrGoods(String mbrId) {
		
		System.out.println(mbrId);
		
		List<Map<String,Object>> goodsList = mbrService.myGoods(mbrId);
		if(goodsList==null) {
			System.out.println("mtrResList : null");
		}else{
			logger.info("goodsList :"+goodsList.toString());
		}
		return goodsList; 
	}
	 
		
}
