package kr.or.ddit.user.vo;

import java.util.Arrays;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private String mbrId; //아이디
	private String mbrCtgrCd; //회원 분류
	private String mbrPw; //비밀번호
	private String mbrNm; //회원명
	private String mbrGender; //성별
	private String mbrTelno; //전화번호
	private String mbrDept; //소속명
	private String mbrEml; //메일주소
	private MultipartFile[] mbrProfile; //프로필 이미지
	private String mbrImg; //이미지파일명
	private String mbrImgPath; //이미지파일 경로
	private String mbrIntro; //자기소개
	private int mbrStts; //접속 중인 멤버의 상태
	
	// 사용자 권한
	private List<MbrAuthVO> authList;
	


	public int getMbrStts() {
		return mbrStts;
	}


	public void setMbrStts(int mbrStts) {
		this.mbrStts = mbrStts;
	}


	public String getMbrId() {
		return mbrId;
	}


	public void setMbrId(String mbrId) {
		this.mbrId = mbrId;
	}


	public String getMbrCtgrCd() {
		return mbrCtgrCd;
	}


	public void setMbrCtgrCd(String mbrCtgrCd) {
		this.mbrCtgrCd = mbrCtgrCd;
	}


	public String getMbrPw() {
		return mbrPw;
	}


	public void setMbrPw(String mbrPw) {
		this.mbrPw = mbrPw;
	}


	public String getMbrNm() {
		return mbrNm;
	}


	public void setMbrNm(String mbrNm) {
		this.mbrNm = mbrNm;
	}


	public String getMbrGender() {
		return mbrGender;
	}


	public void setMbrGender(String mbrGender) {
		this.mbrGender = mbrGender;
	}


	public String getMbrTelno() {
		return mbrTelno;
	}


	public void setMbrTelno(String mbrTelno) {
		this.mbrTelno = mbrTelno;
	}


	public String getMbrDept() {
		return mbrDept;
	}


	public void setMbrDept(String mbrDept) {
		this.mbrDept = mbrDept;
	}


	public String getMbrEml() {
		return mbrEml;
	}


	public void setMbrEml(String mbrEml) {
		this.mbrEml = mbrEml;
	}


	public MultipartFile[] getMbrProfile() {
		return mbrProfile;
	}


	public void setMbrProfile(MultipartFile[] mbrProfile) {
		this.mbrProfile = mbrProfile;
	}


	public String getMbrImg() {
		return mbrImg;
	}


	public void setMbrImg(String mbrImg) {
		this.mbrImg = mbrImg;
	}


	public String getMbrImgPath() {
		return mbrImgPath;
	}


	public void setMbrImgPath(String mbrImgPath) {
		this.mbrImgPath = mbrImgPath;
	}


	public String getMbrIntro() {
		return mbrIntro;
	}


	public void setMbrIntro(String mbrIntro) {
		this.mbrIntro = mbrIntro;
	}

	

	public List<MbrAuthVO> getAuthList() {
		return authList;
	}


	public void setAuthList(List<MbrAuthVO> authList) {
		this.authList = authList;
	}


	@Override
	public String toString() {
		return "MemberVO [mbrId=" + mbrId + ", mbrCtgrCd=" + mbrCtgrCd + ", mbrPw=" + mbrPw + ", mbrNm=" + mbrNm
				+ ", mbrGender=" + mbrGender + ", mbrTelno=" + mbrTelno + ", mbrDept=" + mbrDept + ", mbrEml=" + mbrEml
				+ ", mbrProfile=" + Arrays.toString(mbrProfile) + ", mbrImg=" + mbrImg + ", mbrImgPath=" + mbrImgPath
				+ ", mbrIntro=" + mbrIntro + ", mbrStts=" + mbrStts + "]";
	}

	
	
	
}
