package kr.or.ddit.feed.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.feed.mapper.VoteMapper;
import kr.or.ddit.feed.mapper.VtFrmtMapper;
import kr.or.ddit.feed.service.VoteService;
import kr.or.ddit.feed.vo.VoteVO;
import kr.or.ddit.feed.vo.VtRsltVO;

@Service
public class VoteServiceImpl implements VoteService {
	private static final Logger logger = LoggerFactory.getLogger(VoteServiceImpl.class);

	@Autowired
	private VoteMapper voteMapper;
	
	@Autowired
	private VtFrmtMapper vtFrmtMapper;
	
	@Override
	public int insertVote(VoteVO voteVO) {
		return voteMapper.insertVote(voteVO);
	}

	@Override
	public List<VoteVO> getOptnNo(String vtNo) {
		return voteMapper.getOptnNo(vtNo);
	}

}
