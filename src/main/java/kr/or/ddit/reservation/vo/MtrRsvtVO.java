package kr.or.ddit.reservation.vo;

public class MtrRsvtVO {
	private int rsvtNo; //예약번호
	private int mtrNo;  //회의실번호
	private String mtrNm; //회의실명(호수)
	private String mbrId; //예약자 아이디
	private String mbrNm; //예약자 이름
	private String rsvtStrtHr; //예약시작시간
	private String rsvtYmd; //예약일
	
	
	public int getRsvtNo() {
		return rsvtNo;
	}
	public void setRsvtNo(int rsvtNo) {
		this.rsvtNo = rsvtNo;
	}
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
	public String getMbrId() {
		return mbrId;
	}
	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}
	public String getMbrNm() {
		return mbrNm;
	}
	public void setMbrNm(String mbrNm) {
		this.mbrNm = mbrNm;
	}
	public String getRsvtStrtHr() {
		return rsvtStrtHr;
	}
	public void setRsvtStrtHr(String rsvtStrtHr) {
		this.rsvtStrtHr = rsvtStrtHr;
	}
	public String getRsvtYmd() {
		return rsvtYmd;
	}
	public void setRsvtYmd(String rsvtYmd) {
		this.rsvtYmd = rsvtYmd;
	}
	
	@Override
	public String toString() {
		return "MtrRsvtVO [rsvtNo=" + rsvtNo + ", mtrNo=" + mtrNo + ", mtrNm=" + mtrNm + ", mbrId=" + mbrId + ", mbrNm="
				+ mbrNm + ", rsvtStrtHr=" + rsvtStrtHr + ", rsvtYmd=" + rsvtYmd + "]";
	}
	
	
}
