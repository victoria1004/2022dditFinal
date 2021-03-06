package kr.or.ddit.project.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.project.vo.ReportVO;
import kr.or.ddit.project.vo.TrsmFileVO;

public interface ReportMapper {
	
	//업무보고 목록
	public List<Map<String, Object>> reportList(Map<String, Object> map) ;
	
	//업무보고 작성
	public int reportInsert(ReportVO reportVO);
	
	//방금 등록한 업무보고 번호 뽑기
	public String selectRptNo();
	
	//업무보고 첨부파일 등록
	public int trsmFileUpload(TrsmFileVO trsmFileVO);
	
	//전송파일 테이블에서 업무보고 첨부파일 가져오기
	public List<TrsmFileVO> getTrsmFile(String rptNo);
	
	//첨부파일 다운로드
	public TrsmFileVO downTrsmFile(String fileNo);
	
	//업무보고 수정
	public int reportUpdate(ReportVO reportVO);
	
	//업무보고 승인/반려
	public int reportConfirm(ReportVO reportVO);
	
	//승인 반려를 위한 권한 아이디 찾기
	public List<Map<String, Object>> getMember(String pjtNo);
	
	//업무보고 삭제
	public int reportDelete(String rptNo);
	
	//업무보고 상세조회
	public List<Map<String,Object>> reportDetail(ReportVO reportVO);
	
	//업무보고 개수 가져오기
	public int reportTotal(Map<String, Object> map);

}
