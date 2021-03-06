package kr.or.ddit.admin.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.common.collect.Lists;

import kr.or.ddit.admin.ArticlePage;
import kr.or.ddit.admin.service.LogService;
import kr.or.ddit.admin.vo.LogVO;
import kr.or.ddit.util.LogCrud;

@RequestMapping("/admin")
@Controller
public class AdminLogController {
	private static final Logger logger = LoggerFactory.getLogger(AdminLogController.class);
	
	@Autowired
	LogService logService;
	
	@RequestMapping(value="/list.do", method = RequestMethod.GET)
	public String list(Model model
			, @RequestParam(defaultValue = "1", required=false) int currentPage
			, @RequestParam(defaultValue = "10", required=false) int size
			, @RequestParam(required = false) String keyWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyWord", keyWord);
		map.put("size", size);
		map.put("currentPage", currentPage);
		int total = this.logService.getTotal(map);
		List<LogVO> list = this.logService.logList(map);
		List<List<LogVO>> lists = Lists.partition(list, size);
		model.addAttribute("list", new ArticlePage(total, currentPage, size, 5, lists.get(currentPage-1)));
		model.addAttribute("total", total);
		model.addAttribute("totallist", list);
		return "admin/crudLog";
		
	}
	
	@RequestMapping(value="/list.do", method = RequestMethod.POST)
	public void poiList(Model model, HttpServletResponse response,
            HttpServletRequest request) throws Exception{
		logger.info("????????????");
		List<LogVO> list = new ArrayList<LogVO>();
		list = logService.totalList();
		
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("Sheet1"); 
		
		CellStyle style = wb.createCellStyle();
		Font font = wb.createFont();
		
		font.setFontHeight((short)(16*18));
		font.setFontName("?????? ??????");
		
		Row titleRow = sheet.createRow(0);
		int titleColNum = 0;
		Cell titleCell = titleRow.createCell(titleColNum);
		titleCell.setCellValue("?????? ?????? ??????");
		titleRow.setHeight((short)920);
		sheet.addMergedRegion(new CellRangeAddress(0,0,0,6));
		
		style.setWrapText(true);
		style.setFont(font);
		titleCell.setCellStyle(style);
		
		Row headerRow = sheet.createRow(3);
		int headerCol = 0;
		Cell headerCell = headerRow.createCell(headerCol++);
		headerCell.setCellValue("??????");
		headerCell = headerRow.createCell(headerCol++);
		headerCell.setCellValue("??????");
		headerCell = headerRow.createCell(headerCol++);
		headerCell.setCellValue("?????? IP");
		headerCell = headerRow.createCell(headerCol++);
		headerCell.setCellValue("????????????");
		headerCell = headerRow.createCell(headerCol);
		headerCell.setCellValue("????????????");
		
		CellStyle dataStyle = wb.createCellStyle();
		
		int rowNum = 4; // ??????????????? ???????????? ??? ??????????????? ????????? ??????
        int cellNum = 0;
        Row dataRow = null; // for?????? ??????????????????.
        Cell dataCell = null;
		
        for(int i = 0; i < list.size(); i++) {
        	cellNum = 0;
        	dataRow = sheet.createRow(rowNum++);
        	
        	dataCell = dataRow.createCell(cellNum++);
        	dataCell.setCellValue(list.get(i).getLogNo());
        	dataCell.setCellStyle(dataStyle);
        	
        	dataCell = dataRow.createCell(cellNum++);
        	dataCell.setCellValue(list.get(i).getLogAddr());
        	dataCell.setCellStyle(dataStyle);
        	
        	dataCell = dataRow.createCell(cellNum++);
        	dataCell.setCellValue(list.get(i).getLogIpAddr());
        	dataCell.setCellStyle(dataStyle);
        	
        	dataCell = dataRow.createCell(cellNum++);
        	dataCell.setCellValue(list.get(i).getLogDt());
        	dataCell.setCellStyle(dataStyle);
        	
        	dataCell = dataRow.createCell(cellNum);
        	dataCell.setCellValue(list.get(i).getLogNm());
        	dataCell.setCellStyle(dataStyle);
        }
        
		response.setContentType("ms-vnd/excel");
		
		response.setHeader("Content-Disposition", "attachment;filename=LogDownload.xls");
		wb.write(response.getOutputStream());
	}
}






























