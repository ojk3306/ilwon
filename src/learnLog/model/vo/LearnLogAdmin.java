package learnLog.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class LearnLogAdmin implements Serializable{

	
	private static final long serialVersionUID = 90300L;
	private int LOG_NO; 
	private int USER_NO1;
	private int USER_NO2;
	private int LESSON_NO;
	private Date LOG_DATE;
	private int LOG_STATE;
	private String LESSON_TITLE;
	private String USER_NAME;
	private String USER_PHONE;
	private String user_email;
	private String user_gender;
	private int LESSONTYPE;
	
	public LearnLogAdmin() {}

	public LearnLogAdmin(int lOG_NO, int uSER_NO1, int uSER_NO2, int lESSON_NO, Date lOG_DATE, int lOG_STATE,
			String lESSON_TITLE, String uSER_NAME, String uSER_PHONE, String user_email, String user_gender,
			int lESSONTYPE) {
		super();
		LOG_NO = lOG_NO;
		USER_NO1 = uSER_NO1;
		USER_NO2 = uSER_NO2;
		LESSON_NO = lESSON_NO;
		LOG_DATE = lOG_DATE;
		LOG_STATE = lOG_STATE;
		LESSON_TITLE = lESSON_TITLE;
		USER_NAME = uSER_NAME;
		USER_PHONE = uSER_PHONE;
		this.user_email = user_email;
		this.user_gender = user_gender;
		LESSONTYPE = lESSONTYPE;
	}

	public int getLOG_NO() {
		return LOG_NO;
	}

	public void setLOG_NO(int lOG_NO) {
		LOG_NO = lOG_NO;
	}

	public int getUSER_NO1() {
		return USER_NO1;
	}

	public void setUSER_NO1(int uSER_NO1) {
		USER_NO1 = uSER_NO1;
	}

	public int getUSER_NO2() {
		return USER_NO2;
	}

	public void setUSER_NO2(int uSER_NO2) {
		USER_NO2 = uSER_NO2;
	}

	public int getLESSON_NO() {
		return LESSON_NO;
	}

	public void setLESSON_NO(int lESSON_NO) {
		LESSON_NO = lESSON_NO;
	}

	public Date getLOG_DATE() {
		return LOG_DATE;
	}

	public void setLOG_DATE(Date lOG_DATE) {
		LOG_DATE = lOG_DATE;
	}

	public int getLOG_STATE() {
		return LOG_STATE;
	}

	public void setLOG_STATE(int lOG_STATE) {
		LOG_STATE = lOG_STATE;
	}

	public String getLESSON_TITLE() {
		return LESSON_TITLE;
	}

	public void setLESSON_TITLE(String lESSON_TITLE) {
		LESSON_TITLE = lESSON_TITLE;
	}

	public String getUSER_NAME() {
		return USER_NAME;
	}

	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}

	public String getUSER_PHONE() {
		return USER_PHONE;
	}

	public void setUSER_PHONE(String uSER_PHONE) {
		USER_PHONE = uSER_PHONE;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public int getLESSONTYPE() {
		return LESSONTYPE;
	}

	public void setLESSONTYPE(int lESSONTYPE) {
		LESSONTYPE = lESSONTYPE;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "LearnLogAdmin [LOG_NO=" + LOG_NO + ", USER_NO1=" + USER_NO1 + ", USER_NO2=" + USER_NO2 + ", LESSON_NO="
				+ LESSON_NO + ", LOG_DATE=" + LOG_DATE + ", LOG_STATE=" + LOG_STATE + ", LESSON_TITLE=" + LESSON_TITLE
				+ ", USER_NAME=" + USER_NAME + ", USER_PHONE=" + USER_PHONE + ", user_email=" + user_email
				+ ", user_gender=" + user_gender + ", LESSONTYPE=" + LESSONTYPE + "]";
	}
	
	
}
