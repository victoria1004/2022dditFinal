package kr.or.ddit.user.vo;

public class EmailReceiverVO {

	private String mbrId;
	private String emlNo;
	
	
	public String getMbrId() {
		return mbrId;
	}
	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}
	public String getEmlNo() {
		return emlNo;
	}
	public void setEmlNo(String emlNo) {
		this.emlNo = emlNo;
	}
	
	
	@Override
	public String toString() {
		return "EmailRcvrVO [mbrId=" + mbrId + ", emlNo=" + emlNo + "]";
	}
	
	
	
	
	
}
