package semina.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Semina  implements Serializable {
	
	private static final long serialVersionUID = 3000L;
	private int seminaNo;
	private int categoryNo;
	private int userNo;
	private int userTypeNo;
	private String seminaTitle;
	private String seminaLocation;
	private int seminaPrice;
	private int seminaLevel;
	private Date seminaStartDate;
	private String seminaContop;
	private String seminaConbot;
	private Date seminaEndDate;
	private int seminaMin;
	private int seminaNow;
	private int seminaMax;
	
	public Semina() {
		// TODO Auto-generated constructor stub
	}

	public Semina(int seminaNo, int categoryNo, int userNo, int userTypeNo, String seminaTitle, String seminaLocation,
			int seminaPrice, int seminaLevel, Date seminaStartDate, String seminaContop, String seminaConbot,
			Date seminaEndDate, int seminaMin, int seminaNow, int seminaMax) {
		super();
		this.seminaNo = seminaNo;
		this.categoryNo = categoryNo;
		this.userNo = userNo;
		this.userTypeNo = userTypeNo;
		this.seminaTitle = seminaTitle;
		this.seminaLocation = seminaLocation;
		this.seminaPrice = seminaPrice;
		this.seminaLevel = seminaLevel;
		this.seminaStartDate = seminaStartDate;
		this.seminaContop = seminaContop;
		this.seminaConbot = seminaConbot;
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

	public int getUserTypeNo() {
		return userTypeNo;
	}

	public void setUserTypeNo(int userTypeNo) {
		this.userTypeNo = userTypeNo;
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

	public String getSeminaContop() {
		return seminaContop;
	}

	public void setSeminaContop(String seminaContop) {
		this.seminaContop = seminaContop;
	}

	public String getSeminaConbot() {
		return seminaConbot;
	}

	public void setSeminaConbot(String seminaConbot) {
		this.seminaConbot = seminaConbot;
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
		
		return 
		this.seminaNo + ", " + 
		this.categoryNo + ", " + 
		this.userNo + ", " + 
		this.userTypeNo + ", " + 
		this.seminaTitle + ", " + 
		this.seminaLocation + ", " + 
		this.seminaPrice + ", " + 
		this.seminaLevel + ", " + 
		this.seminaStartDate + ", " + 
		this.seminaContop + ", " + 
		this.seminaConbot + ", " + 
		this.seminaEndDate + ", " + 
		this.seminaMin + ", " + 
		this.seminaNow + ", " + 
		this.seminaMax;
		
	}

}
