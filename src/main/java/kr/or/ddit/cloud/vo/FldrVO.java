package kr.or.ddit.cloud.vo;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;


@SuppressWarnings("serial")
public class FldrVO implements Serializable {

	private String pjtNo; //프로젝트 번호
	private String leafFolder; //하위 폴더
	private String parentFolder; //상위 폴더
	
	public String getPjtNo() {
		return pjtNo;
	}
	public void setPjtNo(String pjtNo) {
		this.pjtNo = pjtNo;
	}
	public String getLeafFolder() {
		return leafFolder;
	}
	public void setLeafFolder(String leafFolder) {
		this.leafFolder = leafFolder;
	}
	public String getParentFolder() {
		return parentFolder;
	}
	public void setParentFolder(String parentFolder) {
		this.parentFolder = parentFolder;
	}
	
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.JSON_STYLE);
	}

	
	
}
