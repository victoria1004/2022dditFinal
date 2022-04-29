package kr.or.ddit.project.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.project.mapper.TodoMapper;
import kr.or.ddit.project.service.TodoService;
import kr.or.ddit.project.vo.MarkerVO;
import kr.or.ddit.project.vo.TodoVO;
import kr.or.ddit.util.CmDvsnCtgrVO;

@Service
public class TodoServiceImpl implements TodoService {
	@Autowired 
	TodoMapper mapper;

	@Override
	public List<MarkerVO> getMarkers(String pjtNo) {
		return mapper.getMarkers(pjtNo);
	}

	@Override
	public int insertTodo(TodoVO todoVO) {
		return mapper.insertTodo(todoVO);
	}

	@Override
	public List<CmDvsnCtgrVO> getTodoCd() {
		return mapper.getTodoCd();
	}

	@Override
	public List<Map<String, Object>> getAllTodos(Map<String, Object> map) {
		return mapper.getAllTodos(map);
	}

	@Override
	public Map<String, Object> getTodo(String tdNo) {
		return mapper.getTodo(tdNo);
	}

	@Override
	public int bemyParent(Map<String, Object> map) {
		return mapper.bemyParent(map);
	}

	@Override
	public int bemyChild(Map<String, Object> map) {
		return mapper.bemyChild(map);
	}

	@Override
	public int removeParent(String tdNo) {
		return mapper.removeParent(tdNo);
	}

	@Override
	public int totalList(Map<String, Object> map) {
		return mapper.totalList(map);
	}

	@Override
	public int updateTodo(TodoVO vo) {
		return mapper.updateTodo(vo);
	}

	@Override
	public TodoVO getBeforeTd(String tdNo) {
		return mapper.getBeforeTd(tdNo);
	}

	@Override
	public List<Map<String, Object>> myTodoCount(Map<String, Object> map) {
		return mapper.myTodoCount(map);
	}

	@Override
	public List<Map<String, Object>> totalTodoCount(String pjtNo) {
		return mapper.totalTodoCount(pjtNo);
	}

	@Override
	public List<String> pjtMember(String pjtNo) {
		return mapper.pjtMember(pjtNo);
	}
	
	@Override
	public int deleteTodo(String tdNo) {
		return mapper.deleteTodo(tdNo);
	}

	@Override
	public int projectProgress(String pjtNo) {
		return mapper.projectProgress(pjtNo);
	}


	

	
}
