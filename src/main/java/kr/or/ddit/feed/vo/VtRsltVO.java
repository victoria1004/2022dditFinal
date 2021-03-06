package kr.or.ddit.feed.vo;

/**
 * 투표 결과 
 * @author PC-12
 */
public class VtRsltVO {
	private String vtNo; //투표번호
	private String optnNo; //선택지번호
	private String mbrId; //투표한 사람
	
	public String getVtNo() {
		return vtNo;
	}
	public void setVtNo(String vtNo) {
		this.vtNo = vtNo;
	}
	public String getOptnNo() {
		return optnNo;
	}
	public void setOptnNo(String optnNo) {
		this.optnNo = optnNo;
	}
	public String getMbrId() {
		return mbrId;
	}
	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}
	
	@Override
	public String toString() {
		return "VtRsltVO [vtNo=" + vtNo + ", optnNo=" + optnNo + ", mbrId=" + mbrId + "]";
	}
	
}
