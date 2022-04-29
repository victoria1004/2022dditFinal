package kr.or.ddit.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//개발자의 편의에 의해 공통적으로 사용되는 메소드의 모음
public class UserUtil {
	private static final Logger logger = 
			LoggerFactory.getLogger(UserUtil.class);
	
//	//sub제목과 제목을 파라미터로 받아 맵으로 리턴
//	//뷰 페이지의 제목 영역에 표시할 수 있음
//	public static Map<String,String> getPageHeader(String subtitle,String title){
//		Map<String,String> pageHeader = new HashMap<String, String>();
//		pageHeader.put("subtitle", subtitle);
//		pageHeader.put("title", title);
//		
//		return pageHeader;
//	}
	
	//첨부파일을 보관하는 폴더를 연/월/일 계층 형태로 생성하기 위함
	private static String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}
	
	//특정한 파일이 이미지 타입인지 검사해주는 메소드
	private static boolean checkImageType(File file) {
		try {
			//file.toPath() : 파일의 전체 경로
			logger.info("file.toPath() : " + file.toPath());
			String contentType = Files.probeContentType(file.toPath());
			logger.info("contentType : " + contentType);
			//contentType이 image로 시작하면 이미지 타입이므로 true를 리턴함
			return contentType.startsWith("image");
		}catch(IOException e) {
			e.printStackTrace();
		}
		return false;
	}
}
