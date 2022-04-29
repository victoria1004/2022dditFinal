package kr.or.ddit.project.vo;


public class IssueVO {

	private String issueNo;
	private String mrkrNo;
	private String pjtNo;
	private String tdNo;
	private String mbrId;
	private String issueTtl;
	private String issueCn;
	private String issueYmd;
	
	
	public String getIssueNo() {
		return issueNo;
	}
	public void setIssueNo(String issueNo) {
		this.issueNo = issueNo;
	}
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
	public String getTdNo() {
		return tdNo;
	}
	public void setTdNo(String tdNo) {
		this.tdNo = tdNo;
	}
	public String getMbrId() {
		return mbrId;
	}
	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}
	public String getIssueTtl() {
		return issueTtl;
	}
	public void setIssueTtl(String issueTtl) {
		this.issueTtl = issueTtl;
	}
	public String getIssueCn() {
		return issueCn;
	}
	public void setIssueCn(String issueCn) {
		this.issueCn = issueCn;
	}
	public String getIssueYmd() {
		return issueYmd;
	}
	
	public void setIssueYmd(String issueYmd) {
		this.issueYmd = issueYmd;
	}
	
	
	@Override
	public String toString() {
		return "IssueVO [issueNo=" + issueNo + ", mrkrNo=" + mrkrNo + ", pjtNo=" + pjtNo + ", tdNo=" + tdNo + ", mbrId="
				+ mbrId + ", issueTtl=" + issueTtl + ", issueCn=" + issueCn + ", issueYmd="
				+ issueYmd + "]";
	}
	
	
	
}
