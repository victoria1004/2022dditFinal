package kr.or.ddit.project.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.project.mapper.IssueMapper;
import kr.or.ddit.project.service.IssueService;
import kr.or.ddit.project.vo.IssueVO;
import kr.or.ddit.project.vo.MarkerVO;
import kr.or.ddit.project.vo.TodoVO;
import kr.or.ddit.user.vo.MemberVO;

@Service
public class IssueServiceImpl implements IssueService {
	
	private static final Logger logger = LoggerFactory.getLogger(IssueServiceImpl.class);
	
	@Autowired
	private IssueMapper issueMapper;

	@Override
	public List<IssueVO> issueSelect(String pjtNo) {
		return issueMapper.issueSelect(pjtNo);
	}

	@Override
	public int issueInsert(IssueVO issueVO) {
		return issueMapper.issueInsert(issueVO);
	}

	@Override
	public int issueUpdate(IssueVO issueVO) {
		return issueMapper.issueUpdate(issueVO);
	}

	@Override
	public int issueDelete(String issueNo) {
		return issueMapper.issueDelete(issueNo);
	}

	//일감 목록 가져오기
	@Override
	public List<TodoVO> todoList(String pjtNo) {
		return issueMapper.todoList(pjtNo);
	}
	
	//issue no 가져오기
	@Override
	public String issueNoSelect() {
		return issueMapper.issueNoSelect();
	}
	
	//글번호와 맞는 마커 가져오기
	@Override
	public List<MarkerVO> markerSelect() {
		return issueMapper.markerSelect();
	}

	//issue 글번호 가져오기
	@Override
	public List<IssueVO> issueNoGet(String pjtNo) {
		return issueMapper.issueNoGet(pjtNo);
	}

	//작성자 이름 가져오기
	@Override
	public List<MemberVO> memName() {
		return issueMapper.memName();
	}
	
	//일감 제목 가져오기
	@Override
	public List<TodoVO> mainTodoList() {
		return issueMapper.mainTodoList();
	}

	@Override
	public List<Map<String, Object>> issueSelectMem(String pjtNo) {
		return issueMapper.issueSelectMem(pjtNo);
	}






}
