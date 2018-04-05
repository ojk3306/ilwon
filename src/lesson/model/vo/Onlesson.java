package lesson.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Onlesson  implements Serializable{

	private static final long serialVersionUID = 1000L;
	private String lesson_title;
	private String state;
	private String user_name;
	private int lesson_no;
	private Date lesson_enddate;
	
	public Onlesson() {}

	public Onlesson(String lesson_title, String state, String user_name, int lesson_no, Date lesson_enddate) {
		super();
		this.lesson_title = lesson_title;
		this.state = state;
		this.user_name = user_name;
		this.lesson_no = lesson_no;
		this.lesson_enddate = lesson_enddate;
	}

	public String getLesson_title() {
		return lesson_title;
	}

	public void setLesson_title(String lesson_title) {
		this.lesson_title = lesson_title;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getLesson_no() {
		return lesson_no;
	}

	public void setLesson_no(int lesson_no) {
		this.lesson_no = lesson_no;
	}

	public Date getLesson_enddate() {
		return lesson_enddate;
	}

	public void setLesson_enddate(Date lesson_enddate) {
		this.lesson_enddate = lesson_enddate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Onlesson [lesson_title=" + lesson_title + ", state=" + state + ", user_name=" + user_name
				+ ", lesson_no=" + lesson_no + ", lesson_enddate=" + lesson_enddate + "]";
	}

	
	

	

	

}
