package kr.or.ddit.feed.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.feed.mapper.PstMapper;
import kr.or.ddit.feed.service.PstService;
import kr.or.ddit.feed.vo.PstCmntVO;
import kr.or.ddit.feed.vo.PstVO;
import kr.or.ddit.project.vo.TrsmFileVO;
import kr.or.ddit.user.vo.MemberVO;

@Service
public class PstServiceImpl implements PstService {
	
	private static final Logger logger = LoggerFactory.getLogger(PstServiceImpl.class);

	@Autowired
	private PstMapper pstMapper;
	
	//피드 등록
	@Override
	public int insert(PstVO pstVO) {
		return pstMapper.insert(pstVO);
	}
	
	//피드 목록
	@Override
	public List<Map<String, Object>> select(String pjtNo) {
		return pstMapper.select(pjtNo);
	}
	
	//피드 수정
	@Override
	public int update(PstVO pstVO) {
		return pstMapper.update(pstVO);
	}
	
	//피드 삭제
	@Override
	public int delete(String pstNo) {
		return pstMapper.delete(pstNo);
	}
	
	//댓글 목록
	@Override
	public List<Map<String, Object>> cmntList() {
		return pstMapper.cmntList();
	}

	//댓글 등록
	@Override
	public int cmntInsert(PstCmntVO cmntVO) {
		return pstMapper.cmntInsert(cmntVO);
	}
	
	//한 개의 피드에 한명의 멤버가 쓴 댓글 조회
	@Override
	public List<Map<String, Object>> cmntMbr(PstCmntVO cmntVO) {
		return pstMapper.cmntMbr(cmntVO);
	}
	
	//댓글 수정
	@Override
	public int cmntUpdate(PstCmntVO cmntVO) {
		return pstMapper.cmntUpdate(cmntVO);
	}
	
	//댓글 삭제
	@Override
	public int cmntDelete(String cmntNo) {
		return pstMapper.cmntDelete(cmntNo);
	}
	
	//피드번호뽑기
	@Override
	public String selectPstNo() {
		return pstMapper.selectPstNo();
	}
	
	//프로젝트 번호 뽑기
	@Override
	public String getPjtNo(String pstNo) {
		return pstMapper.getPjtNo(pstNo);
	}
	
	//파일 업로드
	@Override
	public int pstFileUpload(TrsmFileVO trsmFileVO) {
		return pstMapper.pstFileUpload(trsmFileVO);
	}
	
	//첨부파일 가져오기
	@Override
	public List<TrsmFileVO> getPstFile() {
		return pstMapper.getPstFile();
	}
	
}
