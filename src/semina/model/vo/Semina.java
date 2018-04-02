package semina.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Semina  implements Serializable {
	
	private static final long serialVersionUID = 3000L;
	private int seminaNo;
	private int categoryNo;
	private int userNo;	
	private String seminaTitle;
	private String seminaLocation;
	private int seminaPrice;
	private int seminaLevel;
	private Date seminaStartDate;
	private String seminaContent1;
	private String seminaContent2;
	private String seminaContent3;
	private String seminaContent4;	
	private Date seminaEndDate;
	private int seminaMin;
	private int seminaNow;
	private int seminaMax;
	
	public Semina() {
		
	}

	public Semina(int seminaNo, int categoryNo, int userNo, String seminaTitle, String seminaLocation, int seminaPrice,
			int seminaLevel, Date seminaStartDate, String seminaContent1, String seminaContent2, String seminaContent3,
			String seminaContent4, Date seminaEndDate, int seminaMin, int seminaNow, int seminaMax) {
		super();
		this.seminaNo = seminaNo;
		this.categoryNo = categoryNo;
		this.userNo = userNo;
		this.seminaTitle = seminaTitle;
		this.seminaLocation = seminaLocation;
		this.seminaPrice = seminaPrice;
		this.seminaLevel = seminaLevel;
		this.seminaStartDate = seminaStartDate;
		this.seminaContent1 = seminaContent1;
		this.seminaContent2 = seminaContent2;
		this.seminaContent3 = seminaContent3;
		this.seminaContent4 = seminaContent4;
		this.seminaEndDate = seminaEndDate;
		this.seminaMin = seminaMin;
		this.seminaNow = seminaNow;
		this.seminaMax = seminaMax;
	}

	public int getSeminaNo() {
		return seminaNo;
	}

	public void setSeminaNo(int seminaNo) {
		this.seminaNo = seminaNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getSeminaTitle() {
		return seminaTitle;
	}

	public void setSeminaTitle(String seminaTitle) {
		this.seminaTitle = seminaTitle;
	}

	public String getSeminaLocation() {
		return seminaLocation;
	}

	public void setSeminaLocation(String seminaLocation) {
		this.seminaLocation = seminaLocation;
	}

	public int getSeminaPrice() {
		return seminaPrice;
	}

	public void setSeminaPrice(int seminaPrice) {
		this.seminaPrice = seminaPrice;
	}

	public int getSeminaLevel() {
		return seminaLevel;
	}

	public void setSeminaLevel(int seminaLevel) {
		this.seminaLevel = seminaLevel;
	}

	public Date getSeminaStartDate() {
		return seminaStartDate;
	}

	public void setSeminaStartDate(Date seminaStartDate) {
		this.seminaStartDate = seminaStartDate;
	}

	public String getSeminaContent1() {
		return seminaContent1;
	}

	public void setSeminaContent1(String seminaContent1) {
		this.seminaContent1 = seminaContent1;
	}

	public String getSeminaContent2() {
		return seminaContent2;
	}

	public void setSeminaContent2(String seminaContent2) {
		this.seminaContent2 = seminaContent2;
	}

	public String getSeminaContent3() {
		return seminaContent3;
	}

	public void setSeminaContent3(String seminaContent3) {
		this.seminaContent3 = seminaContent3;
	}

	public String getSeminaContent4() {
		return seminaContent4;
	}

	public void setSeminaContent4(String seminaContent4) {
		this.seminaContent4 = seminaContent4;
	}

	public Date getSeminaEndDate() {
		return seminaEndDate;
	}

	public void setSeminaEndDate(Date seminaEndDate) {
		this.seminaEndDate = seminaEndDate;
	}

	public int getSeminaMin() {
		return seminaMin;
	}

	public void setSeminaMin(int seminaMin) {
		this.seminaMin = seminaMin;
	}

	public int getSeminaNow() {
		return seminaNow;
	}

	public void setSeminaNow(int seminaNow) {
		this.seminaNow = seminaNow;
	}

	public int getSeminaMax() {
		return seminaMax;
	}

	public void setSeminaMax(int seminaMax) {
		this.seminaMax = seminaMax;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Semina [seminaNo=" + seminaNo + ", categoryNo=" + categoryNo + ", userNo=" + userNo + ", seminaTitle="
				+ seminaTitle + ", seminaLocation=" + seminaLocation + ", seminaPrice=" + seminaPrice + ", seminaLevel="
				+ seminaLevel + ", seminaStartDate=" + seminaStartDate + ", seminaContent1=" + seminaContent1
				+ ", seminaContent2=" + seminaContent2 + ", seminaContent3=" + seminaContent3 + ", seminaContent4="
				+ seminaContent4 + ", seminaEndDate=" + seminaEndDate + ", seminaMin=" + seminaMin + ", seminaNow="
				+ seminaNow + ", seminaMax=" + seminaMax + "]";
	}
}
