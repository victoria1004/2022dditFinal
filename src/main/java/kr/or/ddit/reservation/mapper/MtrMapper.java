package kr.or.ddit.reservation.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.reservation.vo.MtrRsvtVO;
import kr.or.ddit.reservation.vo.MtrVO;

public interface MtrMapper {
	//특정일 예약정보 조회
	public List<Map<String,Object>> todayRes(String rsvtYmd);
	
	//예약 등록
	public int resInsert(MtrRsvtVO mtrrVO);
	
	//예약 정보 단건 조회
	public MtrRsvtVO resSelectOne(MtrRsvtVO mtrrVO);
	
	//예약 취소(예약정보 삭제)
	public int resDelete(MtrRsvtVO mtrrVO);
	
	//회의실 비품 구비현황 조회
	public List<Map<String,Object>> mtrStts();
	
	//회의실 비품 추가
	public int mtrSttsInsert(MtrVO mtrVO);
	
	//회의실 비품 삭제
	public int mtrSttsDelete(MtrVO mtrVO);
}
