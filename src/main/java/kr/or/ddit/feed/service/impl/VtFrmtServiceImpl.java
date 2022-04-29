package kr.or.ddit.feed.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.feed.mapper.VtFrmtMapper;
import kr.or.ddit.feed.service.VtFrmtService;
import kr.or.ddit.feed.vo.VoteVO;
import kr.or.ddit.feed.vo.VtFrmtVO;
import kr.or.ddit.feed.vo.VtRsltVO;

@Service
public class VtFrmtServiceImpl implements VtFrmtService {
	private static final Logger logger = LoggerFactory.getLogger(VtFrmtServiceImpl.class);
	
	@Autowired
	private VtFrmtMapper vtFrmtMapper;
	
	//투표 형식 추가
	@Override
	public int insertVtFrmt(VtFrmtVO vtFrmtVO) {
		return vtFrmtMapper.insertVtFrmt(vtFrmtVO);
	}
	
	//투표 번호 뽑기
	@Override
	public String selectVtNo() {
		return vtFrmtMapper.selectVtNo();
	}
	
	//투표 형식 목록
	@Override
	public List<VtFrmtVO> selectVtFrmt() {
		return vtFrmtMapper.selectVtFrmt();
	}

	//투표번호에 해당하는 투표 내용 가져오기
	@Override
	public List<VoteVO> selectVote() {
		return vtFrmtMapper.selectVote();
	}

	@Override
	public List<VtFrmtVO> selectVoteList(String pjtNo) {
		return vtFrmtMapper.selectVoteList(pjtNo);
	}


}
