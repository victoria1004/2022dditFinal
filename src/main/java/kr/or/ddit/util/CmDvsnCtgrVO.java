package kr.or.ddit.util;


import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 중분류 테이블
 * @author shinae
 *
 */
public class CmDvsnCtgrVO {
	
	private String cmDvsnCtgrCd; 
	private String cmMjrCtgrCd;
	private String cmDvsnCtgrNm;
	
	public String getCmDvsnCtgrCd() {
		return cmDvsnCtgrCd;
	}
	public void setCmDvsnCtgrCd(String cmDvsnCtgrCd) {
		this.cmDvsnCtgrCd = cmDvsnCtgrCd;
	}
	public String getCmMjrCtgrCd() {
		return cmMjrCtgrCd;
	}
	public void setCmMjrCtgrCd(String cmMjrCtgrCd) {
		this.cmMjrCtgrCd = cmMjrCtgrCd;
	}
	public String getCmDvsnCtgrNm() {
		return cmDvsnCtgrNm;
	}
	public void setCmDvsnCtgrNm(String cmDvsnCtgrNm) {
		this.cmDvsnCtgrNm = cmDvsnCtgrNm;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
	
	
}
