package kr.or.ddit.user.vo;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import kr.or.ddit.util.CmDvsnCtgrVO;

public class AlarmVO {

	private String alrmNo;
	private String mbrId;
	private String alrmCtgrNo;
	private String alrmIdntyYn;
	private String alrmSndId;
	private String alrmSndInfo;
	private String alrmLocation;
	
	
	
	public String getAlrmLocation() {
		return alrmLocation;
	}
	public void setAlrmLocation(String alrmLocation) {
		this.alrmLocation = alrmLocation;
	}


	//알람 중분류테이블과 조인용
	private List<CmDvsnCtgrVO> ctgrList;
	
	
	public String getAlrmSndInfo() {
		return alrmSndInfo;
	}
	public void setAlrmSndInfo(String alrmSndInfo) {
		this.alrmSndInfo = alrmSndInfo;
	}
	public List<CmDvsnCtgrVO> getCtgrList() {
		return ctgrList;
	}
	public void setCtgrList(List<CmDvsnCtgrVO> ctgrList) {
		this.ctgrList = ctgrList;
	}
	public String getAlrmSndId() {
		return alrmSndId;
	}
	public void setAlrmSndId(String alrmSndId) {
		this.alrmSndId = alrmSndId;
	}
	public String getAlrmNo() {
		return alrmNo;
	}
	public void setAlrmNo(String alrmNo) {
		this.alrmNo = alrmNo;
	}
	public String getMbrId() {
		return mbrId;
	}
	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}
	public String getAlrmCtgrNo() {
		return alrmCtgrNo;
	}
	public void setAlrmCtgrNo(String alrmCtgrNo) {
		this.alrmCtgrNo = alrmCtgrNo;
	}
	public String getAlrmIdntyYn() {
		return alrmIdntyYn;
	}
	public void setAlrmIdntyYn(String alrmIdntyYn) {
		this.alrmIdntyYn = alrmIdntyYn;
	}
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
	
	
}
