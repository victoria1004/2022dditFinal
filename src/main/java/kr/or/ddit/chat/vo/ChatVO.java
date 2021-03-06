package kr.or.ddit.chat.vo;

public class ChatVO {
	private String chatNo;
	private String chatrmNo;
	private String mbrId;
	private String chatDt;
	private String chatCn;
	private String mbrImgPath;
	private String mbrImg;
	private String mbrNm;
	
	public String getChatNo() {
		return chatNo;
	}
	public void setChatNo(String chatNo) {
		this.chatNo = chatNo;
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
	public String getChatDt() {
		return chatDt;
	}
	public void setChatDt(String chatDt) {
		this.chatDt = chatDt;
	}
	public String getChatCn() {
		return chatCn;
	}
	public void setChatCn(String chatCn) {
		this.chatCn = chatCn;
	}
	
	public String getMbrImgPath() {
		return mbrImgPath;
	}
	public void setMbrImgPath(String mbrImgPath) {
		this.mbrImgPath = mbrImgPath;
	}
	public String getMbrImg() {
		return mbrImg;
	}
	public void setMbrImg(String mbrImg) {
		this.mbrImg = mbrImg;
	}
	
	
	public String getMbrNm() {
		return mbrNm;
	}
	public void setMbrNm(String mbrNm) {
		this.mbrNm = mbrNm;
	}
	@Override
	public String toString() {
		return "ChatVO [chatNo=" + chatNo + ", chatrmNo=" + chatrmNo + ", mbrId=" + mbrId + ", chatDt=" + chatDt
				+ ", chatCn=" + chatCn + "]";
	}
	
	
	
}
