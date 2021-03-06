package kr.or.ddit.goods.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.goods.vo.GdsMngVO;
import kr.or.ddit.goods.vo.GdsRntVO;

public interface GdsService {
	
	// 한페이지 목록 가져오기
	public List<GdsMngVO> goodsList(Map<String, Object> map);
	
	// 전체 비품 리스트 총 개수 가져오기
	public int totalList(Map<String, Object> map);
	
	// 대여하기
	public int rentGoods(GdsRntVO gdsRntVO);
	
	// 로그인한 사용자의 비품 대여상태
	public List<GdsMngVO> userRent(String mbrId);
	
	// 비품별 대여자 목록
	public List<GdsRntVO> rentUserTb(String gdsNo);
	
	// 비품 반납 처리
	public int rtnUser(String rntNo);
	
	// 비품 삭제 처리
	public int goodsDelete(String gdsNo);
	
	// 비품 등록 처리
	public int gdsregister(GdsMngVO gdsMngVO);
	
	// 비품 남은 개수
	public int rntSelect(String rntCnt);
	
	// 비품 남은 개수
	public int gdsSelect(String rntCnt);
}
