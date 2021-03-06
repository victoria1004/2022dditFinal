package kr.or.ddit.cloud.contoller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;

import kr.or.ddit.cloud.service.CloudService;
import kr.or.ddit.cloud.vo.FldrVO;
import kr.or.ddit.cloud.vo.StrgVO;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.user.vo.MemberVO;
import kr.or.ddit.util.LogCrud;

/**
 * 각 프로젝트별로 사용하는 클라우드 컨트롤러
 * @author 정신애
 *
 */
@RequestMapping("/cloud")
@Controller
public class CloudController {

	private static final Logger logger = LoggerFactory.getLogger(CloudController.class);

	@Autowired CloudService service;
	@Autowired ProjectService projectService;
	
	/**
	 * cloud 메인페이지
	 * @return cloud main view
	 */
	@GetMapping("/main.do")
	public String main(@RequestParam String pjtNo, Model model) {
		
		ProjectVO vo = projectService.getPjt(pjtNo);
		model.addAttribute("project", vo);
		
		return "cloud/cloud";
	}
	
	/**
	 * ajax로 해당 프로젝트의 모든 파일 목록을 끌어와 출력한다.
	 * @param pjtNo 접속해있는 프로젝트번호
	 * @param fileNm 검색 시 사용되는 파일명
	 * @param folderNm 좌측 폴더메뉴에서 클릭된 폴더이름
	 * @param start 폴더의 시작index
	 * @param end 폴더의 마지막index
	 * @return 관련된 모든 파일 목록을 list로 끌어온다.
	 */
	@ResponseBody
	@RequestMapping(value="/cloud.do", method=RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<StrgVO> cloudMain(@RequestParam String pjtNo, @RequestParam(required = false) String fileNm,
			@RequestParam(required = false) String folderNm,
			@RequestParam(defaultValue = "1")int start, @RequestParam(defaultValue = "20")int end){
		Map<String, Object> map = new HashMap<String, Object>();
		logger.info("cloudMain : folderNm>> "+folderNm);
		
		map.put("pjtNo",pjtNo);
		map.put("fileNm",fileNm); //파일이름 검색 시 값이 들어간다.
		int total = service.fileCount(map); //총 파일 갯수 가져오기 
		map.put("total", total);
		map.put("start",start); 
		map.put("end",end); 
		map.put("folderNm",folderNm); 
		return service.selectAll(map);
	}

	/**
	 * 파일 업로드 ajax
	 * @param fileNm form태그로 파일 업로드 시 ajax로 데이터를 가져와 파일 업로드 처리
	 * @throws UnsupportedEncodingException 
	 */
	@ResponseBody
	@PostMapping("/fileUpload")
	public void fileUpload(@RequestBody MultipartFile[] files, @RequestParam String folderNm, @RequestParam String pjtNo, HttpSession session) throws UnsupportedEncodingException {
		folderNm = new String(folderNm.getBytes("8859_1"),"utf-8");
		logger.info("files:" + files);
		logger.info("folderNm:"+folderNm);
		logger.info("pjtNo:"+pjtNo);
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		//프로젝트 객체 세션 생성 시 세션에서 번호 꺼내와서 해당 프로젝트이름으로 업로드폴더 생성할 예정
		//String pjtNm = "프젝테스트";
		//String pjtNo = "1";
			
		//업로드시 사용될 큰 폴더
		String uploadFolder = "D:/A_TeachingMaterial/7.LastProject/workspace/doIT/src/main/webapp/resources/cloud/";
		
		//업로드할 경로
		File uploadPath = new File(uploadFolder, folderNm);
				
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		for(MultipartFile file : files) {
			StrgVO vo = new StrgVO();
			vo.setFileNm(file.getOriginalFilename()); //파일 실제이름을 strgVO의 실제파일명에 저장
			
			UUID uuid = UUID.randomUUID();
			String strgFileNm = uuid.toString() + "_" + file.getOriginalFilename(); //저장될 파일명 세팅
			File saveFile = new File(uploadPath, strgFileNm);
			try {
				vo.setStrgFileAddr(uploadPath.getPath()); //저장경로를 객체의 파일저장경로에 세팅
				vo.setStrgFileNm(strgFileNm); //파일저장명을 객체의 저장파일명에 세팅
				vo.setStrgFileSz(String.valueOf(file.getSize())); //파일크기 세팅 
				vo.setPjtNo(pjtNo);	
				vo.setFileUploader(member.getMbrId()); //파일업로드한 사람 id 
				file.transferTo(saveFile);

				//DB에 insert
				logger.info("vo:"+vo.toString());
				int result = service.insert(vo);
				if(result > 0) {	
					LogCrud.getCreate("CloudController");
					logger.info("DB 업로드 성공");
				} else {
					logger.info("DB 업로드  실패");
				}
			} catch (Exception e) {
				logger.info(e.getMessage());
			}	
		}
	}
	
	/**
	 * 클라우드 메뉴에 폴더를 트리구조로 출력하는 메서드
	 * @param pjtNo 프로젝트 번호를 받아 해당 프로젝트에서 사용 중인 폴더 목록을 가져온다.
	 * @return 폴더객체가 담겨있는 리스트
	 */
	@ResponseBody
	@RequestMapping(value="/getAllLeafFolders", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<FldrVO> getAllLeafFolders(@RequestParam Map<String,String> map){
		return service.getAllLeafFolders(map);
	}
	
	/**
	 * 
	 * 폴더 생성 모달창 클릭 시 이 메서드를 통해 생성된다.
	 * @param folderMap 저장할 상위 폴더(folderNm)와 저장될 폴더명(leafFolder)이 들어있는 map을 파라미터로 받는다.
	 */
	@ResponseBody
	@PostMapping("/mrDirs")
	public int mkDirectories(@RequestParam Map<String, String> folderMap) { 
		LogCrud.getCreate("CloudController");
		FldrVO vo = new FldrVO();
		vo.setLeafFolder(folderMap.get("leafFolder"));		
		String path = folderMap.get("path");		
		String parentFldr = seperateFldr(path).get("leafFldr"); //파일경로의 마지막 하위 폴더가 새로 생기는 폴더의 상위폴더가 된다.		
		vo.setParentFolder(parentFldr);
		vo.setPjtNo(folderMap.get("pjtNo"));
		return service.insertFldr(vo); //폴더 테이블에 insert
	}
	
	/**
	 * 좌측메뉴에서 폴더 클릭 시 해당 폴더의 하위폴더 가져와서 파일목록에 하위 폴더도 출력시킨다.
	 * @param folderMap-pjtNo : 프로젝트 번호, folderNm : 클릭한 폴더명(parentFolder)
	 * @return 해당 폴더의 하위 폴더(1층) 목록
	 */
	@ResponseBody
	@GetMapping("/getLeaf")
	@RequestMapping(value="/getLeaf", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<String> getLeaf(@RequestParam Map<String, String> map){	
		logger.info("getLeaf: folderNm>> " + map.get("folderNm"));
		logger.info("getLeaf: pjtNo>> " + map.get("pjtNo"));
		logger.info("getLeaf: result>> " + service.getLeaf(map));
		
		return service.getLeaf(map);
	}
	
	
	/**
	 * 클라우드에서 파일 업로드시 현재 폴더 위치 가져오는 메서드
	 * @return parent_folder를 String으로 return
	 */
	@ResponseBody
	@RequestMapping(value="/getFolder", method = RequestMethod.POST, produces = "plain/text; charset=utf-8")
	private String getFolder(@RequestParam Map<String, String> map) { 
		logger.info("map:"+map.toString());
		logger.info("folderNm:"+map.get("folderNm"));
		
		// 140번째 줄까지는 더미데이터 프젝번호가 숫자1이라서 이렇게 세팅해둠. String으로 바뀌면 이거 지우고 파라미터를 메서드에 바로 넣어주면 된다.
		String pjtNo = String.valueOf(map.get("pjtNo"));
		Map<String, String> newMap = new HashMap<String, String>();
		newMap.put("pjtNo", pjtNo);
		newMap.put("folderNm", map.get("folderNm"));
		String res = service.getFolder(newMap);
		logger.info("res:"+res);
		return res;
	}
	
	/**
	 * 파일 업로드창이나 폴더 생성창에서 폴더 클릭 시 해당 폴더의 하위 폴더들을 가져온다.
	 * @param map 프로젝트번호(pjtNo), 상위 폴더(클릭한 폴더명)
	 * @return 상위 폴더의 하위폴더들을 list로 return
	 */
	@ResponseBody
	@PostMapping("/getLowFolders")
	public List<FldrVO> getLowFolders(@RequestParam Map<String, String> map){
		
		logger.info("하위폴더 선택시>>"+map.toString());
		
		return service.getLowFolders(map);
	}
	
	/**
	 * 폴더 선택 후 파일 업로드 시 선택한 경로를 하위 폴더와 상위 폴더로 나눠주는 메서드
	 * @param folderNm 선택한 폴더의 모든 경로
	 * @return 부모폴더와 자식폴더를 담은 hashMap으로 리턴
	 */
	private Map<String, String> seperateFldr(String folderNm) {
		Map<String, String> strMap = new HashMap<String, String>();
		String parentStr = ""; //부모폴더
		String leafStr = ""; //자식폴더
		logger.info("=====folderNm:"+folderNm);
		
		String[] strRoom = folderNm.split("\\\\");
		logger.info("length:"+strRoom.length);
		
		parentStr = "NULL";
		if(strRoom.length>1) {
			parentStr = strRoom[strRoom.length-2]; 
		}
		leafStr = strRoom[strRoom.length-1];

		strMap.put("parentFldr", parentStr);
		strMap.put("leafFldr", leafStr);
		logger.info(strMap.toString());
		return strMap;
	}
	
	/**
	 * 파일 선택 후 드롭다운박스에서 "파일삭제" 선택 시 해당 파일번호를 파람으로 받아 삭제한다.
	 * @param strgFileNo 선택한 파일번호
	 * @return 파일 삭제 성공시 1 리턴
	 */
	@ResponseBody
	@PostMapping("/fileDelete")
	public int fileDelete(@RequestParam String strgFileNo) {
		LogCrud.getDelete("CloudController");
		logger.info("파일번호:"+strgFileNo);
		return service.fileDelete(strgFileNo);
	}
	
	/**
	 * 파일 선택 후 드롭다운박스에서 "다운로드" 선택 시 파일 다운로드
	 * @param response, request
	 * @param fileName 선택한 파일명
	 * @throws Exception
	 */	
	@GetMapping("/fileDownload")
	public void download(HttpServletRequest request, HttpServletResponse response, @RequestParam String strgFileNo) throws Exception {
		LogCrud.getDownload("CloudController");
		request.setCharacterEncoding("UTF-8");
		
		logger.info("파일번호:"+strgFileNo);
		
		StrgVO vo = service.getDownloadFile(strgFileNo);
		
		logger.info("다운로드 선택한 파일객체:" + vo.toString());
		
		//DB에서 꺼내온 경로에 한글이 들어간 경우 문자가 깨지기 때문에 디코딩해줘야한다.
		//String downLoadPath = URLDecoder.decode(vo.getStrgFileAddr(),"EUC-KR");
		//String fileName = URLDecoder.decode(vo.getStrgFileNm(),"EUC-KR");
		String downLoadPath = vo.getStrgFileAddr();
		String fileName = vo.getStrgFileNm();
		
		String filePath = downLoadPath + File.separator + fileName;
		
		File file = new File(filePath);
		
		OutputStream out = null;
		FileInputStream fin = null;
		
		if(file.exists()) { //파일이 있을 때
			//contentType 설정
			response.setContentType("application/octet-stream; charset=utf-8");
			
			//response객체의 content-disposition헤더 속성 설정하기
			String headerKey = "Content-Disposition";
			//String realname = URLDecoder.decode(vo.getFileNm(),"EUC-KR"); //실제 파일 이름도 한글로 저장된 경우 디코딩 
			String realname = vo.getFileNm();
			String downFilename = getFilenameEncoding(realname, getBrowser(request));
			String headerValue = "attachment; filename=\"" + downFilename + "\";";
			
			response.setHeader(headerKey, headerValue);
			getBrowser(request);			
			
			try {				
				//출력용 스트림객체 생성
				out = response.getOutputStream();
				
				//파일 입력용 스트림 객체 생성
				fin = new FileInputStream(file);
				
				byte[] buffer = new byte[1024 * 100];
				
				int len = 0;
				
				//byte배열을 이용하여 파일내용을 읽어와 출력용 스트림을 이용하여 클라이언트에게 전송한다.
				while((len = fin.read(buffer)) > 0) {
					out.write(buffer, 0, len);
				}			
			} catch (Exception e) {
				System.out.println("입출력 오류 : " + e.getMessage());
			} finally {
				if(fin != null) try {fin.close(); } catch(IOException e){ }
				if(fin != null) try {out.close(); } catch(IOException e){ }			
			}
		}
	}


	//사용자의 브라우저 알아내기
	private String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		//System.out.println(header);
		
		// 인덱스0부터 시작하니까 -1로 비교
		if(header.indexOf("MSIE") > -1) {
			return "MSIE"; //익스플로러인 경우
		} else if(header.indexOf("Chrome") > -1) {
			return "Chrome"; 
		} else if(header.indexOf("Opera") > -1) {
			return "Opera";
		} else if(header.indexOf("Trident/7.0") > -1) {
			return "MSIE"; //익스플로러 엣지버전
		} 
		return "Firfox"; 
	}
	
	//브라우저별 한글 파일명을 인코딩하는 메서드
	private String getFilenameEncoding(String filename, String browser) {
		
		String encodedFilename = null;
		
		try {
			if(browser.equals("MSIE")) {
				encodedFilename = URLEncoder.encode(filename, "utf-8").replaceAll("\\+", "%20");																	
			} else if(browser.equals("Firfox")) {
				encodedFilename = "\"" + new String(filename.getBytes("utf-8"), "8859_1") + "\"";
			} else if(browser.equals("Opera")) {
				encodedFilename = "\"" + new String(filename.getBytes("utf-8"), "8859_1") + "\"";
			} else if(browser.equals("Chrome")) {
				StringBuffer sb = new StringBuffer();
				for(int i = 0; i < filename.length(); i++) {
					char c = filename.charAt(i);					
					if(c > '~') {
						sb.append(URLEncoder.encode(""+c, "utf-8"));
					}else {
						sb.append(c);
					}
				}				
				encodedFilename = sb.toString();
				
			} else {
				throw new RuntimeException("지원하지 않는 브라우저입니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return encodedFilename;
	}
	


}
