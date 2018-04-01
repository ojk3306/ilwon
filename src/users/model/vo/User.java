package users.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class User implements Serializable {	
	
	private static final long serialVersionUID = 1000L;
	private int userNo;
	private int userTypeNo;
	private String userEmail;
	private String userPassword;
	private String userName;
	private String userGender;
	private int userAge;
	private String userPhone;
	private String userOriginalPhoto;
	private String userRenamePhoto;
	private int userKeywordCount;
	private String userLoginable;
	private String userExeable;
	private int userClassmax;
	private Date userEnrollDate;
	
	public User() {
		
	}

	public User(int userNo, int userTypeNo, String userEmail, String userPassword, String userName, String userGender,
			int userAge, String userPhone, String userOriginalPhoto, String userRenamePhoto, int userKeywordCount,
			String userLoginable, String userExeable, int userClassmax, Date userEnrollDate) {
		super();
		this.userNo = userNo;
		this.userTypeNo = userTypeNo;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userGender = userGender;
		this.userAge = userAge;
		this.userPhone = userPhone;
		this.userOriginalPhoto = userOriginalPhoto;
		this.userRenamePhoto = userRenamePhoto;
		this.userKeywordCount = userKeywordCount;
		this.userLoginable = userLoginable;
		this.userExeable = userExeable;
		this.userClassmax = userClassmax;
		this.userEnrollDate = userEnrollDate;
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

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public int getUserAge() {
		return userAge;
	}

	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserOriginalPhoto() {
		return userOriginalPhoto;
	}

	public void setUserOriginalPhoto(String userOriginalPhoto) {
		this.userOriginalPhoto = userOriginalPhoto;
	}

	public String getUserRenamePhoto() {
		return userRenamePhoto;
	}

	public void setUserRenamePhoto(String userRenamePhoto) {
		this.userRenamePhoto = userRenamePhoto;
	}

	public int getUserKeywordCount() {
		return userKeywordCount;
	}

	public void setUserKeywordCount(int userKeywordCount) {
		this.userKeywordCount = userKeywordCount;
	}

	public String getUserLoginable() {
		return userLoginable;
	}

	public void setUserLoginable(String userLoginable) {
		this.userLoginable = userLoginable;
	}

	public String getUserExeable() {
		return userExeable;
	}

	public void setUserExeable(String userExeable) {
		this.userExeable = userExeable;
	}

	public int getUserClassmax() {
		return userClassmax;
	}

	public void setUserClassmax(int userClassmax) {
		this.userClassmax = userClassmax;
	}

	public Date getUserEnrollDate() {
		return userEnrollDate;
	}

	public void setUserEnrollDate(Date userEnrollDate) {
		this.userEnrollDate = userEnrollDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		
		return 
		this.userNo + ", " + 
		this.userTypeNo + ", " + 
		this.userEmail + ", " + 
		this.userPassword + ", " + 
		this.userName + ", " + 
		this.userGender + ", " + 
		this.userAge + ", " + 
		this.userPhone + ", " + 
		this.userOriginalPhoto + ", " + 
		this.userRenamePhoto + ", " + 
		this.userKeywordCount + ", " + 
		this.userLoginable + ", " + 
		this.userExeable + ", " + 
		this.userClassmax + ", " + 
		this.userEnrollDate;
		
	}
}
