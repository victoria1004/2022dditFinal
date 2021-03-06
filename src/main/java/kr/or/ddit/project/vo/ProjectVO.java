package kr.or.ddit.project.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ProjectVO {
	private String pjtNo;
	private String pjtCtgrNo;
	private String pjtNm;
	private String pjtOl;
	private String pjtExpl;
	private String pjtStrtYmd;
	private String pjtEndYmd;
	private String pjtRcrtStts;
	private String pjtWrtrNm;
	
	
	public String getPjtWrtrNm() {
		return pjtWrtrNm;
	}
	public void setPjtWrtrNm(String pjtWrtrNm) {
		this.pjtWrtrNm = pjtWrtrNm;
	}
	public String getPjtNo() {
		return pjtNo;
	}
	public void setPjtNo(String pjtNo) {
		this.pjtNo = pjtNo;
	}
	public String getPjtCtgrNo() {
		return pjtCtgrNo;
	}
	public void setPjtCtgrNo(String pjtCtgrNo) {
		this.pjtCtgrNo = pjtCtgrNo;
	}
	public String getPjtNm() {
		return pjtNm;
	}
	public void setPjtNm(String pjtNm) {
		this.pjtNm = pjtNm;
	}
	public String getPjtOl() {
		return pjtOl;
	}
	public void setPjtOl(String pjtOl) {
		this.pjtOl = pjtOl;
	}
	public String getPjtExpl() {
		return pjtExpl;
	}
	public void setPjtExpl(String pjtExpl) {
		this.pjtExpl = pjtExpl;
	}
	public String getPjtStrtYmd() {
		return pjtStrtYmd;
	}
	public void setPjtStrtYmd(String pjtStrtYmd) {
		this.pjtStrtYmd = pjtStrtYmd;
	}
	public String getPjtEndYmd() {
		return pjtEndYmd;
	}
	public void setPjtEndYmd(String pjtEndYmd) {
		this.pjtEndYmd = pjtEndYmd;
	}
	public String getPjtRcrtStts() {
		return pjtRcrtStts;
	}
	public void setPjtRcrtStts(String pjtRcrtStts) {
		this.pjtRcrtStts = pjtRcrtStts;
	}
	@Override
	   public String toString() {
	      return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	   }
	
	
}
