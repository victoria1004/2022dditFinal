package kr.or.ddit.project.vo;

public class MarkerVO {

	private String mrkrNo;
	private String pjtNo;
	private String mrkrNm;
	private String mrkrIcn;
	private String mrkrClr;
	
	
	public String getMrkrNo() {
		return mrkrNo;
	}
	public void setMrkrNo(String mrkrNo) {
		this.mrkrNo = mrkrNo;
	}
	public String getPjtNo() {
		return pjtNo;
	}
	public void setPjtNo(String pjtNo) {
		this.pjtNo = pjtNo;
	}
	public String getMrkrNm() {
		return mrkrNm;
	}
	public void setMrkrNm(String mrkrNm) {
		this.mrkrNm = mrkrNm;
	}
	public String getMrkrIcn() {
		return mrkrIcn;
	}
	public void setMrkrIcn(String mrkrIcn) {
		this.mrkrIcn = mrkrIcn;
	}
	public String getMrkrClr() {
		return mrkrClr;
	}
	public void setMrkrClr(String mrkrClr) {
		this.mrkrClr = mrkrClr;
	}
	
	
	@Override
	public String toString() {
		return "MarkerVO [mrkrNo=" + mrkrNo + ", pjtNo=" + pjtNo + ", mrkrNm=" + mrkrNm + ", mrkrIcn=" + mrkrIcn
				+ ", mrkrClr=" + mrkrClr + "]";
	}
	
	
}
