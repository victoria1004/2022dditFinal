package kr.or.ddit.feed.service;

import java.util.List;

import kr.or.ddit.feed.vo.VoteVO;
import kr.or.ddit.feed.vo.VtRsltVO;

public interface VoteService {
	
	//투표 등록
	public int insertVote(VoteVO voteVO);
	
	//투표 선택지 번호
	public List<VoteVO> getOptnNo(String vtNo);

	
}
