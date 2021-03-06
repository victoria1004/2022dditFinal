package kr.or.ddit.project.vo;

public class ProjectApplyVO {
	private String pjtNo;
	private String mbrId;
	private String aplyAprvYn;
	private String pjtPrtpntRl;
	private String rjctRsn;
	public String getPjtNo() {
		return pjtNo;
	}
	public void setPjtNo(String pjtNo) {
		this.pjtNo = pjtNo;
	}
	public String getMbrId() {
		return mbrId;
	}
	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}
	public String getAplyAprvYn() {
		return aplyAprvYn;
	}
	public void setAplyAprvYn(String aplyAprvYn) {
		this.aplyAprvYn = aplyAprvYn;
	}
	public String getPjtPrtpntRl() {
		return pjtPrtpntRl;
	}
	public void setPjtPrtpntRl(String pjtPrtpntRl) {
		this.pjtPrtpntRl = pjtPrtpntRl;
	}
	public String getRjctRsn() {
		return rjctRsn;
	}
	public void setRjctRsn(String rjctRsn) {
		this.rjctRsn = rjctRsn;
	}
	@Override
	public String toString() {
		return "ProjectParticipantVO [pjtNo=" + pjtNo + ", mbrId=" + mbrId + ", aplyAprvYn=" + aplyAprvYn
				+ ", pjtPrtpntRl=" + pjtPrtpntRl + ", rjctRsn=" + rjctRsn + "]";
	}
	
	
	
}
