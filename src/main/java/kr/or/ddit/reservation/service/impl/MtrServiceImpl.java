package kr.or.ddit.reservation.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.reservation.mapper.MtrMapper;
import kr.or.ddit.reservation.service.MtrService;
import kr.or.ddit.reservation.vo.MtrRsvtVO;
import kr.or.ddit.reservation.vo.MtrVO;

@Service
public class MtrServiceImpl implements MtrService {

	@Autowired
	MtrMapper mtrMapper;
	
	//특정일 예약정보 조회
	@Override
	public List<Map<String,Object>> todayRes(String rsvtYmd) {
		List<Map<String,Object>> mtrRsvtList = this.mtrMapper.todayRes(rsvtYmd); 
		return mtrRsvtList;
	}

	//예약 등록
	@Override
	public int resInsert(MtrRsvtVO mtrrVO) {
		int result = this.mtrMapper.resInsert(mtrrVO);
		return result;
	}

	//예약정보 단건 조회
	@Override
	public MtrRsvtVO resSelectOne(MtrRsvtVO mtrrVO) {
		MtrRsvtVO mrv = this.mtrMapper.resSelectOne(mtrrVO);
		return mrv;
	}

	//예약 취소(예약정보 삭제)
	@Override
	public int resDelete(MtrRsvtVO mtrrVO) {
		int res = this.mtrMapper.resDelete(mtrrVO);
		return res;
	}

	//회의실 비품 구비현황 조회
	@Override
	public List<Map<String, Object>> mtrStts() {
		List<Map<String,Object>> mtrSttsList = this.mtrMapper.mtrStts();
		return mtrSttsList;
	}
	//회의실 비품 등록
	@Override
	public int mtrSttsInsert(MtrVO mtrVO) {
		int res = this.mtrMapper.mtrSttsInsert(mtrVO);
		return res;
	}

	//회의실 비품 삭제
	@Override
	public int mtrSttsDelete(MtrVO mtrVO) {
		int res = this.mtrMapper.mtrSttsDelete(mtrVO);
		return res;
	}
	
}
