package kr.or.ddit.goods.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.goods.mapper.GdsMapper;
import kr.or.ddit.goods.service.GdsService;
import kr.or.ddit.goods.vo.GdsMngVO;
import kr.or.ddit.goods.vo.GdsRntVO;

@Service
public class GdsServiceImpl implements GdsService{
	
	@Autowired
	GdsMapper gdsMapper;
	
	@Override
	public List<GdsMngVO> goodsList(Map<String, Object> map) {
		return this.gdsMapper.goodsList(map);
	}

	@Override
	public int totalList(Map<String, Object> map) {
		return this.gdsMapper.totalList(map);
	}

	@Override
	public int rentGoods(GdsRntVO gdsRntVO) {
		return this.gdsMapper.rentGoods(gdsRntVO);
	}

	@Override
	public List<GdsMngVO> userRent(String mbrId) {
		return this.gdsMapper.userRent(mbrId);
	}

	@Override
	public List<GdsRntVO> rentUserTb(String gdsNo) {
		return this.gdsMapper.rentUserTb(gdsNo);
	}

	@Override
	public int rtnUser(String rntNo) {
		return this.gdsMapper.rtnUser(rntNo);
	}

	@Override
	public int goodsDelete(String gdsNo) {
		return this.gdsMapper.goodsDelete(gdsNo);
	}

	@Override
	public int gdsregister(GdsMngVO gdsMngVO) {
		return this.gdsMapper.gdsregister(gdsMngVO);
	}

	@Override
	public int rntSelect(String rntCnt) {
		return this.gdsMapper.gdsSelect(rntCnt);
	}
	@Override
	public int gdsSelect(String rntCnt) {
		return this.gdsMapper.gdsSelect(rntCnt);
	}

}
