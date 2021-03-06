package kr.or.ddit.project.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.project.ArticlePage;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.project.service.ReportService;
import kr.or.ddit.project.service.impl.ProjectServiceImpl;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.project.vo.ReportVO;
import kr.or.ddit.project.vo.TrsmFileVO;
import kr.or.ddit.user.service.LoginService;
import kr.or.ddit.user.vo.MemberVO;

@RequestMapping("/project")
@Controller
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	@Autowired
	ReportService reportService;
	@Autowired
	LoginService loginService;
	@Autowired
	ProjectService service;
	
	//업무보고 목록
	@GetMapping("/report.do")
//	http://localhost/project/report.do?currentPage=1&pjtNo=1&keyword=
	public String reportList(Model model, HttpSession session, @RequestParam String pjtNo
			, @RequestParam(defaultValue = "1", required=false) int currentPage
			, @RequestParam(defaultValue = "10", required=false) int size
			, @RequestParam(required=false) String keyWord) {
		
		logger.info("파라미터로 받은 키워드 :"+keyWord);
		
		//세션에 member객체 세팅
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		MemberVO member = this.loginService.loginPost(memberVO);
		session.setAttribute("member", member);
		logger.info("피드 세션 member: " + member.toString());
		
		//세션에 project세팅
		ProjectVO vo = service.getPjt(pjtNo);
		session.setAttribute("project", vo);
		logger.info("프로젝트 세션 project :", vo.toString());
		
		//페이징 처리
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pjtNo", pjtNo);
		map.put("currentPage", currentPage);
		map.put("size", size);
		map.put("keyWord", keyWord);
		
		int total = reportService.reportTotal(map);
		//페이징 처리
		List<Map<String, Object>> repList = reportService.reportList(map);
//		List<List<Map<String, Object>>> lists = Lists.partition(repList, size);
		model.addAttribute("list", new ArticlePage(total, currentPage, size, 5, repList));
		model.addAttribute("total", total);

		
		return "project/reportMain";
	}
	
	//업무보고 작성화면
	@GetMapping("/reportInsert.do")
	public String reportInsert(Model model, HttpSession session, @RequestParam String pjtNo) {
		//세션에 member객체 세팅
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		MemberVO member = this.loginService.loginPost(memberVO);
		session.setAttribute("member", member);
		logger.info("피드 세션 member: " + member.toString());
		
		//세션에 project세팅
		ProjectVO vo = service.getPjt(pjtNo);
		session.setAttribute("project", vo);
		logger.info("프로젝트 세션 project :", vo.toString());
		
		//해당 프로젝트 번호의 PL 넣기(보고 승인/반려)
		List<Map<String, Object>> mbr = service.allPrtpnt(pjtNo);
		model.addAttribute("mbr",mbr);
		
		return "project/reportInsert";
	}
	
	//업무보고 작성 완료 시
	@PostMapping("/rptInsertPost.do")
	public String rptInsertPost(HttpSession session, @RequestParam String pjtNo,
			@RequestParam String rptCtgrNm, @RequestParam String rptTtl, @RequestParam String rptCn,
			@RequestParam(defaultValue = "1", required=false) int currentPage, 
			@RequestParam(defaultValue = "10", required=false) int size,
			@RequestParam String rptWrtrId, @RequestParam MultipartFile[] uploadFile) throws UnsupportedEncodingException {
		
		logger.info("form으로 보낸 pjtNo"+pjtNo);
		logger.info("form으로 보낸 rptCtgrNm"+rptCtgrNm);
		
		ReportVO vo = new ReportVO();
		
		//report객체 생성 후 파라미터로 받은 값 넣어주기
		vo.setPjtNo(pjtNo);
		vo.setRptCtgrNm(rptCtgrNm);
		vo.setRptWrtrId(rptWrtrId);
		
		//form에서 multipart/form-data로 보낼 시 한글 깨짐현상  처리
		String ttl;
		String cn;
		try {
			ttl = new String(rptTtl.getBytes("8859_1"), "UTF-8");
			cn = new String(rptCn.getBytes("8859_1"), "UTF-8");
			logger.info("form으로 보낸 rptTtl"+ttl);
			logger.info("form으로 보낸 rptCn"+cn);
			vo.setRptTtl(ttl);
			vo.setRptCn(cn);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logger.info("form으로 보낸 rptWrtrId"+rptWrtrId);
		logger.info("form으로 보낸 uploadFile"+uploadFile);
		
		int result = reportService.reportInsert(vo);
		if(result > 0) {
			logger.info("db에 업무보고넣기 성공");
		}else {
			logger.info("db에 업무보고넣기 실패");
		}

		TrsmFileVO trsmVO = new TrsmFileVO();
		//방금 넣은 report의 번호를 뽑자
		String getRptNo = reportService.selectRptNo();
		logger.info("getRptNo"+getRptNo);
		trsmVO.setRptNo(getRptNo);
		
		//업로드 시 사용될 폴더
		String uploadFolder = "D:/A_TeachingMaterial/7.LastProject/workspace/doIT/src/main/webapp/resources/TrsmFile";
		
		
		
		for(MultipartFile multipartFile : uploadFile) {
			logger.info("파일명 : " + multipartFile.getOriginalFilename());			
			logger.info("파일크기 : " + multipartFile.getSize());
			
			//UUID 파일명 처리 시작
			//동일한 이름으로 업로드되면 기존 파일을 지우게 되므로 이를 방지하기 위함
			UUID uuid = UUID.randomUUID();
			String fileNm = uuid.toString() + "_" + multipartFile.getOriginalFilename();
			File saveFile = new File(uploadFolder, fileNm);
			
			try {
				//파일 실제명을 담기
//				trsmVO.setTrsmFileNm(name);
				trsmVO.setTrsmFileNm(multipartFile.getOriginalFilename()); //파일 실제 이름을 vo에 저장
				//파일 저장 경로 담기
				trsmVO.setTrsmFileAddr(saveFile.getPath());
				
				//transferTO() : 물리적으로 파일 업로드가 됨
				multipartFile.transferTo(saveFile);
				
				//DB에 넣기
				logger.info("trsmVO는 :"+trsmVO.toString());
				int trsmInsert = reportService.trsmFileUpload(trsmVO);
				
				if(trsmInsert > 0) {
					logger.info("첨부파일 업로드 성공");
				}else {
					logger.info("첨부파일 업로드 실패");
				}
				
			}catch(Exception e){
				logger.info(e.getMessage());
			}
			
		}
		return "redirect:/project/report.do?currentPage=1&pjtNo="+vo.getPjtNo()+"&keyword=";
	}
	
	//업무보고 상세 페이지
	@GetMapping("/reportDetail.do")
	public String reportDetail(HttpSession session, Model model, @RequestParam String pjtNo, @RequestParam String rptNo) {
		ReportVO res = new ReportVO();
		res.setPjtNo(pjtNo);
		res.setRptNo(rptNo);
		
		List<Map<String,Object>> repDetail = reportService.reportDetail(res);
		
		//해당 프로젝트 번호의 PL 넣기(보고 승인/반려)
		List<Map<String, Object>> member = service.allPrtpnt(pjtNo);
		
		logger.info("프로젝트 구성원 꺼내자 :" + member.toString());
		
		//해당 프로젝트 번호의 생성자 아이디 찾기
		List<Map<String,Object>> admin = reportService.getMember(pjtNo);
		
		//업무보고 첨부파일
		List<TrsmFileVO> trsm = reportService.getTrsmFile(rptNo);
		
		model.addAttribute("pjtMem", member);
		model.addAttribute("admin", admin);
		model.addAttribute("detail", repDetail);
		model.addAttribute("trsm", trsm);
		
		return "project/reportDetail";
	}
	
	//첨부파일 다운로드
	@GetMapping(value = "/reportDownload.do", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	public ResponseEntity<Resource> fileDownload(String fileNo){
		logger.info("파일 번호 : "+fileNo );
		
		TrsmFileVO vo = reportService.downTrsmFile(fileNo);
		
		String filePath = vo.getTrsmFileAddr();
		
		Resource file = new FileSystemResource(filePath);
		
		logger.info("file: "+file);
		
		if(file.exists() == false) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}
		//uuid로 들어간 이름
		String uuidName = file.getFilename();
		logger.info("uuid로 들어간 이름 : "+ uuidName);
		
		//uuid 제거
		String getName = uuidName.substring(uuidName.indexOf("_") +1);
		logger.info("uuid 뺀 이름 : " + getName);
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			String downloadName = URLEncoder.encode(getName, "UTF-8");
			headers.add("Content-Disposition", "attachment; filename=" + new String(downloadName.getBytes("UTF-8"), "ISO-8859-1"));
		} catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(file, headers, HttpStatus.OK);
		
	}
	
	//업무보고 수정 페이지
	@GetMapping("/reportUpdate.do")
	public String reportUpdate(HttpSession session, Model model, @RequestParam String pjtNo, @RequestParam String rptNo) {
		logger.info("param rptNo :"+rptNo);
		
		ReportVO res = new ReportVO();
		res.setPjtNo(pjtNo);
		res.setRptNo(rptNo);
		List<Map<String,Object>> repDetail = reportService.reportDetail(res);
		
		//업무보고 첨부파일
		List<TrsmFileVO> trsm = reportService.getTrsmFile(rptNo);
		
		model.addAttribute("list", repDetail);
		model.addAttribute("trsm", trsm);
		return "project/reportUpdate";
	}
	
	//업무보고 수정 완료 시
	@PostMapping("/rptUpdatePost.do")
	public String rptUpdatePost(HttpSession session, @ModelAttribute ReportVO reportVO, @RequestParam String pjtNo) {
		logger.info("form으로 보낸 업뎃vo"+reportVO.toString());
		int res = reportService.reportUpdate(reportVO);
		return "redirect:/project/report.do?currentPage=1&pjtNo="+pjtNo+"&keyword=";
	}
	
	//PL의 업무보고 승인/반려
	@PostMapping("/rptConfirm.do")
	public String rptConfirm(HttpSession session, @RequestParam String pjtNo, @RequestParam String rptStts,
			@RequestParam String rptNo, @RequestParam String rptRjctCn) {
		logger.info("pl이 보낸 승인 여부" + rptStts);
		logger.info("pl이 보낸 반려 사유" + rptRjctCn);
		
		ReportVO reportVO = new ReportVO();
		reportVO.setRptStts(rptStts);
		reportVO.setRptNo(rptNo);
		reportVO.setRptRjctCn(rptRjctCn);
		
		int upStts = reportService.reportConfirm(reportVO);
		return "redirect:/project/report.do?currentPage=1&pjtNo="+pjtNo+"&keyword=";
	}
	
	//업무보고 삭제
	@ResponseBody
	@PostMapping("/reportDelete.do")
	public String reportDelete(HttpSession session, @RequestParam String rptNo, @RequestParam String pjtNo) {
		logger.info("ajax으로 보낸 rptNo"+rptNo);
		int res = reportService.reportDelete(rptNo);
		return "redirect:/project/report.do?currentPage=1&pjtNo="+pjtNo+"&keyword=";
	}
	
}
