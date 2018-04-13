package users.model.vo;

import java.sql.Date;

public class NewestLessonByAdmin {

	private String userName;
	private String lesson_title;
	private Date lesson_startdate;
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLesson_title() {
		return lesson_title;
	}
	public void setLesson_title(String lesson_title) {
		this.lesson_title = lesson_title;
	}
	public Date getLesson_startdate() {
		return lesson_startdate;
	}
	public void setLesson_startdate(Date lesson_startdate) {
		this.lesson_startdate=lesson_startdate;
	}
	
}
