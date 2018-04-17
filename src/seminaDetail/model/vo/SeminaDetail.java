package seminaDetail.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class SeminaDetail implements Serializable {
	
	private static final long serialVersionUID = 3001L;
	private int seminaDetailNo;
	private int seminaNo;
	private int userNo;
	private Date seminaDetailDate;
	private String seminaState;
	private String user_name;
	private String user_email;
	private String user_gender;
	
	
	public SeminaDetail() {
		
	}


	public SeminaDetail(int seminaDetailNo, int seminaNo, int userNo, Date seminaDetailDate, String seminaState,
			String user_name, String user_email, String user_gender) {
		super();
		this.seminaDetailNo = seminaDetailNo;
		this.seminaNo = seminaNo;
		this.userNo = userNo;
		this.seminaDetailDate = seminaDetailDate;
		this.seminaState = seminaState;
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_gender = user_gender;
	}


	public int getSeminaDetailNo() {
		return seminaDetailNo;
	}


	public void setSeminaDetailNo(int seminaDetailNo) {
		this.seminaDetailNo = seminaDetailNo;
	}


	public int getSeminaNo() {
		return seminaNo;
	}


	public void setSeminaNo(int seminaNo) {
		this.seminaNo = seminaNo;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public Date getSeminaDetailDate() {
		return seminaDetailDate;
	}


	public void setSeminaDetailDate(Date seminaDetailDate) {
		this.seminaDetailDate = seminaDetailDate;
	}


	public String getSeminaState() {
		return seminaState;
	}


	public void setSeminaState(String seminaState) {
		this.seminaState = seminaState;
	}


	public String getUser_name() {
		return user_name;
	}


	public void setUser_name(String user_name) {
		this.user_name = user_name;
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


	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	@Override
	public String toString() {
		return "SeminaDetail [seminaDetailNo=" + seminaDetailNo + ", seminaNo=" + seminaNo + ", userNo=" + userNo
				+ ", seminaDetailDate=" + seminaDetailDate + ", seminaState=" + seminaState + ", user_name=" + user_name
				+ ", user_email=" + user_email + ", user_gender=" + user_gender + "]";
	}

	
}
