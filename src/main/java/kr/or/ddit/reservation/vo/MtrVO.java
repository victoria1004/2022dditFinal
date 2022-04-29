package kr.or.ddit.reservation.vo;

public class MtrVO {
	private int mtrNo; //회의실 번호
	private String mtrNm; //회의실 이름
	private int mtrGdsNo;  //회의실 비품 번호
	private String mtrGdsNm;  // 회의실 비품 이름
	
	public int getMtrNo() {
		return mtrNo;
	}
	public void setMtrNo(int mtrNo) {
		this.mtrNo = mtrNo;
	}
	public String getMtrNm() {
		return mtrNm;
	}
	public void setMtrNm(String mtrNm) {
		this.mtrNm = mtrNm;
	}
	public int getMtrGdsNo() {
		return mtrGdsNo;
	}
	public void setMtrGdsNo(int mtrGdsNo) {
		this.mtrGdsNo = mtrGdsNo;
	}
	public String getMtrGdsNm() {
		return mtrGdsNm;
	}
	public void setMtrGdsNm(String mtrGdsNm) {
		this.mtrGdsNm = mtrGdsNm;
	}
	
	@Override
	public String toString() {
		return "MtrVO [mtrNo=" + mtrNo + ", mtrNm=" + mtrNm + ", mtrGdsNo=" + mtrGdsNo + ", mtrGdsNm=" + mtrGdsNm + "]";
	}
	
	
	
	
}
