package kr.or.ddit.project.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.project.vo.IssueVO;
import kr.or.ddit.project.vo.MarkerVO;
import kr.or.ddit.project.vo.TodoVO;
import kr.or.ddit.user.vo.MemberVO;

public interface IssueMapper {

	
	//이슈 목록 보기
	public List<IssueVO> issueSelect(String pjtNo);
		
	//이슈 추가
	public int issueInsert(IssueVO issueVO);
	
	//이슈 수정
	public int issueUpdate(IssueVO issueVO);
	
	//이슈 삭제
	public int issueDelete(String issueNo);
	
	//일감 목록 가져오기
	public List<TodoVO> todoList(String pjtNo);
	
	//issue no 가져오기
	public String issueNoSelect();
	
	//issue 글번호 가져오기
	public List<IssueVO> issueNoGet(String pjtNo);
	
	//글번호와 맞는 마커 가져오기
	public List<MarkerVO> markerSelect();
	
	//작성자 이름 가져오기
	public List<MemberVO> memName();
	
	//일감 이름 가져오기
	public List<TodoVO> mainTodoList();
	
	//issue 글과 사람
	public List<Map<String, Object>> issueSelectMem(String pjtNo);
}
