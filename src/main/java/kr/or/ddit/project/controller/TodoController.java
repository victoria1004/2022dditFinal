package kr.or.ddit.project.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.or.ddit.project.ArticlePage;
import kr.or.ddit.project.service.KanbanCardService;
import kr.or.ddit.project.service.ProjectService;
import kr.or.ddit.project.service.TodoHistoryService;
import kr.or.ddit.project.service.TodoService;
import kr.or.ddit.project.vo.KanbanCardVO;
import kr.or.ddit.project.vo.MarkerVO;
import kr.or.ddit.project.vo.ProjectVO;
import kr.or.ddit.project.vo.TodoHistoryVO;
import kr.or.ddit.project.vo.TodoVO;
import kr.or.ddit.user.service.AlarmService;
import kr.or.ddit.user.service.GetUserService;
import kr.or.ddit.user.vo.MemberVO;
import kr.or.ddit.util.CmDvsnCtgrVO;

@RequestMapping("/project")
@Controller
public class TodoController {


	private static final Logger logger = LoggerFactory.getLogger(TodoController.class);
	
	@Autowired TodoService service;
	@Autowired AlarmService alarmService;
	@Autowired ProjectService projectService;
	@Autowired GetUserService userService;
	@Autowired TodoHistoryService historyService;
	@Autowired KanbanCardService kbcdService;
	
	/**
	 * 일감 목록 뷰
	 * @param pjtNo 해당 프로젝트 번호
	 * @return 일감 목록 뷰
	 */
	@GetMapping("/todo.do")
	public String todo(){
		return "project/todo";
	}

	/**
	 * 
	 * @param pjtNo
	 * @param currentPage
	 * @param size
	 * @param keyWord
	 * @param mbrId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getAllTodos", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> getAllTds(@RequestParam String pjtNo
			, @RequestParam(defaultValue = "1", required=false) int currentPage
			, @RequestParam(defaultValue = "10", required=false) int size
			, @RequestParam(required = false) String keyWord
			, @RequestParam(required = false) String finish
			, @RequestParam(required = false) String stts
			, @RequestParam(required = false) String impr
			, @RequestParam(required = false) String mbrId){
		
		System.out.println("getAllTodos:" + pjtNo + "," + finish+ "," + stts+ "," + impr);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pjtNo", pjtNo);
		map.put("currentPage", currentPage);
		map.put("size", size);
		map.put("keyWord", keyWord);
		map.put("mbrId", mbrId);
		map.put("finish", finish); //완료일감체크
		map.put("stts", stts); //진행상태 선택
		map.put("impr", impr); //중요도 선택
		
		//logger.info("",currentPage, size);
		
		int total = this.service.totalList(map);
		//logger.info(map.toString());
		List<Map<String, Object>> list = service.getAllTodos(map);
		//logger.info(list.toString());
		Map<String, Object> getMap = new HashMap<String, Object>();
		getMap.put("list", new ArticlePage(total, currentPage, size, 5, list));
		
		return getMap;
	}

	
	
	/**
	 * 일감 생성 뷰 
	 * @param pjtNo 해당 프로젝트 번호
	 * @return 일감 생성 뷰
	 */
	@GetMapping("/mkTodo.do")
	public String makingTodo(@RequestParam(required = false) String tdNo, Model model) {
		
		if(tdNo != null) { //일감상세보기에서 편집 클릭 시 수정할 글번호를 여기로 넘겨줌
			Map<String, Object> tdMap = service.getTodo(tdNo);
			model.addAttribute("map", tdMap);
		}
		
		return "project/mkTodo";
	}
	
	/**
	 * 일감 작성 시 insert되는 곳
	 * @param vo
	 * @return insert 후 일감 게시판 화면으로 이동
	 */
	@PostMapping("/insertTodo")
	public String insertTodo(@ModelAttribute TodoVO vo, HttpSession session) {
		logger.info("form에서 넘어온 객체:" + vo.toString());
		logger.info("form!!!"+vo.getTdImprCd()+"+"+vo.getTdCtgrCd());
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		int result = service.insertTodo(vo);
		if(result > 0 && !(memberVO.getMbrId().equals(vo.getTdPicId()))) { //일감 담당자가 세션아이디가 아닌 경우에만 알람가게 하기!
			MemberVO mem = userService.getMyInfo(vo.getTdPicId()); //담당자 아이디로 담당자 객체 꺼내서
			
			String data = vo.getPjtNo() + "/" + vo.getTdNo(); //주소값 데이터 세팅
			
			alarmService.insertAlarmMsg(vo.getTdWrtrId(), "A03", vo.getTdPicId(), vo.getPjtNo(), data); //알람메시지 띄우기
			
			//칸반에도 insert 
			KanbanCardVO list = new KanbanCardVO();
			list.setKbCardNo(10);
			list.setKbNo(1);
			list.setKbCardIdxNo(5);
			list.setKbCardWrtrNm("전지횬");
			list.setKbCardTtl(vo.getTdTtl());
			list.setKbCardCn(vo.getTdCn());
			list.setKbCardStrtDt(vo.getTdStrtDt());
			list.setKbCardEndDt(vo.getTdEndDt());
			list.setKbPrgrs(vo.getPrgrs());
			
			logger.info("칸반에도 들어갔냐--- " + list.toString() );
		}
		return "redirect:/project/todo.do?pjtNo="+vo.getPjtNo();
	}
	
	/**
	 * 일감 수정 후 등록 버튼 클릭 시 update되는 곳
	 * @param vo 수정한 일감
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@PostMapping("/updateTodo")
	public String updateTodo(@ModelAttribute TodoVO vo, HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String str = URLDecoder.decode(vo.toString(),"utf-8");
		String str2 = URLDecoder.decode(vo.toString(),"euc-kr");
		logger.info("업데이트할 객체:" + str);
		logger.info("업데이트할 객체22:" + str2);
		TodoVO todo = service.getBeforeTd(vo.getTdNo()); //기존 객체
		MemberVO member = (MemberVO)session.getAttribute("member");
		String user = member.getMbrId(); //수정한 사람 id

		if(!todo.getPrgrs().equals(vo.getPrgrs())) {
			TodoHistoryVO history = new TodoHistoryVO();
			history.setBeforeCn(todo.getPrgrs());
			history.setAfterCn(vo.getPrgrs());
			history.setPrtpntId(user);
			history.setTdNo(vo.getTdNo());
			history.setColumnNm("진척도");
			historyService.insertHistory(history);	
		} 
		if(!todo.getTdCn().equals(vo.getTdCn())) {
			TodoHistoryVO history = new TodoHistoryVO();
			history.setBeforeCn(todo.getTdCn());
			history.setAfterCn(vo.getTdCn());
			history.setPrtpntId(user);
			history.setTdNo(vo.getTdNo());
			history.setColumnNm("업무내용");
			historyService.insertHistory(history);	
		} 
		if(!todo.getTdStrtDt().equals(vo.getTdStrtDt())) {
			TodoHistoryVO history = new TodoHistoryVO();
			history.setBeforeCn(todo.getTdStrtDt());
			history.setAfterCn(vo.getTdStrtDt());
			history.setPrtpntId(user);
			history.setTdNo(vo.getTdNo());
			history.setColumnNm("시작일");
			historyService.insertHistory(history);	
		} 
		if(!todo.getTdEndDt().equals(vo.getTdEndDt())) {
			TodoHistoryVO history = new TodoHistoryVO();
			history.setBeforeCn(todo.getTdEndDt());
			history.setAfterCn(vo.getTdEndDt());
			history.setPrtpntId(user);
			history.setTdNo(vo.getTdNo());
			history.setColumnNm("완료일");
			historyService.insertHistory(history);	
		} 
		if(!todo.getTdImprCd().equals(vo.getTdImprCd())) {
			TodoHistoryVO history = new TodoHistoryVO();
			history.setBeforeCn(todo.getTdImprCd());
			history.setAfterCn(vo.getTdImprCd());
			history.setPrtpntId(user);
			history.setTdNo(vo.getTdNo());
			history.setColumnNm("중요도");
			historyService.insertHistory(history);	
		} 
		if(!todo.getTdPicId().equals(vo.getTdPicId())) {
			TodoHistoryVO history = new TodoHistoryVO();
			history.setBeforeCn(todo.getTdPicId());
			history.setAfterCn(vo.getTdPicId());
			history.setPrtpntId(user);
			history.setTdNo(vo.getTdNo());
			history.setColumnNm("담당자");
			String data = vo.getPjtNo() + "/" + vo.getTdNo(); //주소값 데이터 세팅
			alarmService.insertAlarmMsg(vo.getTdWrtrId(), "A03", vo.getTdPicId(), vo.getPjtNo(), data); //알람메시지 띄우기
			historyService.insertHistory(history);	
		} 
		if(!todo.getTdCtgrCd().equals(vo.getTdCtgrCd())) {
			TodoHistoryVO history = new TodoHistoryVO();
			history.setBeforeCn(todo.getTdCtgrCd());
			history.setAfterCn(vo.getTdCtgrCd());
			history.setPrtpntId(user);
			history.setTdNo(vo.getTdNo());
			history.setColumnNm("유형");
			historyService.insertHistory(history);	
		} 
		if(!todo.getTdTtl().equals(vo.getTdTtl())) {
			TodoHistoryVO history = new TodoHistoryVO();
			history.setBeforeCn(todo.getTdTtl());
			history.setAfterCn(vo.getTdTtl());
			history.setPrtpntId(user);
			history.setTdNo(vo.getTdNo());
			history.setColumnNm("일감제목");
			historyService.insertHistory(history);	
		} 
		if(!todo.getTdStts().equals(vo.getTdStts())) {
			TodoHistoryVO history = new TodoHistoryVO();
			history.setBeforeCn(todo.getTdStts());
			history.setAfterCn(vo.getTdStts());
			history.setPrtpntId(user);
			history.setTdNo(vo.getTdNo());
			history.setColumnNm("진행상태");
			historyService.insertHistory(history);	
		} 
		service.updateTodo(vo);
		return "redirect:/project/todoDetail.do?pjtNo="+vo.getPjtNo()+"&tdNo="+vo.getTdNo();
	}
	
	
	
	/**
	 * 일감 작성 시 마커 선택 부분
	 * @param pjtNo 해당 프로젝트 번호
	 * @return 해당 프로젝트에서 세팅한 모든 marker 목록
	 */
	@RequestMapping(value="/getMarkers", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public List<MarkerVO> getMarkers(@RequestParam String pjtNo){
		return service.getMarkers(pjtNo);
	}	
	
	/**
	 * 일감 유형과 중요도, 진행상태 코드 가져오기
	 * @return 중분류테이블의 일감 분류 코드들
	 */
	@RequestMapping(value="/getTodoCd", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> getTodoCd(){
		List<CmDvsnCtgrVO> list = service.getTodoCd();
		Map<String, Object> map = new HashMap<String, Object>();
		List<CmDvsnCtgrVO> ctgr = new ArrayList<CmDvsnCtgrVO>(); //유형
		List<CmDvsnCtgrVO> impr = new ArrayList<CmDvsnCtgrVO>(); //중요도
		List<CmDvsnCtgrVO> stts = new ArrayList<CmDvsnCtgrVO>(); //상태
		for(CmDvsnCtgrVO vo : list) {
			if(vo.getCmDvsnCtgrCd().startsWith("TS")){
				impr.add(vo);
			} else if(vo.getCmDvsnCtgrCd().startsWith("TC")){
				ctgr.add(vo);
			} else if(vo.getCmDvsnCtgrCd().startsWith("TT")){
				stts.add(vo);
			}
			map.put("tdCtgrCd", ctgr); //유형 리스트
			map.put("tdImprCd", impr); //중요도 리스트
			map.put("tdStts", stts); //진행상태 리스트
		}
		return map;
	}
	
	/**
	 * 담당자 리스트 가져오기
	 * @param map-pjtNo : 프로젝트 번호, mbrId : 정렬시 상위에 노출될 접속자
	 * @return 모든 구성원 리스트
	 */
	@ResponseBody
	@RequestMapping(value="/getMbr", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<MemberVO>  getMbr(@RequestParam Map<String, String> map){
		return projectService.getAllMbr(map);
	}
	
	
	/**
	 * 일감 상세페이지 뷰
	 * @param tdNo 클릭한 일감 번호
	 * @return 상세페이지
	 */
	@GetMapping("/todoDetail.do")
	public String todoDetail(@RequestParam String tdNo, @RequestParam String pjtNo, Model model
			, @RequestParam(defaultValue = "1", required=false) int currentPage
			, @RequestParam(defaultValue = "10", required=false) int size
			, @RequestParam(required = false) String keyWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tdNo", tdNo);
		map.put("pjtNo", pjtNo);
		map.put("currentPage", currentPage);
		map.put("size", size);
		map.put("keyWord", keyWord);
		Map<String, Object> parentMap = service.getTodo(tdNo);
		model.addAttribute("map", parentMap); //내가 선택한 일감
		model.addAttribute("list", service.getAllTodos(map)); //선택한 일감을 제외한 모든 일감들
		
		//하위 일감 가져오기
		//logger.info("부모일감:"+parentMap.toString());
		if(parentMap.get("TD_CHILD") != null) {
			String leafNo = (String)parentMap.get("TD_CHILD");
			Map<String, Object> leafMap = new HashMap<String, Object>();
			leafMap.put("tdNo", leafNo);
			leafMap.put("pjtNo", pjtNo);
			//logger.info("하위일감:"+leafMap.toString());
			model.addAttribute("leaf", service.getTodo(leafNo));
		}
		
		//이력 가져오기
		List<Map<String,Object>> histories = historyService.getMyHistory(tdNo);
		model.addAttribute("histories", histories); 
		return "project/todoDetail";
	}
	
	/**
	 * 하위 일감 추가 버튼 클릭 시 클릭한 일감들의 리스트를 return한다.
	 * @param map 프로젝트 번호와 선택한 일감 번호들
	 * @return 선택한 일감들 객체 리스트
	 */
	@ResponseBody
	@RequestMapping(value="/getLeaf", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> getLeaf(@RequestParam Map<String, Object> map) {
		logger.info("파라미터값들:"+map.toString());
	
		Map<String, Object> thisMap = new HashMap<String, Object>();
		thisMap.put("pjtNo", map.get("pjtNo"));
		thisMap.put("tdNo", map.get("tdParent"));
		Map<String, Object> parentMap = service.getTodo((String)map.get("tdParent"));
		logger.info("부모객체:" + parentMap.toString());
		
		String tdNo = (String)parentMap.get("TD_CHILD"); //기존에 세팅되어있던 자식
		if(tdNo != null) {
			service.removeParent(tdNo); //기존 하위 일감이 있는 경우 해당 하위 일감의 부모를 지워준다.
		}
		
		Map<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("pjtNo", map.get("pjtNo"));
		hashMap.put("tdNo", map.get("tdNo"));
		hashMap.put("tdParent", map.get("tdParent"));
		service.bemyParent(hashMap); //상위 일감 세팅
		service.bemyChild(hashMap); //하위 일감 세팅
		
		Map<String, Object> todoMap = service.getTodo((String)map.get("tdNo")); //하위일감
		return todoMap;
	}
	
	/**
	 * 일감 삭제 메서드
	 * @param tdNo 삭제할 일감 번호
	 * @return 삭제 성공 시 1 리턴
	 */
	@ResponseBody
	@PostMapping("/deleteTodo")
	public int deleteTodo(@RequestParam String tdNo) {
		logger.info("삭제할 일감", tdNo);
		return service.deleteTodo(tdNo);
	}
	
	
	
	
}
