package kr.or.ddit.feed.vo;

public class LikesVO {
	private String pstNo;
	private String mbrId;
	
	public String getPstNo() {
		return pstNo;
	}
	public void setPstNo(String pstNo) {
		this.pstNo = pstNo;
	}
	public String getMbrId() {
		return mbrId;
	}
	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}
	
	@Override
	public String toString() {
		return "LikesVO [pstNo=" + pstNo + ", mbrId=" + mbrId + "]";
	}
	
	

}
