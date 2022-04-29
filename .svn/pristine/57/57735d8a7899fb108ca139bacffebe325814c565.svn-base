package kr.or.ddit.feed.mapper;

import java.util.List;

import kr.or.ddit.feed.vo.VoteVO;
import kr.or.ddit.feed.vo.VtFrmtVO;

public interface VtFrmtMapper {
	
	//투표 형식 등록
	public int insertVtFrmt(VtFrmtVO vtFrmtVO);
	
	//투표 번호 뽑기
	public String selectVtNo();
	
	//투표 형식 목록
	public List<VtFrmtVO> selectVtFrmt();
	
	//투표번호에 해당하는 투표 내용 가져오기
	public List<VoteVO> selectVote();

	//투표가 있는 피드와 내용 출력
	public List<VtFrmtVO> selectVoteList(String pjtNo);
}
