package review.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Review implements Serializable {

	private static final long serialVersionUID = 8000L;
	private int reviewNo;
	private int lessonNo;		
	private String reviewContent;
	private int reviewPrepare;
	private int reviewSincerity;
	private int reviewDelivery;
	private Date reviewDate;
	private int userNO;
	private String userName;
	private String userPhoto;
	public Review() {
		
	}
	public Review(int reviewNo, int lessonNo, String reviewContent, int reviewPrepare, int reviewSincerity,
			int reviewDelivery, Date reviewDate, int userNO, String userName, String userPhoto) {
		super();
		this.reviewNo = reviewNo;
		this.lessonNo = lessonNo;
		this.reviewContent = reviewContent;
		this.reviewPrepare = reviewPrepare;
		this.reviewSincerity = reviewSincerity;
		this.reviewDelivery = reviewDelivery;
		this.reviewDate = reviewDate;
		this.userNO = userNO;
		this.userName = userName;
		this.userPhoto = userPhoto;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getLessonNo() {
		return lessonNo;
	}
	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
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
	public Date getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getUserNO() {
		return userNO;
	}
	public void setUserNO(int userNO) {
		this.userNO = userNO;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhoto() {
		return userPhoto;
	}
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", lessonNo=" + lessonNo + ", reviewContent=" + reviewContent
				+ ", reviewPrepare=" + reviewPrepare + ", reviewSincerity=" + reviewSincerity + ", reviewDelivery="
				+ reviewDelivery + ", reviewDate=" + reviewDate + ", userNO=" + userNO + ", userName=" + userName
				+ ", userPhoto=" + userPhoto + "]";
	}
	

	
}
