package lesson.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Lesson implements Serializable {	
	
	private static final long serialVersionUID = 2000L;
	private int lessonNo;
	private int levelNo;
	private int stateNo;
	private int categoryNo;
	private int userNo;
	private int userTypeNo;
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
	
	public Lesson() {
		// TODO Auto-generated constructor stub
	}

	public Lesson(int lessonNo, int levelNo, int stateNo, int categoryNo, int userNo, int userTypeNo,
			String lessonTitle, String lessonLocation, int lessonRadius, int lessonPrice, int lessonCount,
			Date lessonDate, String lessonContop, String lessonConmid, String lessonConbot, String lessonKeyword) {
		super();
		this.lessonNo = lessonNo;
		this.levelNo = levelNo;
		this.stateNo = stateNo;
		this.categoryNo = categoryNo;
		this.userNo = userNo;
		this.userTypeNo = userTypeNo;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		
		return 
		this.lessonNo + ", " + 
		this.levelNo + ", " + 
		this.stateNo + ", " + 
		this.categoryNo + ", " + 
		this.userNo + ", " + 
		this.userTypeNo + ", " + 
		this.lessonTitle + ", " + 
		this.lessonLocation + ", " + 
		this.lessonRadius + ", " + 
		this.lessonPrice + ", " + 
		this.lessonCount + ", " + 
		this.lessonDate + ", " + 
		this.lessonContop + ", " + 
		this.lessonConmid + ", " + 
		this.lessonConbot + ", " + 
		this.lessonKeyword;
	}
	
}
