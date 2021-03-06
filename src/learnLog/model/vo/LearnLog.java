package learnLog.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

public class LearnLog implements Serializable {
	
	private static final long serialVersionUID = 9000L;
	private int logNo;
	private int userNo1;
	private int userNo2;
	private int lessonNo;
	private Date logDate;
	private int state;
	private String userName;
	private String lessonTitle;
	private int lesson_state;
	
	public LearnLog() {
		
	}

	public LearnLog(int logNo, int userNo1, int userNo2, int lessonNo, Date logDate, int state, String userName,
			String lessonTitle, int lesson_state) {
		super();
		this.logNo = logNo;
		this.userNo1 = userNo1;
		this.userNo2 = userNo2;
		this.lessonNo = lessonNo;
		this.logDate = logDate;
		this.state = state;
		this.userName = userName;
		this.lessonTitle = lessonTitle;
		this.lesson_state = lesson_state;
	}

	public int getLogNo() {
		return logNo;
	}

	public void setLogNo(int logNo) {
		this.logNo = logNo;
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

	public int getLessonNo() {
		return lessonNo;
	}

	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
	}

	public Date getLogDate() {
		return logDate;
	}

	public void setLogDate(Date logDate) {
		this.logDate = logDate;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLessonTitle() {
		return lessonTitle;
	}

	public void setLessonTitle(String lessonTitle) {
		this.lessonTitle = lessonTitle;
	}

	public int getLesson_state() {
		return lesson_state;
	}

	public void setLesson_state(int lesson_state) {
		this.lesson_state = lesson_state;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "LearnLog [logNo=" + logNo + ", userNo1=" + userNo1 + ", userNo2=" + userNo2 + ", lessonNo=" + lessonNo
				+ ", logDate=" + logDate + ", state=" + state + ", userName=" + userName + ", lessonTitle="
				+ lessonTitle + ", lesson_state=" + lesson_state + "]";
	}

	
	
	
	
}
