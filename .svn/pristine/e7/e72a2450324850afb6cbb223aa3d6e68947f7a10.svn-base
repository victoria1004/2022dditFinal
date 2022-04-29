package kr.or.ddit.feed.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.feed.mapper.VtFrmtMapper;
import kr.or.ddit.feed.mapper.VtRsltMapper;
import kr.or.ddit.feed.service.VtRsltService;
import kr.or.ddit.feed.vo.VtRsltVO;

@Service
public class VtRsltServiceImpl implements VtRsltService{
	private static final Logger logger = LoggerFactory.getLogger(VtRsltServiceImpl.class);
	
	@Autowired
	private VtRsltMapper vtRsltMapper;
	
	//투표 내용 등록하기
	public int insertRslt(VtRsltVO vtRsltVO) {
		return vtRsltMapper.insertRslt(vtRsltVO);
	}
	
	//투표 선택 수정 
	@Override
	public int updateRslt(VtRsltVO vtRsltVO) {
		return vtRsltMapper.updateRslt(vtRsltVO);
	}
	
	//투표 결과 출력
	@Override
	public List<Map<String, Object>> rsltList() {
		return vtRsltMapper.rsltList();
	}
	
	//투표 수 카운트
	@Override
	public int getCount(VtRsltVO vtRsltVO) {
		return vtRsltMapper.getCount(vtRsltVO);
	}

	//투표 전체 결과 조회
	@Override
	public List<VtRsltVO> resultVote() {
		return vtRsltMapper.resultVote();
	}
	
	//나의 투표여부
	@Override
	public int checkRslt(VtRsltVO vtRsltVO) {
		return vtRsltMapper.checkRslt(vtRsltVO);
	}
	
	//투표항목별 투표한 멤버 이름 찾기
	@Override
	public List<Map<String, Object>> getVoter(VtRsltVO vtRsltVO) {
		return vtRsltMapper.getVoter(vtRsltVO);
	}

}
