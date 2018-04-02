package users.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Users implements Serializable {	
	
	private static final long serialVersionUID = 1000L;
	private int userNo;
	private int userTypeNo;
	private String userEmail;
	private String userPassword;
	private String userName;
	private String userGender;
	private int userAge;
	private String userLoc;
	private String userPhone;
	private String userOriginalPhoto;
	private String userRenamePhoto;
	private int userKeywordCount;
	private String userLoginable;
	private String userExeable;
	private int userLessonmax;
	private Date userEnrollDate;
	
	public Users() {
		
	}
	
	public Users(int userNo, int userTypeNo, String userEmail, String userPassword, String userName, String userGender,
			int userAge, String userLoc, String userPhone, String userOriginalPhoto, String userRenamePhoto,
			int userKeywordCount, String userLoginable, String userExeable, int userLessonmax, Date userEnrollDate) {
		
		super();
		this.userNo = userNo;
		this.userTypeNo = userTypeNo;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userName = userName;
		this.userGender = userGender;
		this.userAge = userAge;
		this.userLoc = userLoc;
		this.userPhone = userPhone;
		this.userOriginalPhoto = userOriginalPhoto;
		this.userRenamePhoto = userRenamePhoto;
		this.userKeywordCount = userKeywordCount;
		this.userLoginable = userLoginable;
		this.userExeable = userExeable;
		this.userLessonmax = userLessonmax;
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

	public String getUserLoc() {
		return userLoc;
	}

	public void setUserLoc(String userLoc) {
		this.userLoc = userLoc;
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

	public int getUserLessonmax() {
		return userLessonmax;
	}

	public void setUserLessonmax(int userLessonmax) {
		this.userLessonmax = userLessonmax;
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
		return "User [userNo=" + userNo + ", userTypeNo=" + userTypeNo + ", userEmail=" + userEmail + ", userPassword="
				+ userPassword + ", userName=" + userName + ", userGender=" + userGender + ", userAge=" + userAge
				+ ", userLoc=" + userLoc + ", userPhone=" + userPhone + ", userOriginalPhoto=" + userOriginalPhoto
				+ ", userRenamePhoto=" + userRenamePhoto + ", userKeywordCount=" + userKeywordCount + ", userLoginable="
				+ userLoginable + ", userExeable=" + userExeable + ", userLessonmax=" + userLessonmax
				+ ", userEnrollDate=" + userEnrollDate + "]";
	}	
	
}
