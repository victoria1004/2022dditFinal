package kr.or.ddit.feed.vo;

import java.util.List;

/**
 * 투표 형식 
 * @author PC-12
 */
public class VtFrmtVO {
	private String vtNo; //투표번호
	private String pstNo; //피드번호
	private String vtDt; //마감일
	private String annYn; //익명여부
	private boolean voteYn; //투표형식 확인
	
	//투표형식과 투표는 1:N관계
	private List<VoteVO> voteVO;
	
	public String getVtNo() {
		return vtNo;
	}
	public void setVtNo(String vtNo) {
		this.vtNo = vtNo;
	}
	public String getPstNo() {
		return pstNo;
	}
	public void setPstNo(String pstNo) {
		this.pstNo = pstNo;
	}
	public String getVtDt() {
		return vtDt;
	}
	public void setVtDt(String vtDt) {
		this.vtDt = vtDt;
	}
	public String getAnnYn() {
		return annYn;
	}
	public void setAnnYn(String annYn) {
		this.annYn = annYn;
	}
	public List<VoteVO> getVoteVO() {
		return voteVO;
	}
	public void setVoteVO(List<VoteVO> voteVO) {
		this.voteVO = voteVO;
	}
	public boolean isVoteYn() {
		return voteYn;
	}
	public void setVoteYn(boolean voteYn) {
		this.voteYn = voteYn;
	}
	
	@Override
	public String toString() {
		return "VtFrmtVO [vtNo=" + vtNo + ", pstNo=" + pstNo + ", vtDt=" + vtDt + ", annYn=" + annYn + ", voteYn="
				+ voteYn + ", voteVO=" + voteVO + "]";
	}
	

}
