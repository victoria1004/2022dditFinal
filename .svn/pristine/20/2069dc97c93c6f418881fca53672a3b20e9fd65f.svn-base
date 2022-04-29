package kr.or.ddit.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.project.vo.KanbanVO;

@Service
public interface KanbanService {
	
	//칸반 조회
	public List<KanbanVO> kanbanSelect(String pjtNo);
	
	//칸반 추가
	public int kanbanInsert(KanbanVO kanbanVO);
	
	//칸반 수정
	public int kanbanUpdate(KanbanVO kanbanVO);

	//칸반 삭제
	public int kanbanDelete(String kbNo);
	
	//칸반 카드 삭제
	public int kanbanNoDelete(String kbNo);
	
	//PL가져오기
	public String plSelect(String pjtNo);
}
