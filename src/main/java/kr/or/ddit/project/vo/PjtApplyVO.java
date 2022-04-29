package kr.or.ddit.project.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;


@SuppressWarnings("serial")
public class PjtApplyVO implements Serializable {
	
	private String pjtApplyNo;
	private String pjtNo;
	private String pjtApplyCn;
	private String pjtApplyWrtrId;
	private String pjtApplyDt;
	private String applyAprvYn;
	private String pjctRsn;
	
	public String getPjtApplyNo() {
		return pjtApplyNo;
	}
	public void setPjtApplyNo(String pjtApplyNo) {
		this.pjtApplyNo = pjtApplyNo;
	}
	public String getPjtNo() {
		return pjtNo;
	}
	public void setPjtNo(String pjtNo) {
		this.pjtNo = pjtNo;
	}
	public String getPjtApplyCn() {
		return pjtApplyCn;
	}
	public void setPjtApplyCn(String pjtApplyCn) {
		this.pjtApplyCn = pjtApplyCn;
	}
	public String getPjtApplyWrtrId() {
		return pjtApplyWrtrId;
	}
	public void setPjtApplyWrtrId(String pjtApplyWrtrId) {
		this.pjtApplyWrtrId = pjtApplyWrtrId;
	}
	public String getPjtApplyDt() {
		return pjtApplyDt;
	}
	public void setPjtApplyDt(String pjtApplyDt) {
		this.pjtApplyDt = pjtApplyDt;
	}
	public String getApplyAprvYn() {
		return applyAprvYn;
	}
	public void setApplyAprvYn(String applyAprvYn) {
		this.applyAprvYn = applyAprvYn;
	}
	public String getPjctRsn() {
		return pjctRsn;
	}
	public void setPjctRsn(String pjctRsn) {
		this.pjctRsn = pjctRsn;
	}
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}
	
	
	
	
	
	
}
