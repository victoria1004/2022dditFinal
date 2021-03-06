package kr.or.ddit.feed.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.feed.vo.VtRsltVO;

public interface VtRsltMapper {
	
	//투표 내용 등록하기
	public int insertRslt(VtRsltVO vtRsltVO);
	
	//투표 선택 수정 
	public int updateRslt(VtRsltVO vtRsltVO);
	
	//투표 결과 출력
	public List<Map<String, Object>> rsltList();
	
	//투표 수 카운트
	public int getCount(VtRsltVO vtRsltVO);
	
	//투표 전체 결과 조회
	public List<VtRsltVO> resultVote();
	
	//나의 투표 여부
	public int checkRslt(VtRsltVO vtRsltVO);
	
	//투표항목별 투표한 멤버 이름 찾기
	public List<Map<String, Object>> getVoter(VtRsltVO vtRsltVO);
}
