package lesson.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class LessonDetail implements Serializable{
	
	private static final long serialVersionUID = 1000L;
	private int lesson_no;
	private String level;
	private String lesson_title;
	private String lesson_loc;
	private int lesson_rad;
	private int lesson_price;
	private int lesson_count;
	private int state_no;
	private String lesson_contop;
	private String lesson_conmid;
	private String lesson_conbot;
	private String lesson_keyword;
	private String user_name;
	private int reviewPrepare;
	private int reviewSincerity;
	private int reviewDelivery;
	private int reviewNo;		
	private String reviewContent;
	private String lesson_orginal;
	private String lesson_rename;
	private String lesson_orginal2;
	private String lesson_rename2;
	private String lesson_orginal3;
	private String lesson_rename3;
	private int user_no;
	private Date LESSON_STARTDATE;
	
	
	public LessonDetail() {}


	public int getLesson_no() {
		return lesson_no;
	}


	public void setLesson_no(int lesson_no) {
		this.lesson_no = lesson_no;
	}


	public String getLevel() {
		return level;
	}


	public void setLevel(String level) {
		this.level = level;
	}


	public String getLesson_title() {
		return lesson_title;
	}


	public void setLesson_title(String lesson_title) {
		this.lesson_title = lesson_title;
	}


	public String getLesson_loc() {
		return lesson_loc;
	}


	public void setLesson_loc(String lesson_loc) {
		this.lesson_loc = lesson_loc;
	}


	public int getLesson_rad() {
		return lesson_rad;
	}


	public void setLesson_rad(int lesson_rad) {
		this.lesson_rad = lesson_rad;
	}


	public int getLesson_price() {
		return lesson_price;
	}


	public void setLesson_price(int lesson_price) {
		this.lesson_price = lesson_price;
	}


	public int getLesson_count() {
		return lesson_count;
	}


	public void setLesson_count(int lesson_count) {
		this.lesson_count = lesson_count;
	}


	public int getState_no() {
		return state_no;
	}


	public void setState_no(int state_no) {
		this.state_no = state_no;
	}


	public String getLesson_contop() {
		return lesson_contop;
	}


	public void setLesson_contop(String lesson_contop) {
		this.lesson_contop = lesson_contop;
	}


	public String getLesson_conmid() {
		return lesson_conmid;
	}


	public void setLesson_conmid(String lesson_conmid) {
		this.lesson_conmid = lesson_conmid;
	}


	public String getLesson_conbot() {
		return lesson_conbot;
	}


	public void setLesson_conbot(String lesson_conbot) {
		this.lesson_conbot = lesson_conbot;
	}


	public String getLesson_keyword() {
		return lesson_keyword;
	}


	public void setLesson_keyword(String lesson_keyword) {
		this.lesson_keyword = lesson_keyword;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}


	public int getReviewPrepare() {
		return reviewPrepare;
	}


	public void setReviewPrepare(int reviewPrepare) {
		this.reviewPrepare = reviewPrepare;
	}


	public int getReviewSincerity() {
		return reviewSincerity;
	}


	public void setReviewSincerity(int reviewSincerity) {
		this.reviewSincerity = reviewSincerity;
	}


	public int getReviewDelivery() {
		return reviewDelivery;
	}


	public void setReviewDelivery(int reviewDelivery) {
		this.reviewDelivery = reviewDelivery;
	}


	public int getReviewNo() {
		return reviewNo;
	}


	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}


	public String getReviewContent() {
		return reviewContent;
	}


	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}


	public String getLesson_orginal() {
		return lesson_orginal;
	}


	public void setLesson_orginal(String lesson_orginal) {
		this.lesson_orginal = lesson_orginal;
	}


	public String getLesson_rename() {
		return lesson_rename;
	}


	public void setLesson_rename(String lesson_rename) {
		this.lesson_rename = lesson_rename;
	}


	public String getLesson_orginal2() {
		return lesson_orginal2;
	}


	public void setLesson_orginal2(String lesson_orginal2) {
		this.lesson_orginal2 = lesson_orginal2;
	}


	public String getLesson_rename2() {
		return lesson_rename2;
	}


	public void setLesson_rename2(String lesson_rename2) {
		this.lesson_rename2 = lesson_rename2;
	}


	public String getLesson_orginal3() {
		return lesson_orginal3;
	}


	public void setLesson_orginal3(String lesson_orginal3) {
		this.lesson_orginal3 = lesson_orginal3;
	}


	public String getLesson_rename3() {
		return lesson_rename3;
	}


	public void setLesson_rename3(String lesson_rename3) {
		this.lesson_rename3 = lesson_rename3;
	}


	public int getUser_no() {
		return user_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}


	public Date getLESSON_STARTDATE() {
		return LESSON_STARTDATE;
	}


	public void setLESSON_STARTDATE(Date lESSON_STARTDATE) {
		LESSON_STARTDATE = lESSON_STARTDATE;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "LessonDetail [lesson_no=" + lesson_no + ", level=" + level + ", lesson_title=" + lesson_title
				+ ", lesson_loc=" + lesson_loc + ", lesson_rad=" + lesson_rad + ", lesson_price=" + lesson_price
				+ ", lesson_count=" + lesson_count + ", state_no=" + state_no + ", lesson_contop=" + lesson_contop
				+ ", lesson_conmid=" + lesson_conmid + ", lesson_conbot=" + lesson_conbot + ", lesson_keyword="
				+ lesson_keyword + ", user_name=" + user_name + ", reviewPrepare=" + reviewPrepare
				+ ", reviewSincerity=" + reviewSincerity + ", reviewDelivery=" + reviewDelivery + ", reviewNo="
				+ reviewNo + ", reviewContent=" + reviewContent + ", lesson_orginal=" + lesson_orginal
				+ ", lesson_rename=" + lesson_rename + ", lesson_orginal2=" + lesson_orginal2 + ", lesson_rename2="
				+ lesson_rename2 + ", lesson_orginal3=" + lesson_orginal3 + ", lesson_rename3=" + lesson_rename3
				+ ", user_no=" + user_no + ", LESSON_STARTDATE=" + LESSON_STARTDATE + "]";
	}


	public LessonDetail(int lesson_no, String level, String lesson_title, String lesson_loc, int lesson_rad,
			int lesson_price, int lesson_count, int state_no, String lesson_contop, String lesson_conmid,
			String lesson_conbot, String lesson_keyword, String user_name, int reviewPrepare, int reviewSincerity,
			int reviewDelivery, int reviewNo, String reviewContent, String lesson_orginal, String lesson_rename,
			String lesson_orginal2, String lesson_rename2, String lesson_orginal3, String lesson_rename3, int user_no,
			Date lESSON_STARTDATE) {
		super();
		this.lesson_no = lesson_no;
		this.level = level;
		this.lesson_title = lesson_title;
		this.lesson_loc = lesson_loc;
		this.lesson_rad = lesson_rad;
		this.lesson_price = lesson_price;
		this.lesson_count = lesson_count;
		this.state_no = state_no;
		this.lesson_contop = lesson_contop;
		this.lesson_conmid = lesson_conmid;
		this.lesson_conbot = lesson_conbot;
		this.lesson_keyword = lesson_keyword;
		this.user_name = user_name;
		this.reviewPrepare = reviewPrepare;
		this.reviewSincerity = reviewSincerity;
		this.reviewDelivery = reviewDelivery;
		this.reviewNo = reviewNo;
		this.reviewContent = reviewContent;
		this.lesson_orginal = lesson_orginal;
		this.lesson_rename = lesson_rename;
		this.lesson_orginal2 = lesson_orginal2;
		this.lesson_rename2 = lesson_rename2;
		this.lesson_orginal3 = lesson_orginal3;
		this.lesson_rename3 = lesson_rename3;
		this.user_no = user_no;
		LESSON_STARTDATE = lESSON_STARTDATE;
	}

	
}
