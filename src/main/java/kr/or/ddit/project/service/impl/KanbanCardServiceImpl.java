package kr.or.ddit.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.project.mapper.KanbanCardMapper;
import kr.or.ddit.project.service.KanbanCardService;
import kr.or.ddit.project.vo.KanbanCardVO;

@Service
public class KanbanCardServiceImpl implements KanbanCardService {

	@Autowired
	private KanbanCardMapper kanbanCardMapper;
	
	//칸반 카드 조회
	@Override
	public List<KanbanCardVO> kanbanCardSelect() {
		return kanbanCardMapper.kanbanCardSelect();
	}

	//칸반 카드 추가
	@Override
	public int kanbanCardInsert(KanbanCardVO kanbanCardVO) {
		return kanbanCardMapper.kanbanCardInsert(kanbanCardVO);
	}

	//칸반 카드 수정
	@Override
	public int kanbanCardUpdate(KanbanCardVO kanbanCardVO) {
		return kanbanCardMapper.kanbanCardUpdate(kanbanCardVO);
		
	}

	//칸반 카드 삭제
	@Override
	public int kanbanCardDelete(String kbCardNo) {
		return kanbanCardMapper.kanbanCardDelete(kbCardNo);
	}

	//칸반 카드 순서
	@Override
	public int kanbanCardUpdate2(HashMap<String, Object> map) {
		return kanbanCardMapper.kanbanCardUpdate2(map);
	}
	
	@Override
	public int kanbanCardUpdate3(HashMap<String, Object> map) {
		return kanbanCardMapper.kanbanCardUpdate3(map);
	}



}
