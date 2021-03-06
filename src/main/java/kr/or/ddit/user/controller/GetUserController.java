package kr.or.ddit.user.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.ddit.user.service.AlarmService;
import kr.or.ddit.user.service.GetUserService;
import kr.or.ddit.user.vo.MemberVO;
/**
 * 사용자 목록 출력 및 사용자, 관리자 권한 부여하는 컨트롤러
 * @author 정신애
 *
 */
@RequestMapping("/user")
@Controller
public class GetUserController {

	private static final Logger logger = LoggerFactory.getLogger(GetUserController.class);
		
	@Autowired GetUserService service;
	@Autowired AlarmService alarmService;
	
	
	@GetMapping("/userModal.do")
	public String userModal() {
		return "user/userModal";
	}
	
	/**
	 * 모달 창으로 회원 검색 시 모든 회원 목록을 가져오는 메서드
	 * @param model, keyword : 회원 이름 검색
	 * @return 모든 회원 목록
	 */
	@ResponseBody
	@GetMapping("/getUser")
	@RequestMapping(value="/getUser.do",method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<MemberVO> getAllUsers(@RequestParam(required = false) String keyword){		
		return service.getAllUsers(keyword);
	}
	
	/**
	 * ajax로 선택한 멤버들을 받아온다.
	 * @param data : ajax로 보내온 선택된 멤버들의 id목록
	 * @return 선택한 id값들의 배열
	 */
	@ResponseBody
	@PostMapping("/addMember")
	@RequestMapping(value="/addMember", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<MemberVO> addMember(@RequestParam Map<String, Object> data){

		String date = String.valueOf(data.get("date")); //회의실 예약 날짜
		String sender = String.valueOf(data.get("sender")); //회의실 예약자
		String time = String.valueOf(data.get("time")); //회의실 예약 시간
		String mtrNo = "10" + String.valueOf(data.get("mtrNo")); //회의실 방 번호
		String info = mtrNo + "/" + date + "/" + time;
		//logger.info("총 정보" + info);
		
		List<MemberVO> list = new ArrayList<MemberVO>();
		Gson gson = new Gson();
		List<String> strList = gson.fromJson((String) data.get("data"), List.class); //선택된 사람 목록
		for(String str2: strList) {
			alarmService.insertAlarmMsg(sender, "A05", str2, info);
			MemberVO vo = new MemberVO();
			vo = service.getUser(str2);
			list.add(vo);
		}
		return list;
	}
	
	
	/**
	 * 관리자가 사용자 승인/미승인 하는 화면
	 * @return 관리자의 승인/미승인 뷰 
	 */
	@GetMapping("/approvedUser.do")
	public String approvedUser() {
		return "user/approvedUser";
	}
	
	/**
	 * 승인회원 목록 가져오기
	 * @param keyword : 검색한 이름
	 * @return 승인된 회원의 전체 목록
	 */
	@ResponseBody
	@RequestMapping(value="/getM02Users", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<MemberVO> getM02Users(@RequestParam (required = false) String keyword){
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		return service.getM02Users(map);
	}
	
	/**
	 * 미승인회원 목록 가져오기
	 * @param keyword : 검색한 이름
	 * @return 미승인된 회원의 전체 목록
	 */
	@ResponseBody
	@RequestMapping(value="/getM03Users", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<MemberVO> getM03Users(@RequestParam (required = false) String keyword){
		Map<String, String> map = new HashMap<String, String>();
			map.put("keyword", keyword);
		return service.getM03Users(map);
	}
	
	/**
	 * 미승인 <-> 승인 목록 사이에서 드래그 앤 드롭으로 사용자의 승인 상태 업데이트
	 * @param map : mbrId 드래그앤드롭한 사용자의 id, mbrCtgrCd = M03 또는 M02
	 * @return update의 결과 (0 또는 1 반환)
	 */
	@ResponseBody
	@PostMapping("/updateUsersStts")
	public int updateUsersStts(@RequestParam Map<String, String> map) {
		return service.updateUsersStts(map);
	}
	
	/**
	 * 모든 회원 목록 엑셀로 다운로드하는 메서드
	 * @param 
	 * @throws Exception
	 */
	@PostMapping("/excelDown")
	public void excelDown(HttpServletResponse res) throws Exception {
		
		
		Map<String, String> map = new HashMap<String, String>();
		List<MemberVO> list = service.getM02Users(map);	

		Workbook workbook = new HSSFWorkbook();
		Sheet sheet = workbook.createSheet("userList");		
		int rowNum = 1;
		Row headerRow = sheet.createRow(0);
		int headerCol = 0;
		
		Cell headerCell = headerRow.createCell(headerCol++);
		headerCell.setCellValue("아이디");
		headerCell = headerRow.createCell(headerCol++);
		headerCell.setCellValue("분류코드");
		headerCell = headerRow.createCell(headerCol++);
		headerCell.setCellValue("이름");
		headerCell = headerRow.createCell(headerCol++);
		headerCell.setCellValue("성별");
		headerCell = headerRow.createCell(headerCol++);
		headerCell.setCellValue("전화번호");
		headerCell = headerRow.createCell(headerCol++);
		headerCell.setCellValue("소속");
		headerCell = headerRow.createCell(headerCol++);
		headerCell.setCellValue("이메일");
		
		Row row = null;
		Cell cell = null;
		int cellNum = 0;
			for(int i = 0; i < list.size(); i++) {
				cellNum = 0;
				row = sheet.createRow(rowNum++);
				cell = row.createCell(cellNum++);
				cell.setCellValue(list.get(i).getMbrId());
				
				cell = row.createCell(cellNum++);
				cell.setCellValue(list.get(i).getMbrCtgrCd());
				
				cell = row.createCell(cellNum++);
				cell.setCellValue(list.get(i).getMbrNm());
				
				cell = row.createCell(cellNum++);
				cell.setCellValue(list.get(i).getMbrGender());
				
				cell = row.createCell(cellNum++);
				cell.setCellValue(list.get(i).getMbrTelno());
				
				cell = row.createCell(cellNum++);
				cell.setCellValue(list.get(i).getMbrDept());
				
				cell = row.createCell(cellNum++);
				cell.setCellValue(list.get(i).getMbrEml());

			}

//		}
		res.setContentType("ms-vnd/excel");
		res.setHeader("Content-Disposition", "attachment;filename=userList.xls");
		workbook.write(res.getOutputStream());
		workbook.close();
	}
	
	/**
	 * 헤더에서 접속한 사용자의 상태를 변경하는 메서드
	 * @param map (stts : 바꿀 상태의 값(int), mbrId : 접속한 사용자의 아이디)
	 * @return 업데이트 성공 여부
	 */
	@ResponseBody
	@GetMapping("/changeMyStts")
	public int changeMyStts(@RequestParam Map<String, Object> map, HttpSession session) {		
		return service.changeMyStts(map);
	}
	
	/**
	 * 사용자의 현재 상태 가져오기
	 * @param mbrId 로그인한 사용자
	 * @return 해당 사용자의 현재 상태 
	 */
	@ResponseBody
	@GetMapping("/getMyStts")
	public int getMyStts(@RequestParam String mbrId) {
		//logger.info("접속자 누구니???????????" + mbrId);
		return service.getMyStts(mbrId);
	}
	
	/**
	 * 사용자 객체 꺼내기
	 * @param mbrId 선택된 사용자의 id
	 * @return 해당 id의 객체
	 */
	@ResponseBody
	@PostMapping("/getMyInfo")
	public MemberVO getMyInfo(@RequestParam String mbrId) {
		return service.getMyInfo(mbrId);
	}
	
	/**
	 * 사용자 관리자 지정
	 * @param list 관리자로 지정할 사용자 아이디값의 배열
	 */
	@ResponseBody
	@PostMapping("/addAdmin")
	public void addAdmin(@RequestParam Map<String, Object> list) {
		Gson gson = new Gson();
		List<String> updateList = gson.fromJson((String)list.get("list"), List.class);
		for(String mbrId : updateList) {
			service.addAdmin(mbrId);
		}
	}
	
	/**
	 * 관리자 권한 취소
	 * @param mbrId 관리자 권한을 취소할 사용자의 아이디
	 */
	@ResponseBody
	@PostMapping("/removeAdmin")
	public void removeAdmin(@RequestParam String mbrId){
		service.removeAdmin(mbrId);
	}
	
	
}
