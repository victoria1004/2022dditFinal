package kr.or.ddit.project.service;

import java.util.List;

import kr.or.ddit.project.vo.ScheduleVO;

public interface ScheduleService {
		//캘린더 일정등록
		public int calendarInsert(ScheduleVO vo);
		
		//해당 프로젝트에 등록되어있는 캘린더의 일감 모두 가져오기
		public List<ScheduleVO> getAllCalendar(ScheduleVO vo);
		
		//기존 일정 수정하기
		public int calendarUpdate(ScheduleVO vo);
		
		//필터링된 일정 조회하기
		public List<ScheduleVO> calendarFiltering(ScheduleVO vo);
		
		//일정 삭제하기
		public int calendarDelete(String schdlNo);
}
