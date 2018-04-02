package lesson.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Lesson implements Serializable {	
	
	private static final long serialVersionUID = 2000L;
	private int lessonNo;
	private int levelNo;
	private int stateNo;
	private int categoryNo;
	private int userNo1;
	private int userNo2;
	private String lessonTitle;
	private String lessonLocation;
	private int lessonRadius;
	private int lessonPrice;
	private int lessonCount;
	private Date lessonDate;
	private String lessonContop;
	private String lessonConmid;
	private String lessonConbot;
	private String lessonKeyword;
	private String lessonType;
	
	
	public Lesson() {
		
	}

	public Lesson(int lessonNo, int levelNo, int stateNo, int categoryNo, int userNo1, int userNo2, String lessonTitle,
			String lessonLocation, int lessonRadius, int lessonPrice, int lessonCount, Date lessonDate,
			String lessonContop, String lessonConmid, String lessonConbot, String lessonKeyword, String lessonType) {
		super();
		this.lessonNo = lessonNo;
		this.levelNo = levelNo;
		this.stateNo = stateNo;
		this.categoryNo = categoryNo;
		this.userNo1 = userNo1;
		this.userNo2 = userNo2;
		this.lessonTitle = lessonTitle;
		this.lessonLocation = lessonLocation;
		this.lessonRadius = lessonRadius;
		this.lessonPrice = lessonPrice;
		this.lessonCount = lessonCount;
		this.lessonDate = lessonDate;
		this.lessonContop = lessonContop;
		this.lessonConmid = lessonConmid;
		this.lessonConbot = lessonConbot;
		this.lessonKeyword = lessonKeyword;
		this.lessonType = lessonType;
	}

	public int getLessonNo() {
		return lessonNo;
	}

	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
	}

	public int getLevelNo() {
		return levelNo;
	}

	public void setLevelNo(int levelNo) {
		this.levelNo = levelNo;
	}

	public int getStateNo() {
		return stateNo;
	}

	public void setStateNo(int stateNo) {
		this.stateNo = stateNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public int getUserNo1() {
		return userNo1;
	}

	public void setUserNo1(int userNo1) {
		this.userNo1 = userNo1;
	}

	public int getUserNo2() {
		return userNo2;
	}

	public void setUserNo2(int userNo2) {
		this.userNo2 = userNo2;
	}

	public String getLessonTitle() {
		return lessonTitle;
	}

	public void setLessonTitle(String lessonTitle) {
		this.lessonTitle = lessonTitle;
	}

	public String getLessonLocation() {
		return lessonLocation;
	}

	public void setLessonLocation(String lessonLocation) {
		this.lessonLocation = lessonLocation;
	}

	public int getLessonRadius() {
		return lessonRadius;
	}

	public void setLessonRadius(int lessonRadius) {
		this.lessonRadius = lessonRadius;
	}

	public int getLessonPrice() {
		return lessonPrice;
	}

	public void setLessonPrice(int lessonPrice) {
		this.lessonPrice = lessonPrice;
	}

	public int getLessonCount() {
		return lessonCount;
	}

	public void setLessonCount(int lessonCount) {
		this.lessonCount = lessonCount;
	}

	public Date getLessonDate() {
		return lessonDate;
	}

	public void setLessonDate(Date lessonDate) {
		this.lessonDate = lessonDate;
	}

	public String getLessonContop() {
		return lessonContop;
	}

	public void setLessonContop(String lessonContop) {
		this.lessonContop = lessonContop;
	}

	public String getLessonConmid() {
		return lessonConmid;
	}

	public void setLessonConmid(String lessonConmid) {
		this.lessonConmid = lessonConmid;
	}

	public String getLessonConbot() {
		return lessonConbot;
	}

	public void setLessonConbot(String lessonConbot) {
		this.lessonConbot = lessonConbot;
	}

	public String getLessonKeyword() {
		return lessonKeyword;
	}

	public void setLessonKeyword(String lessonKeyword) {
		this.lessonKeyword = lessonKeyword;
	}

	public String getLessonType() {
		return lessonType;
	}

	public void setLessonType(String lessonType) {
		this.lessonType = lessonType;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Lesson [lessonNo=" + lessonNo + ", levelNo=" + levelNo + ", stateNo=" + stateNo + ", categoryNo="
				+ categoryNo + ", userNo1=" + userNo1 + ", userNo2=" + userNo2 + ", lessonTitle=" + lessonTitle
				+ ", lessonLocation=" + lessonLocation + ", lessonRadius=" + lessonRadius + ", lessonPrice="
				+ lessonPrice + ", lessonCount=" + lessonCount + ", lessonDate=" + lessonDate + ", lessonContop="
				+ lessonContop + ", lessonConmid=" + lessonConmid + ", lessonConbot=" + lessonConbot
				+ ", lessonKeyword=" + lessonKeyword + ", lessonType=" + lessonType + "]";
	}	
}
