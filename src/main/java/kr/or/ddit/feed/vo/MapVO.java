package kr.or.ddit.feed.vo;

public class MapVO {
	private String mapNo;
	private String pstNo;
	private String mapLat;
	private String mapLot;
	private String mapAddr;
	private String mapPlc;
	
	public String getMapNo() {
		return mapNo;
	}
	public void setMapNo(String mapNo) {
		this.mapNo = mapNo;
	}
	public String getPstNo() {
		return pstNo;
	}
	public void setPstNo(String pstNo) {
		this.pstNo = pstNo;
	}
	public String getMapLat() {
		return mapLat;
	}
	public void setMapLat(String mapLat) {
		this.mapLat = mapLat;
	}
	public String getMapLot() {
		return mapLot;
	}
	public void setMapLot(String mapLot) {
		this.mapLot = mapLot;
	}
	public String getMapAddr() {
		return mapAddr;
	}
	public void setMapAddr(String mapAddr) {
		this.mapAddr = mapAddr;
	}
	public String getMapPlc() {
		return mapPlc;
	}
	public void setMapPlc(String mapPlc) {
		this.mapPlc = mapPlc;
	}
	
	@Override
	public String toString() {
		return "MapVO [mapNo=" + mapNo + ", pstNo=" + pstNo + ", mapLat=" + mapLat + ", mapLot=" + mapLot + ", mapAddr="
				+ mapAddr + ", mapPlc=" + mapPlc + "]";
	}
	
	

}
