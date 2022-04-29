package kr.or.ddit.project.vo;

public class DevelopmentEnvmVO {
	private String dvlLng;
	private String dvlLg;
	private String dvlLgAddr;
	public String getDvlLng() {
		return dvlLng;
	}
	public void setDvlLng(String dvlLng) {
		this.dvlLng = dvlLng;
	}
	public String getDvlLg() {
		return dvlLg;
	}
	public void setDvlLg(String dvlLg) {
		this.dvlLg = dvlLg;
	}
	public String getDvlLgAddr() {
		return dvlLgAddr;
	}
	public void setDvlLgAddr(String dvlLgAddr) {
		this.dvlLgAddr = dvlLgAddr;
	}
	@Override
	public String toString() {
		return "DevelopmentEnvmVO [dvlLng=" + dvlLng + ", dvlLg=" + dvlLg + ", dvlLgAddr=" + dvlLgAddr + "]";
	}
	
	
}
