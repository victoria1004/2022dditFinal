package kr.or.ddit.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.project.vo.KanbanCardVO;

@Service
public interface KanbanCardService {
	
	
	//칸반 카드 보기
	public List<KanbanCardVO> kanbanCardSelect();
	
	//칸반 카드 추가
	public int kanbanCardInsert(KanbanCardVO kanbanCardVO);
	
	//칸반 카드 수정
	public int kanbanCardUpdate(KanbanCardVO kanbanCardVO);
	
	//칸반 카드 삭제
	public int kanbanCardDelete(String kbCardNo);
	
	//칸반 카드 순서
	public int kanbanCardUpdate2(HashMap<String, Object> map);
	
	public int kanbanCardUpdate3(HashMap<String, Object> map);
	
	
}
