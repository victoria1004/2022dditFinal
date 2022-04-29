package kr.or.ddit.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.project.mapper.ScheduleMapper;
import kr.or.ddit.project.service.ScheduleService;
import kr.or.ddit.project.vo.ScheduleVO;

@Service
public class ScheduleServiceImpl implements ScheduleService {
	@Autowired 
	ScheduleMapper mapper;
	
	@Override
	public int calendarInsert(ScheduleVO vo) {
		return mapper.calendarInsert(vo);
	}

	@Override
	public List<ScheduleVO> getAllCalendar(ScheduleVO vo) {
		return mapper.getAllCalendar(vo);
	}

	@Override
	public int calendarUpdate(ScheduleVO vo) {
		return mapper.calendarUpdate(vo);
	}

	@Override
	public List<ScheduleVO> calendarFiltering(ScheduleVO vo) {
		return mapper.calendarFiltering(vo);
	}

	@Override
	public int calendarDelete(String schdlNo) {
		return mapper.calendarDelete(schdlNo);
	}

}
