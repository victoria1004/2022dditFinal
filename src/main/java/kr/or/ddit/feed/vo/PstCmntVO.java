package kr.or.ddit.feed.vo;

public class PstCmntVO {
	private String pstNo;
	private String cmntNo;
	private String mbrId;
	private String cmntCn;
	private String cmntDt;
	
	public String getCmntDt() {
		return cmntDt;
	}
	public void setCmntDt(String cmntDt) {
		this.cmntDt = cmntDt;
	}
	public String getPstNo() {
		return pstNo;
	}
	public void setPstNo(String pstNo) {
		this.pstNo = pstNo;
	}
	public String getCmntNo() {
		return cmntNo;
	}
	public void setCmntNo(String cmntNo) {
		this.cmntNo = cmntNo;
	}
	public String getMbrId() {
		return mbrId;
	}
	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}
	public String getCmntCn() {
		return cmntCn;
	}
	public void setCmntCn(String cmntCn) {
		this.cmntCn = cmntCn;
	}
	@Override
	public String toString() {
		return "PstCmntVO [pstNo=" + pstNo + ", cmntNo=" + cmntNo + ", mbrId=" + mbrId + ", cmntCn=" + cmntCn
				+ ", cmntDt=" + cmntDt + "]";
	}
	

}
