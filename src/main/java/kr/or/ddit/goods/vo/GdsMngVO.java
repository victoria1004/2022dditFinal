package kr.or.ddit.goods.vo;

public class GdsMngVO {
	
	private String gdsNo;
	private String gdsNm;
	private String gdsStock;
	private int rnum;
	private int rntCnt;
	
	
	public String getGdsNo() {
		return gdsNo;
	}
	public void setGdsNo(String gdsNo) {
		this.gdsNo = gdsNo;
	}
	public String getGdsNm() {
		return gdsNm;
	}
	public void setGdsNm(String gdsNm) {
		this.gdsNm = gdsNm;
	}
	public String getGdsStock() {
		return gdsStock;
	}
	public void setGdsStock(String gdsStock) {
		this.gdsStock = gdsStock;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getRntCnt() {
		return rntCnt;
	}
	public void setRntCnt(int rntCnt) {
		this.rntCnt = rntCnt;
	}
	@Override
	public String toString() {
		return "GdsMngVO [gdsNo=" + gdsNo + ", gdsNm=" + gdsNm + ", gdsStock=" + gdsStock + ", rnum=" + rnum
				+ ", rntCnt=" + rntCnt + "]";
	}
	
	
}
