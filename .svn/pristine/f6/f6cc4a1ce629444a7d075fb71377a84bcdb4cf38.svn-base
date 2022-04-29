package kr.or.ddit.project.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.project.mapper.KanbanMapper;
import kr.or.ddit.project.service.KanbanService;
import kr.or.ddit.project.vo.KanbanVO;

@Service
public class KanbanServiceImpl implements KanbanService {

	@Autowired
	private KanbanMapper kanbanMapper;

	
	//칸반 추가
	@Override
	public int kanbanInsert(KanbanVO kanbanVO) {
		return kanbanMapper.kanbanInsert(kanbanVO);
	}

	//칸반 조회
	@Override
	public List<KanbanVO> kanbanSelect(String pjtNo) {
		return kanbanMapper.kanbanSelect(pjtNo);
	}

	//칸반 수정
	@Override
	public int kanbanUpdate(KanbanVO kanbanVO) {
		return kanbanMapper.kanbanUpdate(kanbanVO);
	}

	//칸반 삭제 
	@Override
	public int kanbanDelete(String kbNo) {
		return kanbanMapper.kanbanDelete(kbNo);
		
	}

	//칸반 카드 삭제 
	@Override
	public int kanbanNoDelete(String kbNo) {
		return kanbanMapper.kanbanNoDelete(kbNo);
	}

	
	//PL가져오기
	@Override
	public String plSelect(String pjtNo) {
		return kanbanMapper.plSelect(pjtNo);
	}
}
