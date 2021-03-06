package kr.or.ddit.cloud.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.cloud.vo.FldrVO;
import kr.or.ddit.cloud.vo.StrgVO;

public interface CloudService {

	//클라우드에 파일 업로드
	public int insert(StrgVO vo);
	
	//클라우드 파일목록 조회
	public List<StrgVO> selectAll(Map<String, Object> map);
	
	//클라우드 현재폴더 조회
	public String getFolder(Map<String, String> map);
	
	//현재폴더 클릭 시 하위 폴더목록 조회
	public List<FldrVO> getLowFolders(Map<String, String> map);
	
	//파일 업로드 시 하위,상위 폴더 데이터 insert
	public int insertFldr(FldrVO vo);
	
	//파일 선택 후 삭제 
	public int fileDelete(String strgFileNo);
	
	//파일다운로드 시 해당 파일명과 파일저장경로 꺼내오는 메서드
	public StrgVO getDownloadFile(String strgFileNo);
	
	//클라우드 접근 시 좌측 메뉴에 하위 폴더 목록 출력
	public List<FldrVO> getAllLeafFolders(Map<String, String> map);

	//계층 메뉴 중 하나 선택 시 하위 폴더 가져오는 메서드
	public List<String> getLeaf(Map<String, String> map);
	
	//모든 파일 수 가져오기 (페이징 처리)
	public int fileCount(Map<String, Object> map);
	
	//프로젝트 메인 화면에서 해당 프로젝트의 총 클라우드 사용량 가져오기
	public int getAllSz(String pjtNo);	
	
	//프로젝트 생성 시 클라우드 폴더 생성
	public int mkCloud(String pjtNo, String pjtNm);
	
	
	
	
	
}
