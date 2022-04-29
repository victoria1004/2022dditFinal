package kr.or.ddit.cloud.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;


//프로젝트에서 사용하는 클라우드(파일 저장소)
@SuppressWarnings("serial")
public class StrgVO implements Serializable {

	private String strgFileNo;
	private String pjtNo; //프로젝트 번호
	private String fileNm; //실제파일명
	private String strgFileNm; //저장파일명
	private String strgFileSz; //저장파일 사이즈
	private String strgFileAddr; //저장파일의 경로
	private String strgDt; //파일업로드일
	private String fileUploader; //파일업로드한 사람
	
	public static void main(String[] args) {
		String strgFileAddr = "D:\\A_TeachingMaterial\\7.LastProject\\workspace\\doIT\\src\\main\\webapp\\resources\\cloud\\프젝테스트\\mine\\23\\ìë";
//		String strgFileAddr = "D:\\A_TeachingMaterial\\7.LastProject\\workspace\\doIT\\src\\main\\webapp\\resources\\cloud\\";
		System.out.println(strgFileAddr.substring(83));
	}
	
	public String getStrgFileAddrSub() {
		String result ="";
		if(strgFileAddr != null && strgFileAddr.length()>83) {
			result = strgFileAddr.substring(83);
		}
		return result;
		
	}

	
	
	
	public String getFileUploader() {
		return fileUploader;
	}

	public void setFileUploader(String fileUploader) {
		this.fileUploader = fileUploader;
	}

	public String getStrgFileNo() {
		return strgFileNo;
	}

	public void setStrgFileNo(String strgFileNo) {
		this.strgFileNo = strgFileNo;
	}

	public String getPjtNo() {
		return pjtNo;
	}

	public void setPjtNo(String pjtNo) {
		this.pjtNo = pjtNo;
	}

	public String getFileNm() {
		return fileNm;
	}

	public void setFileNm(String fileNm) {
		this.fileNm = fileNm;
	}

	public String getStrgFileNm() {
		return strgFileNm;
	}

	public void setStrgFileNm(String strgFileNm) {
		this.strgFileNm = strgFileNm;
	}

	public String getStrgFileSz() {
		return strgFileSz;
	}

	public void setStrgFileSz(String strgFileSz) {
		this.strgFileSz = strgFileSz;
	}

	public String getStrgFileAddr() {
		return strgFileAddr;
	}

	public void setStrgFileAddr(String strgFileAddr) {
		this.strgFileAddr = strgFileAddr;
	}

	public String getStrgDt() {
		return strgDt;
	}

	public void setStrgDt(String strgDt) {
		this.strgDt = strgDt;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

	
}
