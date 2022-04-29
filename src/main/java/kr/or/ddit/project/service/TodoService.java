package kr.or.ddit.project.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.project.vo.MarkerVO;
import kr.or.ddit.project.vo.TodoVO;
import kr.or.ddit.util.CmDvsnCtgrVO;

public interface TodoService {

	//마커 가져오기
	public List<MarkerVO> getMarkers(String pjtNo);
	
	//일감 insert
	public int insertTodo(TodoVO todoVO);

	//일감 분류코드 가져오기
	public List<CmDvsnCtgrVO> getTodoCd();

	//일감 목록
	public List<Map<String, Object>> getAllTodos(Map<String, Object> map);
	
	//일감 하나
	public Map<String, Object> getTodo(String tdNo);
	
	//상위 일감 세팅 
	public int bemyParent(Map<String, Object> map);
	
	//하위 일감 세팅 
	public int bemyChild(Map<String, Object> map);
	
	//기존 하위일감은 부모 지워주기
	public int removeParent(String tdNo);
	
	// 전체 일감리스트 총 개수 가져오기
	public int totalList(Map<String, Object> map);

	// 일감 수정
	public int updateTodo(TodoVO vo);
	
	//업데이트 전 기존 객체 가져오기
	public TodoVO getBeforeTd(String tdNo);

	//내 일감 상태별 개수
	public List<Map<String, Object>> myTodoCount (Map<String, Object> map);
	
	//프로젝트 구성원 일감 상태별 개수
	public List<Map<String, Object>> totalTodoCount (String pjtNo);
	
	// 프로젝트 구성원
	public List<String> pjtMember(String pjtNo);
	
	//일감 삭제
	public int deleteTodo(String tdNo);
	
	// 프로젝트 별 진행도
	public int projectProgress(String pjtNo);
	
	
	
	
}
