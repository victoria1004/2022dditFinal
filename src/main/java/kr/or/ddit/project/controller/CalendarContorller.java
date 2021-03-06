package kr.or.ddit.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.project.service.ScheduleService;
import kr.or.ddit.project.vo.ScheduleVO;
import kr.or.ddit.user.vo.MemberVO;

@Controller
@RequestMapping("/project")
public class CalendarContorller {
	private static final Logger logger = LoggerFactory.getLogger(CalendarContorller.class);
	
	
	@Autowired
	ScheduleService service;
	
	//get방식의 calendar main page
	@RequestMapping(value="/calendar.do")
	public String calendar(@RequestParam String pjtNo, Model model) {
		logger.info("first");
		logger.info("pjtNo : " + pjtNo);
		
		model.addAttribute("pjtNo",pjtNo);
		return "project/calendar";
	}
	
	//DB데이터 출력 calendar main page(모든 일정 출력)
	@ResponseBody
	@RequestMapping(value="/calendarAll.do",method=RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<ScheduleVO> calendarAll(@RequestParam String pjtNo, HttpSession session) {
		logger.info("second : " + pjtNo);
		
		ScheduleVO vo = new ScheduleVO();
		
		vo.setPjtNo(pjtNo);
		vo.setSchdlWrtrNm(((MemberVO)session.getAttribute("member")).getMbrId());
		
		List<ScheduleVO> list = service.getAllCalendar(vo);
		
		for(ScheduleVO vo2 : list) {
			logger.info("selectAll: " + vo2.toString());
		}		

		return list;			
	}
	
	//일정 삭제
	@ResponseBody
	@RequestMapping(value="/calendarDelete.do", method=RequestMethod.POST)
	public void calendarDelete(String schdlNo) {
		logger.info(schdlNo);
		
		service.calendarDelete(schdlNo);
	}
	
	//일정 등록
	@ResponseBody
	@RequestMapping(value="/calendarInsert.do", method=RequestMethod.POST)
	public void calendarInsert(ScheduleVO vo,@RequestParam String color, HttpSession session) {
		logger.info("등록할 스케줄 : " + vo.toString());
		logger.info("테스트!!!!!!!!!!!!" + color);
		vo.setSchdlCtgrCd(this.colorToCode(color));
				
		vo.setSchdlWrtrNm(((MemberVO)session.getAttribute("member")).getMbrId());
		
		service.calendarInsert(vo);
		logger.info("등록 : LogCrud.getCreate(\"CalendarContorller\")");
		
	}
	
	//기존 일정 수정
	@ResponseBody
	@RequestMapping(value="/calendarUpdate.do", method=RequestMethod.POST)
	public void calendarUpdate(ScheduleVO vo,@RequestParam String color) {
		logger.info("수정할 값"+vo.toString());
		
		vo.setSchdlCtgrCd(this.colorToCode(color));
		
		service.calendarUpdate(vo);
		logger.info("수정 : LogCrud.getModify(\"CalendarContorller\")");
		
	}
	
	//필터링 된 일정 가져오기	
	  @ResponseBody
	  @RequestMapping(value="/calendarFiltering.do", method=RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	  public List<ScheduleVO> calendarFiltering(String schdlCtgrCd,String pjtNo,HttpSession session) {
		  ScheduleVO vo = new ScheduleVO();
		  
		  vo.setSchdlCtgrCd(schdlCtgrCd);
		  vo.setPjtNo(pjtNo);
		  vo.setSchdlWrtrNm(((MemberVO)session.getAttribute("member")).getMbrId());
		  
		  List<ScheduleVO> list = service.calendarFiltering(vo);
		  
		  logger.info("filtering : " + list);
		  
		  return list;
	  
	  }
	 
	
	//예외처리
	@ExceptionHandler(Exception.class)
	public String exception1(Exception ex) {
		logger.info(ex.getMessage());
		return "project/calendar";
	}
	
	//color class 공통코드로 바꾸는 함수
	public String colorToCode(String color) {
		String code="";
		
		if(color.equals("bg-danger")) {
			code="C03";
		}else if(color.equals("bg-warning")) {
			code="C02";			
		}else if(color.equals("bg-primary")) {
			code="C01";
		}else if(color.equals("")||color==null) {
			code=null;
		}
		
		return code;
	}
}
