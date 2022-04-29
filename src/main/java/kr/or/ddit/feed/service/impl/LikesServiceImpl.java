package kr.or.ddit.feed.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.feed.mapper.LikesMapper;
import kr.or.ddit.feed.service.LikesService;
import kr.or.ddit.feed.vo.LikesVO;
@Service
public class LikesServiceImpl implements LikesService {
	
	@Autowired
	private LikesMapper likesMapper;

	//좋아요 추가
	@Override
	public int insertLikes(LikesVO likesVO) {
		return likesMapper.insertLikes(likesVO);
	}

	//좋아요 삭제
	@Override
	public int deleteLikes(LikesVO likesVO) {
		return likesMapper.deleteLikes(likesVO);
	}
	
	//좋아요 개수
	@Override
	public int selectLikes(String pstNo) {
		return likesMapper.selectLikes(pstNo);
	}

	//좋아요 조회
	@Override
	public List<LikesVO> findLikes(String mbrId) {
		return likesMapper.findLikes(mbrId);
	}

	@Override
	public int checkLikes(LikesVO likesVO) {
		return likesMapper.checkLikes(likesVO);
	}



	
	

}
