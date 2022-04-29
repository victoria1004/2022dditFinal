package kr.or.ddit.chat.vo;

//화상회의 VO
public class VdoMtgVO {
	private String vdoMtgNo;
	private String chatrmNo;
	private String mbrId;
	private String vdoMtgCn;
	public String getVdoMtgNo() {
		return vdoMtgNo;
	}
	public void setVdoMtgNo(String vdoMtgNo) {
		this.vdoMtgNo = vdoMtgNo;
	}
	public String getChatrmNo() {
		return chatrmNo;
	}
	public void setChatrmNo(String chatrmNo) {
		this.chatrmNo = chatrmNo;
	}
	public String getMbrId() {
		return mbrId;
	}
	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}
	public String getVdoMtgCn() {
		return vdoMtgCn;
	}
	public void setVdoMtgCn(String vdoMtgCn) {
		this.vdoMtgCn = vdoMtgCn;
	}
	@Override
	public String toString() {
		return "VdoMtgVO [vdoMtgNo=" + vdoMtgNo + ", chatrmNo=" + chatrmNo + ", mbrId=" + mbrId + ", vdoMtgCn="
				+ vdoMtgCn + "]";
	}
	
	
}
