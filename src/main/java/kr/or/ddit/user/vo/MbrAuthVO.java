package kr.or.ddit.user.vo;

public class MbrAuthVO {
	private String mbrId;
	private String auth;
	public String getMbrId() {
		return mbrId;
	}
	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	@Override
	public String toString() {
		return "MbrAuthVO [mbrId=" + mbrId + ", auth=" + auth + "]";
	}
	
	
	
}
