package semina.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Semina  implements Serializable {
	
	private static final long serialVersionUID = 3890L;
	private int seminaNo;
	private int userNo;	
	private String seminaTitle;
	private String seminaLocation;
	private int seminaPrice;
	private Date seminaStartDate;
	private String seminatitle1;
	private String seminaContent1;
	private String seminatitle2;
	private String seminaContent2;
	private String seminatitle3;
	private String seminaContent3;
	private String seminatitle4;
	private String seminaContent4;	
	private Date seminaEndDate;
	private int seminaMin;
	private int seminaNow;
	private int seminaMax;
	private String seminaOriginalFileName;
	private String seminaRenameFileName;
	private int SEMINA_STATE;
	
	public int getSEMINA_STATE() {
		return SEMINA_STATE;
	}
	public void setSEMINA_STATE(int sEMINA_STATE) {
		SEMINA_STATE = sEMINA_STATE;
	}
	public Semina() {}
	public int getSeminaNo() {
		return seminaNo;
	}
	public void setSeminaNo(int seminaNo) {
		this.seminaNo = seminaNo;
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
	
	public Date getSeminaStartDate() {
		return seminaStartDate;
	}
	public void setSeminaStartDate(Date seminaStartDate) {
		this.seminaStartDate = seminaStartDate;
	}
	public String getSeminatitle1() {
		return seminatitle1;
	}
	public void setSeminatitle1(String seminatitle1) {
		this.seminatitle1 = seminatitle1;
	}
	public String getSeminaContent1() {
		return seminaContent1;
	}
	public void setSeminaContent1(String seminaContent1) {
		this.seminaContent1 = seminaContent1;
	}
	public String getSeminatitle2() {
		return seminatitle2;
	}
	public void setSeminatitle2(String seminatitle2) {
		this.seminatitle2 = seminatitle2;
	}
	public String getSeminaContent2() {
		return seminaContent2;
	}
	public void setSeminaContent2(String seminaContent2) {
		this.seminaContent2 = seminaContent2;
	}
	public String getSeminatitle3() {
		return seminatitle3;
	}
	public void setSeminatitle3(String seminatitle3) {
		this.seminatitle3 = seminatitle3;
	}
	public String getSeminaContent3() {
		return seminaContent3;
	}
	public void setSeminaContent3(String seminaContent3) {
		this.seminaContent3 = seminaContent3;
	}
	public String getSeminatitle4() {
		return seminatitle4;
	}
	public void setSeminatitle4(String seminatitle4) {
		this.seminatitle4 = seminatitle4;
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
	public String getSeminaOriginalFileName() {
		return seminaOriginalFileName;
	}
	public void setSeminaOriginalFileName(String seminaOriginalFileName) {
		this.seminaOriginalFileName = seminaOriginalFileName;
	}
	public String getSeminaRenameFileName() {
		return seminaRenameFileName;
	}
	public void setSeminaRenameFileName(String seminaRenameFileName) {
		this.seminaRenameFileName = seminaRenameFileName;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Semina(int seminaNo, int categoryNo, int userNo, String seminaTitle, String seminaLocation, int seminaPrice,
			int seminaLevel, Date seminaStartDate, String seminatitle1, String seminaContent1, String seminatitle2,
			String seminaContent2, String seminatitle3, String seminaContent3, String seminatitle4,
			String seminaContent4, Date seminaEndDate, int seminaMin, int seminaNow, int seminaMax,
			String seminaOriginalFileName, String seminaRenameFileName) {
		super();
		this.seminaNo = seminaNo;
		this.userNo = userNo;
		this.seminaTitle = seminaTitle;
		this.seminaLocation = seminaLocation;
		this.seminaPrice = seminaPrice;
	
		this.seminaStartDate = seminaStartDate;
		this.seminatitle1 = seminatitle1;
		this.seminaContent1 = seminaContent1;
		this.seminatitle2 = seminatitle2;
		this.seminaContent2 = seminaContent2;
		this.seminatitle3 = seminatitle3;
		this.seminaContent3 = seminaContent3;
		this.seminatitle4 = seminatitle4;
		this.seminaContent4 = seminaContent4;
		this.seminaEndDate = seminaEndDate;
		this.seminaMin = seminaMin;
		this.seminaNow = seminaNow;
		this.seminaMax = seminaMax;
		this.seminaOriginalFileName = seminaOriginalFileName;
		this.seminaRenameFileName = seminaRenameFileName;
	}
	@Override
	public String toString() {
		return "Semina [seminaNo=" + seminaNo + ", userNo=" + userNo + ", seminaTitle="
				+ seminaTitle + ", seminaLocation=" + seminaLocation + ", seminaPrice=" + seminaPrice +", seminaStartDate=" + seminaStartDate + ", seminatitle1=" + seminatitle1
				+ ", seminaContent1=" + seminaContent1 + ", seminatitle2=" + seminatitle2 + ", seminaContent2="
				+ seminaContent2 + ", seminatitle3=" + seminatitle3 + ", seminaContent3=" + seminaContent3
				+ ", seminatitle4=" + seminatitle4 + ", seminaContent4=" + seminaContent4 + ", seminaEndDate="
				+ seminaEndDate + ", seminaMin=" + seminaMin + ", seminaNow=" + seminaNow + ", seminaMax=" + seminaMax
				+ ", seminaOriginalFileName=" + seminaOriginalFileName + ", seminaRenameFileName="
				+ seminaRenameFileName + "]";
	}

}
