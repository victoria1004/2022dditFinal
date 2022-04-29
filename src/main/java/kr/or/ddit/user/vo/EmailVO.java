package kr.or.ddit.user.vo;

public class EmailVO {

	private String emlNo;		//메일번호
	private String emlSndr;  	//발송자아이디
	private String emlTtl;		//제목
	private String emlCtnt;		//내용
	private String emlSndngDt;	//보낸날짜
	private String rcvrEmlAddr;	//수신인이메일주소
	private String sndrEmlAddr; //발신인이메일주소
	private String emlYn;       //이메일 확인 여부 EML_YN
	private String emlCtgr; 	//메일함 카테고리
	
	public String getEmlNo() {
		return emlNo;
	}
	public void setEmlNo(String emlNo) {
		this.emlNo = emlNo;
	}
	public String getEmlSndr() {
		return emlSndr;
	}
	public void setEmlSndr(String emlSndr) {
		this.emlSndr = emlSndr;
	}
	public String getEmlTtl() {
		return emlTtl;
	}
	public void setEmlTtl(String emlTtl) {
		this.emlTtl = emlTtl;
	}
	public String getEmlCtnt() {
		return emlCtnt;
	}
	public void setEmlCtnt(String emlCtnt) {
		this.emlCtnt = emlCtnt;
	}
	public String getEmlSndngDt() {
		return emlSndngDt;
	}
	public void setEmlSndngDt(String emlSndngDt) {
		this.emlSndngDt = emlSndngDt;
	}
	public String getRcvrEmlAddr() {
		return rcvrEmlAddr;
	}
	public void setRcvrEmlAddr(String rcvrEmlAddr) {
		this.rcvrEmlAddr = rcvrEmlAddr;
	}
	public String getSndrEmlAddr() {
		return sndrEmlAddr;
	}
	public void setSndrEmlAddr(String sndrEmalAddr) {
		this.sndrEmlAddr = sndrEmalAddr;
	}
	public String getEmlYn() {
		return emlYn;
	}
	public void setEmlYn(String emlYn) {
		this.emlYn = emlYn;
	}
	public String getEmlCtgr() {
		return emlCtgr;
	}
	public void setEmlCtgr(String emlCtgr) {
		this.emlCtgr = emlCtgr;
	}
	
	
	@Override
	public String toString() {
		return "EmailVO [emlNo=" + emlNo + ", emlSndr=" + emlSndr + ", emlTtl=" + emlTtl + ", emlCtnt=" + emlCtnt
				+ ", emlSndngDt=" + emlSndngDt + ", rcvrEmlAddr=" + rcvrEmlAddr + ", sndrEmlAddr=" + sndrEmlAddr
				+ ", emlYn=" + emlYn + ", emlCtgr=" + emlCtgr + "]";
	}
	
	
	
}
