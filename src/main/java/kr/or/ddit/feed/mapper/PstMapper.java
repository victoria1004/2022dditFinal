package kr.or.ddit.feed.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.feed.vo.PstCmntVO;
import kr.or.ddit.feed.vo.PstVO;
import kr.or.ddit.project.vo.TrsmFileVO;
import kr.or.ddit.user.vo.MemberVO;

public interface PstMapper {
	
	//피드 등록
	public int insert(PstVO pstVO);
	
	//파일 업로드
	public int pstFileUpload(TrsmFileVO trsmFileVO);
	
	//피드 작성자 정보 가져오기
	public MemberVO findPstWriter(String pstNo);
	
	//피드번호뽑기
	public String selectPstNo();
	
	//피드 목록
	public List<Map<String, Object>> select(String pjtNo);
	
	//피드 수정
	public int update(PstVO pstVO);
	
	//피드 삭제
	public int delete(String pstNo);
	
	//댓글 목록
	public List<Map<String, Object>> cmntList();
	
	//한 개의 피드에 한명의 멤버가 쓴 댓글 조회
	public List<Map<String, Object>> cmntMbr(PstCmntVO cmntVO);
	
	//댓글 등록
	public int cmntInsert(PstCmntVO cmntVO);
	
	//댓글 수정
	public int cmntUpdate(PstCmntVO cmntVO);
	
	//댓글 삭제
	public int cmntDelete(String cmntNo);
	
	//댓글 멘션시 프로젝트 번호 꺼내서 알람메시지에 insert해주는 용도
	public String getPjtNo(String pstNo);
	
	//첨부 이미지 가져오기
	public List<TrsmFileVO> getPstFile();
	
	
	
	
}
