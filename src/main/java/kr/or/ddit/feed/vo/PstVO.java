package kr.or.ddit.feed.vo;

import java.util.List;

/**
 * 피드 
 * @author PC-12
 */
public class PstVO {
	private String pstNo;
	private String pjtNo;
	private String mbrId;
	private String pstCn;
	private String pstWrtDt;
	private String ntcYn;
	private int count; //좋아요 개수 확인
	private boolean yn; //좋아요를 누른 피드번호 확인
	private boolean cmntYn; //댓글이 있는 피드번호 확인
	private boolean frmtYn; //투표가 있는 피드번호 확인
	private boolean imageYn; //이미지가 있는 피드번호 확인
	
	//피드와 댓글은 1:N 관계
	private List<PstCmntVO> pstCmntVO;
	
	public String getPstNo() {
		return pstNo;
	}
	public void setPstNo(String pstNo) {
		this.pstNo = pstNo;
	}
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
	public String getPstCn() {
		return pstCn;
	}
	public void setPstCn(String pstCn) {
		this.pstCn = pstCn;
	}
	public String getPstWrtDt() {
		return pstWrtDt;
	}
	public void setPstWrtDt(String pstWrtDt) {
		this.pstWrtDt = pstWrtDt;
	}
	public String getNtcYn() {
		return ntcYn;
	}
	public void setNtcYn(String ntcYn) {
		this.ntcYn = ntcYn;
	}
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	public boolean isYn() {
		return yn;
	}

	public void setYn(boolean yn) {
		this.yn = yn;
	}
	public List<PstCmntVO> getPstCmntVO() {
		return pstCmntVO;
	}
	public void setPstCmntVO(List<PstCmntVO> pstCmntVO) {
		this.pstCmntVO = pstCmntVO;
	}
	public boolean isCmntYn() {
		return cmntYn;
	}
	public void setCmntYn(boolean cmntYn) {
		this.cmntYn = cmntYn;
	}
	public boolean isFrmtYn() {
		return frmtYn;
	}
	public void setFrmtYn(boolean frmtYn) {
		this.frmtYn = frmtYn;
	}
	public boolean isImageYn() {
		return imageYn;
	}
	public void setImageYn(boolean imageYn) {
		this.imageYn = imageYn;
	}
	@Override
	public String toString() {
		return "PstVO [pstNo=" + pstNo + ", pjtNo=" + pjtNo + ", mbrId=" + mbrId + ", pstCn=" + pstCn + ", pstWrtDt="
				+ pstWrtDt + ", ntcYn=" + ntcYn + ", count=" + count + ", yn=" + yn + ", cmntYn=" + cmntYn + ", frmtYn="
				+ frmtYn + ", imageYn=" + imageYn + ", pstCmntVO=" + pstCmntVO + "]";
	}
	
}
