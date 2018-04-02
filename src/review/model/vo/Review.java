package review.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Review implements Serializable {

	private static final long serialVersionUID = 8000L;
	private int reviewNo;
	private int lessonNo;
	private int levelNo;
	private int stateNo;
	private int categoryNo;
	private int userNo;
	private int userTypeNo;
	private String reviewContent;
	private int reviewPrepare;
	private int reviewSincerity;
	private int reviewDelivery;
	private Date reviewDate;
	private int historyNo;
	
	public Review() {
		
	}

	public Review(int reviewNo, int lessonNo, int levelNo, int stateNo, int categoryNo, int userNo, int userTypeNo,
			String reviewContent, int reviewPrepare, int reviewSincerity, int reviewDelivery, Date reviewDate,
			int historyNo) {
		super();
		this.reviewNo = reviewNo;
		this.lessonNo = lessonNo;
		this.levelNo = levelNo;
		this.stateNo = stateNo;
		this.categoryNo = categoryNo;
		this.userNo = userNo;
		this.userTypeNo = userTypeNo;
		this.reviewContent = reviewContent;
		this.reviewPrepare = reviewPrepare;
		this.reviewSincerity = reviewSincerity;
		this.reviewDelivery = reviewDelivery;
		this.reviewDate = reviewDate;
		this.historyNo = historyNo;
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

	public int getLevelNo() {
		return levelNo;
	}

	public void setLevelNo(int levelNo) {
		this.levelNo = levelNo;
	}

	public int getStateNo() {
		return stateNo;
	}

	public void setStateNo(int stateNo) {
		this.stateNo = stateNo;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
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

	public int getHistoryNo() {
		return historyNo;
	}

	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", lessonNo=" + lessonNo + ", levelNo=" + levelNo + ", stateNo="
				+ stateNo + ", categoryNo=" + categoryNo + ", userNo=" + userNo + ", userTypeNo=" + userTypeNo
				+ ", reviewContent=" + reviewContent + ", reviewPrepare=" + reviewPrepare + ", reviewSincerity="
				+ reviewSincerity + ", reviewDelivery=" + reviewDelivery + ", reviewDate=" + reviewDate + ", historyNo="
				+ historyNo + "]";
	}
	
	
	
}
