package lesson.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Lesson implements Serializable{
	
	private static final long serialVersionUID = 1000L;
	private int lesson_no;
	private int level_no;
	private int state_no;
	private int category_no;
	private int user_no1;
	private int user_no2;
	private String lesson_title;
	private String lesson_loc;
	private int lesson_rad;
	private int lesson_price;
	private int lesson_count;
	private Date lesson_date;
	private String lesson_contop;
	private String lesson_conmid;
	private String lesson_conbot;
	private String lesson_keyword;
	private int lesson_type;
	
	
	
	public Lesson() {}


	public Lesson(int lesson_no, int level_no, int state_no, int category_no, int user_no1, int user_no2,
			String lesson_title, String lesson_loc, int lesson_rad, int lesson_price, int lesson_count, Date lesson_date,
			String lesson_contop, String lesson_conmid, String lesson_conbot, String lesson_keyword, int lesson_type) {
		super();
		this.lesson_no = lesson_no;
		this.level_no = level_no;
		this.state_no = state_no;
		this.category_no = category_no;
		this.user_no1 = user_no1;
		this.user_no2 = user_no2;
		this.lesson_title = lesson_title;
		this.lesson_loc = lesson_loc;
		this.lesson_rad = lesson_rad;
		this.lesson_price = lesson_price;
		this.lesson_count = lesson_count;
		this.lesson_date = lesson_date;
		this.lesson_contop = lesson_contop;
		this.lesson_conmid = lesson_conmid;
		this.lesson_conbot = lesson_conbot;
		this.lesson_keyword = lesson_keyword;
		this.lesson_type = lesson_type;
	}


	public int getlesson_no() {
		return lesson_no;
	}


	public void setlesson_no(int lesson_no) {
		this.lesson_no = lesson_no;
	}


	public int getLevel_no() {
		return level_no;
	}


	public void setLevel_no(int level_no) {
		this.level_no = level_no;
	}


	public int getState_no() {
		return state_no;
	}


	public void setState_no(int state_no) {
		this.state_no = state_no;
	}


	public int getCategory_no() {
		return category_no;
	}


	public void setCategory_no(int category_no) {
		this.category_no = category_no;
	}


	public int getUser_no1() {
		return user_no1;
	}


	public void setUser_no1(int user_no1) {
		this.user_no1 = user_no1;
	}


	public int getUser_no2() {
		return user_no2;
	}


	public void setUser_no2(int user_no2) {
		this.user_no2 = user_no2;
	}


	public String getlesson_title() {
		return lesson_title;
	}


	public void setlesson_title(String lesson_title) {
		this.lesson_title = lesson_title;
	}


	public String getlesson_loc() {
		return lesson_loc;
	}


	public void setlesson_loc(String lesson_loc) {
		this.lesson_loc = lesson_loc;
	}


	public int getlesson_rad() {
		return lesson_rad;
	}


	public void setlesson_rad(int lesson_rad) {
		this.lesson_rad = lesson_rad;
	}


	public int getlesson_price() {
		return lesson_price;
	}


	public void setlesson_price(int lesson_price) {
		this.lesson_price = lesson_price;
	}


	public int getlesson_count() {
		return lesson_count;
	}


	public void setlesson_count(int lesson_count) {
		this.lesson_count = lesson_count;
	}


	public Date getlesson_date() {
		return lesson_date;
	}


	public void setlesson_date(Date lesson_date) {
		this.lesson_date = lesson_date;
	}


	public String getlesson_contop() {
		return lesson_contop;
	}


	public void setlesson_contop(String lesson_contop) {
		this.lesson_contop = lesson_contop;
	}


	public String getlesson_conmid() {
		return lesson_conmid;
	}


	public void setlesson_conmid(String lesson_conmid) {
		this.lesson_conmid = lesson_conmid;
	}


	public String getlesson_conbot() {
		return lesson_conbot;
	}


	public void setlesson_conbot(String lesson_conbot) {
		this.lesson_conbot = lesson_conbot;
	}


	public String getlesson_keyword() {
		return lesson_keyword;
	}


	public void setlesson_keyword(String lesson_keyword) {
		this.lesson_keyword = lesson_keyword;
	}


	public int getlesson_type() {
		return lesson_type;
	}


	public void setlesson_type(int lesson_type) {
		this.lesson_type = lesson_type;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "lessones [lesson_no=" + lesson_no + ", level_no=" + level_no + ", state_no=" + state_no + ", category_no="
				+ category_no + ", user_no1=" + user_no1 + ", user_no2=" + user_no2 + ", lesson_title=" + lesson_title
				+ ", lesson_loc=" + lesson_loc + ", lesson_rad=" + lesson_rad + ", lesson_price=" + lesson_price
				+ ", lesson_count=" + lesson_count + ", lesson_date=" + lesson_date + ", lesson_contop=" + lesson_contop
				+ ", lesson_conmid=" + lesson_conmid + ", lesson_conbot=" + lesson_conbot + ", lesson_keyword="
				+ lesson_keyword + ", lesson_type=" + lesson_type + "]";
	}
	
	
	
	
	
	
}
