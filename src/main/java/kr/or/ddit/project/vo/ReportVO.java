package kr.or.ddit.project.vo;

import java.util.List;

public class ReportVO {
	
	String pjtNo; //프로젝트번호
	String rptNo; //게시글번호
	String rptTtl; //게시글제목
	String rptCn; //게시글 내용
	String rptDt; //게시글 날짜
//	String rptFileNm; //첨부파일명
//	String rptFilePath; //첨부파일 경로
	String rptWrtrId; // 작성자 아이디
	String rptCtgrNm; //일간 주간 구분
	String rptStts; // PL의 업무보고 승인, 반려 여부
	String rptRjctCn; //PL의 반려사유
	
	private int rnum;
	
	//업무보고와 파일은 1:N관계
	private List<TrsmFileVO> trsmFileVO; 

	public String getPjtNo() {
		return pjtNo;
	}
	public void setPjtNo(String pjtNo) {
		this.pjtNo = pjtNo;
	}
	public String getRptNo() {
		return rptNo;
	}
	public void setRptNo(String rptNo) {
		this.rptNo = rptNo;
	}
	public String getRptTtl() {
		return rptTtl;
	}
	public void setRptTtl(String rptTtl) {
		this.rptTtl = rptTtl;
	}
	public String getRptCn() {
		return rptCn;
	}
	public void setRptCn(String rptCn) {
		this.rptCn = rptCn;
	}
	public String getRptDt() {
		return rptDt;
	}
	public void setRptDt(String rptDt) {
		this.rptDt = rptDt;
	}
//	public String getRptFileNm() {
//		return rptFileNm;
//	}
//	public void setRptFileNm(String rptFileNm) {
//		this.rptFileNm = rptFileNm;
//	}
//	public String getRptFilePath() {
//		return rptFilePath;
//	}
//	public void setRptFilePath(String rptFilePath) {
//		this.rptFilePath = rptFilePath;
//	}
	public String getRptWrtrId() {
		return rptWrtrId;
	}
	public void setRptWrtrId(String rptWrtrId) {
		this.rptWrtrId = rptWrtrId;
	}
	public String getRptCtgrNm() {
		return rptCtgrNm;
	}
	public void setRptCtgrNm(String rptCtgrNm) {
		this.rptCtgrNm = rptCtgrNm;
	}
	public String getRptStts() {
		return rptStts;
	}
	public void setRptStts(String rptStts) {
		this.rptStts = rptStts;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	public List<TrsmFileVO> getTrsmFileVO() {
		return trsmFileVO;
	}
	public void setTrsmFileVO(List<TrsmFileVO> trsmFileVO) {
		this.trsmFileVO = trsmFileVO;
	}
	public String getRptRjctCn() {
		return rptRjctCn;
	}
	public void setRptRjctCn(String rptRjctCn) {
		this.rptRjctCn = rptRjctCn;
	}
	
	@Override
	public String toString() {
		return "ReportVO [pjtNo=" + pjtNo + ", rptNo=" + rptNo + ", rptTtl=" + rptTtl + ", rptCn=" + rptCn + ", rptDt="
				+ rptDt + ", rptWrtrId=" + rptWrtrId + ", rptCtgrNm=" + rptCtgrNm + ", rptStts=" + rptStts
				+ ", rptRjctCn=" + rptRjctCn + ", rnum=" + rnum + ", trsmFileVO=" + trsmFileVO + "]";
	}
//	@Override
//	public String toString() {
//		return "ReportVO [pjtNo=" + pjtNo + ", rptNo=" + rptNo + ", rptTtl=" + rptTtl + ", rptCn=" + rptCn + ", rptDt="
//				+ rptDt + ", rptFileNm=" + rptFileNm + ", rptFilePath=" + rptFilePath + ", rptWrtrId=" + rptWrtrId
//				+ ", rptCtgrNm=" + rptCtgrNm + ", rptStts=" + rptStts + ", rnum=" + rnum + "]";
//	}
	
	
	
}
