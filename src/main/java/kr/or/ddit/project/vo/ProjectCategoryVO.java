package kr.or.ddit.project.vo;

public class ProjectCategoryVO {
	private String pjtCtgrNo;
	private String pjtCtgrNm;
	public String getPjtCtgrNo() {
		return pjtCtgrNo;
	}
	public void setPjtCtgrNo(String pjtCtgrNo) {
		this.pjtCtgrNo = pjtCtgrNo;
	}
	public String getPjtCtgrNm() {
		return pjtCtgrNm;
	}
	public void setPjtCtgrNm(String pjtCtgrNm) {
		this.pjtCtgrNm = pjtCtgrNm;
	}
	@Override
	public String toString() {
		return "ProjectCategoryVO [pjtCtgrNo=" + pjtCtgrNo + ", pjtCtgrNm=" + pjtCtgrNm + "]";
	}
	
	
	
}
