package kr.or.ddit.project.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.project.mapper.ReportMapper;
import kr.or.ddit.project.service.ReportService;
import kr.or.ddit.project.vo.ReportVO;
import kr.or.ddit.project.vo.TrsmFileVO;

@Service
public class ReportServiceImpl implements ReportService {
	private static final Logger logger = LoggerFactory.getLogger(ReportService.class);
		
	@Autowired
	private ReportMapper reportMapper;
	
	//업무보고 목록
	@Override
	public List<Map<String, Object>> reportList(Map<String, Object> map) {
		return reportMapper.reportList(map);
	}
	
	//업무보고 등록
	@Override
	public int reportInsert(ReportVO reportVO) {
		return reportMapper.reportInsert(reportVO);
	}
	
	//업무보고 수정
	@Override
	public int reportUpdate(ReportVO reportVO) {
		return reportMapper.reportUpdate(reportVO);
	}
	
	//업무보고 삭제
	@Override
	public int reportDelete(String rptNo) {
		return reportMapper.reportDelete(rptNo);
	}
	
	//업무보고 상세조회
	@Override
	public List<Map<String, Object>> reportDetail(ReportVO reportVO) {
		return reportMapper.reportDetail(reportVO);
	}

	
	//업무보고 개수 가져오기
	@Override
	public int reportTotal(Map<String, Object> map) {
		return reportMapper.reportTotal(map);
	}
	
	//PL의 업무보고 승인/반려
	@Override
	public int reportConfirm(ReportVO reportVO) {
		return reportMapper.reportConfirm(reportVO);
	}
	
	//업무보고 첨부파일 등록
	@Override
	public int trsmFileUpload(TrsmFileVO trsmFileVO) {
		return reportMapper.trsmFileUpload(trsmFileVO);
	}
	
	//방금 등록한 업무보고 번호 뽑기
	@Override
	public String selectRptNo() {
		return reportMapper.selectRptNo();
	}
	
	//전송파일 테이블에서 업무보고 첨부파일 가져오기
	@Override
	public List<TrsmFileVO> getTrsmFile(String rptNo) {
		return reportMapper.getTrsmFile(rptNo);
	}
	
	//첨부파일 클릭 시 해당 파일 다운로드
	@Override
	public TrsmFileVO downTrsmFile(String fileNo) {
		return reportMapper.downTrsmFile(fileNo);
	}
	
	//업무 보고 승인/반려를 위한 아이디 찾기
	@Override
	public List<Map<String, Object>> getMember(String pjtNo) {
		return reportMapper.getMember(pjtNo);
	}


}
