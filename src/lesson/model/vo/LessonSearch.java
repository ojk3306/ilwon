package lesson.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.Arrays;

public class LessonSearch implements Serializable {
	
	private static final long serialVersionUID = 10000L;
	private String locationValue;
	private String lessonValue;
	private int lessonPreValue;
	private int lessonEndValue;
	private String teacherGenderValue;
	private int teacherAgePreValue;
	private int teacherAgeEndValue;
	/*private String teacherEXPValue[];*/
	private int lessonPricePreValue;
	private int lessonPriceEndValue;
	private int lessonLevelPreValue;
	private int lessonLevelEndValue;
	private int lesson_no;
	private int level_no;
	private String level;
	private int state_no;
	private int category_no;
	private String category_bigName;
	private String category_smallName;
	private int user_no1;
	private int user_no2;
	private String user_name1;
	private String user_name2;
	private String lesson_title;
	private String lesson_loc;
	private int lesson_rad;
	private int lesson_price;
	private int lesson_count;
	private Date lesson_startdate;
	private String lesson_contop;
	private String lesson_conmid;
	private String lesson_conbot;
	private String lesson_keyword;
	private Date lesson_enddate;
	private int lesson_type;
	
	public LessonSearch() {
		
	}

	public LessonSearch(String locationValue, String lessonValue, int lessonPreValue, int lessonEndValue,
			String teacherGenderValue, int teacherAgePreValue, int teacherAgeEndValue, int lessonPricePreValue,
			int lessonPriceEndValue, int lessonLevelPreValue, int lessonLevelEndValue, int lesson_no, int level_no,
			String level, int state_no, int category_no, String category_bigName, String category_smallName,
			int user_no1, int user_no2, String user_name1, String user_name2, String lesson_title, String lesson_loc,
			int lesson_rad, int lesson_price, int lesson_count, Date lesson_startdate, String lesson_contop,
			String lesson_conmid, String lesson_conbot, String lesson_keyword, Date lesson_enddate, int lesson_type) {
		super();
		this.locationValue = locationValue;
		this.lessonValue = lessonValue;
		this.lessonPreValue = lessonPreValue;
		this.lessonEndValue = lessonEndValue;
		this.teacherGenderValue = teacherGenderValue;
		this.teacherAgePreValue = teacherAgePreValue;
		this.teacherAgeEndValue = teacherAgeEndValue;
		this.lessonPricePreValue = lessonPricePreValue;
		this.lessonPriceEndValue = lessonPriceEndValue;
		this.lessonLevelPreValue = lessonLevelPreValue;
		this.lessonLevelEndValue = lessonLevelEndValue;
		this.lesson_no = lesson_no;
		this.level_no = level_no;
		this.level = level;
		this.state_no = state_no;
		this.category_no = category_no;
		this.category_bigName = category_bigName;
		this.category_smallName = category_smallName;
		this.user_no1 = user_no1;
		this.user_no2 = user_no2;
		this.user_name1 = user_name1;
		this.user_name2 = user_name2;
		this.lesson_title = lesson_title;
		this.lesson_loc = lesson_loc;
		this.lesson_rad = lesson_rad;
		this.lesson_price = lesson_price;
		this.lesson_count = lesson_count;
		this.lesson_startdate = lesson_startdate;
		this.lesson_contop = lesson_contop;
		this.lesson_conmid = lesson_conmid;
		this.lesson_conbot = lesson_conbot;
		this.lesson_keyword = lesson_keyword;
		this.lesson_enddate = lesson_enddate;
		this.lesson_type = lesson_type;
	}	

	public LessonSearch(String locationValue, String lessonValue, String teacherGenderValue, int teacherAgePreValue,
			int teacherAgeEndValue, int lessonPricePreValue, int lessonPriceEndValue, int lessonLevelPreValue,
			int lessonLevelEndValue) {
		super();
		this.locationValue = locationValue;
		this.lessonValue = lessonValue;
		this.teacherGenderValue = teacherGenderValue;
		this.teacherAgePreValue = teacherAgePreValue;
		this.teacherAgeEndValue = teacherAgeEndValue;
		this.lessonPricePreValue = lessonPricePreValue;
		this.lessonPriceEndValue = lessonPriceEndValue;
		this.lessonLevelPreValue = lessonLevelPreValue;
		this.lessonLevelEndValue = lessonLevelEndValue;
	}

	public String getLocationValue() {
		return locationValue;
	}

	public void setLocationValue(String locationValue) {
		this.locationValue = locationValue;
	}

	public String getLessonValue() {
		return lessonValue;
	}

	public void setLessonValue(String lessonValue) {
		this.lessonValue = lessonValue;
	}

	public int getLessonPreValue() {
		return lessonPreValue;
	}

	public void setLessonPreValue(int lessonPreValue) {
		this.lessonPreValue = lessonPreValue;
	}

	public int getLessonEndValue() {
		return lessonEndValue;
	}

	public void setLessonEndValue(int lessonEndValue) {
		this.lessonEndValue = lessonEndValue;
	}

	public String getTeacherGenderValue() {
		return teacherGenderValue;
	}

	public void setTeacherGenderValue(String teacherGenderValue) {
		this.teacherGenderValue = teacherGenderValue;
	}

	public int getTeacherAgePreValue() {
		return teacherAgePreValue;
	}

	public void setTeacherAgePreValue(int teacherAgePreValue) {
		this.teacherAgePreValue = teacherAgePreValue;
	}

	public int getTeacherAgeEndValue() {
		return teacherAgeEndValue;
	}

	public void setTeacherAgeEndValue(int teacherAgeEndValue) {
		this.teacherAgeEndValue = teacherAgeEndValue;
	}

	public int getLessonPricePreValue() {
		return lessonPricePreValue;
	}

	public void setLessonPricePreValue(int lessonPricePreValue) {
		this.lessonPricePreValue = lessonPricePreValue;
	}

	public int getLessonPriceEndValue() {
		return lessonPriceEndValue;
	}

	public void setLessonPriceEndValue(int lessonPriceEndValue) {
		this.lessonPriceEndValue = lessonPriceEndValue;
	}

	public int getLessonLevelPreValue() {
		return lessonLevelPreValue;
	}

	public void setLessonLevelPreValue(int lessonLevelPreValue) {
		this.lessonLevelPreValue = lessonLevelPreValue;
	}

	public int getLessonLevelEndValue() {
		return lessonLevelEndValue;
	}

	public void setLessonLevelEndValue(int lessonLevelEndValue) {
		this.lessonLevelEndValue = lessonLevelEndValue;
	}

	public int getLesson_no() {
		return lesson_no;
	}

	public void setLesson_no(int lesson_no) {
		this.lesson_no = lesson_no;
	}

	public int getLevel_no() {
		return level_no;
	}

	public void setLevel_no(int level_no) {
		this.level_no = level_no;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
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

	public String getCategory_bigName() {
		return category_bigName;
	}

	public void setCategory_bigName(String category_bigName) {
		this.category_bigName = category_bigName;
	}

	public String getCategory_smallName() {
		return category_smallName;
	}

	public void setCategory_smallName(String category_smallName) {
		this.category_smallName = category_smallName;
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

	public String getUser_name1() {
		return user_name1;
	}

	public void setUser_name1(String user_name1) {
		this.user_name1 = user_name1;
	}

	public String getUser_name2() {
		return user_name2;
	}

	public void setUser_name2(String user_name2) {
		this.user_name2 = user_name2;
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

	public Date getLesson_startdate() {
		return lesson_startdate;
	}

	public void setLesson_startdate(Date lesson_startdate) {
		this.lesson_startdate = lesson_startdate;
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

	public Date getLesson_enddate() {
		return lesson_enddate;
	}

	public void setLesson_enddate(Date lesson_enddate) {
		this.lesson_enddate = lesson_enddate;
	}

	public int getLesson_type() {
		return lesson_type;
	}

	public void setLesson_type(int lesson_type) {
		this.lesson_type = lesson_type;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "LessonSearch [locationValue=" + locationValue + ", lessonValue=" + lessonValue + ", lessonPreValue="
				+ lessonPreValue + ", lessonEndValue=" + lessonEndValue + ", teacherGenderValue=" + teacherGenderValue
				+ ", teacherAgePreValue=" + teacherAgePreValue + ", teacherAgeEndValue=" + teacherAgeEndValue
				+ ", lessonPricePreValue=" + lessonPricePreValue + ", lessonPriceEndValue=" + lessonPriceEndValue
				+ ", lessonLevelPreValue=" + lessonLevelPreValue + ", lessonLevelEndValue=" + lessonLevelEndValue
				+ ", lesson_no=" + lesson_no + ", level_no=" + level_no + ", level=" + level + ", state_no=" + state_no
				+ ", category_no=" + category_no + ", category_bigName=" + category_bigName + ", category_smallName="
				+ category_smallName + ", user_no1=" + user_no1 + ", user_no2=" + user_no2 + ", user_name1="
				+ user_name1 + ", user_name2=" + user_name2 + ", lesson_title=" + lesson_title + ", lesson_loc="
				+ lesson_loc + ", lesson_rad=" + lesson_rad + ", lesson_price=" + lesson_price + ", lesson_count="
				+ lesson_count + ", lesson_startdate=" + lesson_startdate + ", lesson_contop=" + lesson_contop
				+ ", lesson_conmid=" + lesson_conmid + ", lesson_conbot=" + lesson_conbot + ", lesson_keyword="
				+ lesson_keyword + ", lesson_enddate=" + lesson_enddate + ", lesson_type=" + lesson_type + "]";
	}	
					
}
