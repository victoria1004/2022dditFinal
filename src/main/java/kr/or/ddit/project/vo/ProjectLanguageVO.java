package kr.or.ddit.project.vo;

public class ProjectLanguageVO {
	private String dvlLng;
	private String pjtNo;
	
	public String getDvlLng() {
		return dvlLng;
	}
	public void setDvlLng(String dvlLng) {
		this.dvlLng = dvlLng;
	}
	public String getPjtNo() {
		return pjtNo;
	}
	public void setPjtNo(String pjtNo) {
		this.pjtNo = pjtNo;
	}
	@Override
	public String toString() {
		return "ProjectLanguageVO [dvlLng=" + dvlLng + ", pjtNo=" + pjtNo + "]";
	}
	
	
}
