package kr.or.ddit.project.vo;

public class KanbanVO {

	
	private String kbNo;
	private String pjtNo;
	private String kbNm;
	private String kbPrivNo;
	
	public String getKbNo() {
		return kbNo;
	}
	public void setKbNo(String kbNo) {
		this.kbNo = kbNo;
	}
	public String getPjtNo() {
		return pjtNo;
	}
	public void setPjtNo(String pjtNo) {
		this.pjtNo = pjtNo;
	}
	public String getKbNm() {
		return kbNm;
	}
	public void setKbNm(String kbNm) {
		this.kbNm = kbNm;
	}
	public String getKbPrivNo() {
		return kbPrivNo;
	}
	public void setKbPrivNo(String kbPrivNo) {
		this.kbPrivNo = kbPrivNo;
	}
	
	
	
	@Override
	public String toString() {
		return "KanbanVO [kbNo=" + kbNo + ", pjtNo=" + pjtNo + ", kbNm=" + kbNm + ", kbPrivNo=" + kbPrivNo + "]";
	}
	
	
	
	
	
}
