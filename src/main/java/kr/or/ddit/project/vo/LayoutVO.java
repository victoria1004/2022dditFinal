package kr.or.ddit.project.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class LayoutVO {
	private String pjtNo;
	private String lytNo;
	
	public String getPjtNo() {
		return pjtNo;
	}
	public void setPjtNo(String pjtNo) {
		this.pjtNo = pjtNo;
	}
	public String getLytNo() {
		return lytNo;
	}
	public void setLytNo(String lytNo) {
		this.lytNo = lytNo;
	}
	@Override
	   public String toString() {
	      return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	   }
	
}