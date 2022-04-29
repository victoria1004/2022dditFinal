package kr.or.ddit.cloud.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.cloud.mapper.CloudMapper;
import kr.or.ddit.cloud.service.CloudService;
import kr.or.ddit.cloud.vo.FldrVO;
import kr.or.ddit.cloud.vo.StrgVO;

@Service
public class CloudServiceImpl implements CloudService {

	@Inject CloudMapper mapper;
	
	@Override
	public int insert(StrgVO vo) {
		return mapper.insert(vo);
	}

	@Override
	public List<StrgVO> selectAll(Map<String, Object> map) {
		return mapper.selectAll(map);
	}

	@Override
	public String getFolder(Map<String, String> map) {
		return mapper.getFolder(map);
	}

	@Override
	public List<FldrVO> getLowFolders(Map<String, String> map) {
		return mapper.getLowFolders(map);
	}

	@Override
	public int insertFldr(FldrVO vo) {
		return mapper.insertFldr(vo);
	}

	@Override
	public int fileDelete(String strgFileNo) {
		return mapper.fileDelete(strgFileNo);
	}

	@Override
	public StrgVO getDownloadFile(String strgFileNo) {
		return mapper.getDownloadFile(strgFileNo);
	}

	@Override
	public List<FldrVO> getAllLeafFolders(Map<String, String> map) {
		return mapper.getAllLeafFolders(map);
	}

	@Override
	public List<String> getLeaf(Map<String, String> map) {
		return mapper.getLeaf(map);
	}

	@Override
	public int fileCount(Map<String, Object> map) {
		return mapper.fileCount(map);
	}

	@Override
	public int getAllSz(String pjtNo) {
		return mapper.getAllSz(pjtNo);
	}

	
	/**
	 * 생성한 프로젝트 번호와 프로젝트 이름으로 클라우드 생성
	 */
	@Override
	public int mkCloud(String pjtNo, String pjtNm) {
		Map<String, String> map = new HashMap<String,String>();
		map.put("pjtNo", pjtNo);
		map.put("pjtNm", pjtNm);
		return mapper.mkCloud(map);
	}

	
	
	
	
	
	
}


