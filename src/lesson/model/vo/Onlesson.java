package lesson.model.vo;

import java.io.Serializable;

public class Onlesson  implements Serializable{

	private static final long serialVersionUID = 1000L;
	private String lesson_title;
	private String state;
	private String user_name;

	
	public Onlesson() {}


	public Onlesson(String lesson_title, String state, String user_name) {
		super();
		this.lesson_title = lesson_title;
		this.state = state;
		this.user_name = user_name;
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


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

	

}
