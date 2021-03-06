package kr.or.ddit.goods.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.goods.ArticlePage;
import kr.or.ddit.goods.service.GdsService;
import kr.or.ddit.goods.vo.GdsMngVO;
import kr.or.ddit.goods.vo.GdsRntVO;
import kr.or.ddit.user.vo.MemberVO;
import kr.or.ddit.util.LogCrud;

@RequestMapping("/gds")
@Controller
public class GdsController {

	private static final Logger logger = LoggerFactory.getLogger(GdsController.class);
	
	@Autowired
	GdsService gdsService;
	
	/**
	 *  일반 사용자 비품 리스트 출력
	 *  
	 * @param model
	 * @param currentPage
	 * @param size
	 * @param keyWord
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/gdsList.do", method = RequestMethod.GET)
	public String gdsList(Model model
			, @RequestParam(defaultValue = "1", required=false) int currentPage
			, @RequestParam(defaultValue = "10", required=false) int size
			, @RequestParam(required = false) String keyWord
			, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPage", currentPage);
		map.put("size", size);
		map.put("keyWord", keyWord);
		
		int total = this.gdsService.totalList(map);
		List<GdsMngVO> list = gdsService.goodsList(map);
		model.addAttribute("list", new ArticlePage(total, currentPage, size, 5, list));
		model.addAttribute("total", total);
		
		return "goods/goodsMain";
	}
	
	/**
	 * 비품 대여하는 메서드
	 * 
	 * @param model
	 * @param map
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/rentGoods", method = RequestMethod.POST)
	public String lentGoods(Model model
			, @RequestParam Map<String, Object> map
			, HttpSession session) {
		GdsRntVO gds = new GdsRntVO();
		if((gdsService.gdsSelect((String) map.get("gdsNoModal")) - gdsService.rntSelect((String) map.get("gdsNoModal"))) >= Integer.parseInt((String) map.get("demo_vertical"))) {
			logger.info(">>"+(gdsService.gdsSelect((String) map.get("gdsNoModal")) - gdsService.rntSelect((String) map.get("gdsNoModal"))) + "++++" + Integer.parseInt((String) map.get("demo_vertical")));
			return "redirect:/gds/gdsList.do";
		}else {
			gds.setGdsNo((String) map.get("gdsNoModal"));
			gds.setMbrId(((MemberVO)session.getAttribute("member")).getMbrId());
			gds.setRtnPrnmntDt((String) map.get("rtnPrnmntDt"));
			gds.setRntCnt(Integer.parseInt((String) map.get("demo_vertical")));
			
			this.gdsService.rentGoods(gds);
		}
		return "redirect:/gds/gdsList.do";
	}
	
	/**
	 * 관리자 비품 리스트 출력
	 * 
	 * @param model
	 * @param currentPage
	 * @param size
	 * @param keyWord
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/goodsAdmin.do", method = RequestMethod.GET)
	public String goodsAdmin(Model model
			, @RequestParam(defaultValue = "1", required=false) int currentPage
			, @RequestParam(defaultValue = "10", required=false) int size
			, @RequestParam(required = false) String keyWord
			, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPage", currentPage);
		map.put("size", size);
		map.put("keyWord", keyWord);
		
		int total = this.gdsService.totalList(map);
		List<GdsMngVO> list = gdsService.goodsList(map);
		model.addAttribute("list", new ArticlePage(total, currentPage, size, 5, list));
		model.addAttribute("total", total);
		
		return "goods/goodsAdmin";
	}
	
	/**
	 * 선택한 비품을 대여한 사람들 리스트
	 * 
	 * @param model
	 * @param gdsNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/rentUserTb", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public List<GdsRntVO> rentUserTb(Model model, @RequestParam String gdsNo) {
		List<GdsRntVO> list = gdsService.rentUserTb(gdsNo);
		return list;
	}
	
	/**
	 * 반납을 완료하여 대여반납 날짜 삽입
	 * 
	 * @param model
	 * @param rntNo
	 */
	@ResponseBody
	@RequestMapping(value = "/rtnUser", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public void rtnUser(Model model, @RequestParam String rntNo) {
		gdsService.rtnUser(rntNo);
	}
	
	/**
	 * 선택한 비품을 삭제
	 * 
	 * @param model
	 * @param gdsNo
	 */
	@ResponseBody
	@RequestMapping(value = "/goodsDelete", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public void goodsDelete(Model model, @RequestParam String gdsNo) {
		gdsService.goodsDelete(gdsNo);
		LogCrud.getDelete("GdsController");
	}
	
	/**
	 * 새로운 비품을 등록
	 * 
	 * @param goodsNm
	 * @param goodsStock
	 * @param gdsMngVO
	 */
	@RequestMapping(value = "/gdsRegister", method = RequestMethod.POST)
	public String gdsRegister(@RequestParam String goodsNm, @RequestParam String goodsStock, GdsMngVO gdsMngVO) {
		logger.info("이름 : " + goodsNm);
		logger.info("수량 : " + goodsStock);
		gdsMngVO.setGdsNm(goodsNm);
		gdsMngVO.setGdsStock(goodsStock);
		gdsService.gdsregister(gdsMngVO);
		LogCrud.getCreate("GdsController");
		
		return "redirect:/gds/goodsAdmin.do";
	}
	
	
}
