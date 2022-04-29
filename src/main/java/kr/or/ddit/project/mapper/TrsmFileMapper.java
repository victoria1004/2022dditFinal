package kr.or.ddit.project.mapper;

import kr.or.ddit.project.vo.TrsmFileVO;

public interface TrsmFileMapper {

	//이메일보내기에서 첨부파일 넣기 
	public int trsmFileEmailInsert(TrsmFileVO trsmFileVO);
}
