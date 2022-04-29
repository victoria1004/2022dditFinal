package kr.or.ddit.project.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.project.mapper.TrsmFileMapper;
import kr.or.ddit.project.service.TrsmFileService;
import kr.or.ddit.project.vo.TrsmFileVO;

@Service
public class TsrmFileServiceImpl implements TrsmFileService {

	@Autowired
	private TrsmFileMapper trsmFileMapper;
	
	//메일 보낼때 첨부파일 있으면 인서트
	@Override
	public int trsmFileEmailInsert(TrsmFileVO trsmFileVO) {
		return trsmFileMapper.trsmFileEmailInsert(trsmFileVO);
	}

	
	
	
	

}
