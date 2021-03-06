package kr.or.ddit.project.vo;

public class TrsmFileVO {

	private String fileNo;			//파일번호
	private String trsmFileAddr;	//전송파일경로
	private String trsmFileNm;		//전송파일이름
	private String trsmFileCtgrNm;	//전송분류명(T,M,P)
	private String emlNo;			//메일번호
	private String pstNo;			//피드번호
	private String rptNo;			//업무보고번호
	
	public String getFileNo() {
		return fileNo;
	}
	public void setFileNo(String fileNo) {
		this.fileNo = fileNo;
	}
	public String getTrsmFileAddr() {
		return trsmFileAddr;
	}
	public void setTrsmFileAddr(String trsmFileAddr) {
		this.trsmFileAddr = trsmFileAddr;
	}
	public String getTrsmFileNm() {
		return trsmFileNm;
	}
	public void setTrsmFileNm(String trsmFileNm) {
		this.trsmFileNm = trsmFileNm;
	}
	public String getTrsmFileCtgrNm() {
		return trsmFileCtgrNm;
	}
	public void setTrsmFileCtgrNm(String trsmFileCtgrNm) {
		this.trsmFileCtgrNm = trsmFileCtgrNm;
	}
	public String getEmlNo() {
		return emlNo;
	}
	public void setEmlNo(String emlNo) {
		this.emlNo = emlNo;
	}
	public String getPstNo() {
		return pstNo;
	}
	public void setPstNo(String pstNo) {
		this.pstNo = pstNo;
	}
	public String getRptNo() {
		return rptNo;
	}
	public void setRptNo(String rptNo) {
		this.rptNo = rptNo;
	}
	
	
	@Override
	public String toString() {
		return "TrsmFileVO [fileNo=" + fileNo + ", trsmFileAddr=" + trsmFileAddr + ", trsmFileNm=" + trsmFileNm
				+ ", trsmFileCtgrNm=" + trsmFileCtgrNm + ", emlNo=" + emlNo + ", pstNo=" + pstNo + ", rptNo=" + rptNo
				+ "]";
	}

	
	
	
	
	
}
