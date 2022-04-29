package kr.or.ddit.util;

import java.net.InetAddress;
import java.net.UnknownHostException;

import org.apache.log4j.MDC;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogCrud {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(LogCrud.class);
	
	public static void getCreate(String className) {
		
		try {
			MDC.put("class", className);
			MDC.put("clientId", InetAddress.getLocalHost().getHostAddress());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		logger.info("등록");
		
	}
	public static void getModify(String className) {
		
		try {
			MDC.put("class", className);
			MDC.put("clientId", InetAddress.getLocalHost().getHostAddress());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		logger.info("수정");
		
	}
	public static void getDelete(String className) {
		
		try {
			MDC.put("class", className);
			MDC.put("clientId", InetAddress.getLocalHost().getHostAddress());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		logger.info("삭제");
		
	}
	public static void getDownload(String className) {
		
		try {
			MDC.put("class", className);
			MDC.put("clientId", InetAddress.getLocalHost().getHostAddress());
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		logger.info("다운");
		
	}
	
	
}
