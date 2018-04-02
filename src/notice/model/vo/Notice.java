package notice.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Notice implements Serializable {
	
	private static final long serialVersionUID = 5000L;
	private int noticeNo;
	private int userNo;
	private int userTypeNo;
	private String noticeTitle;
	private Date noticeDate;
	private String noticeContent;
	
	public Notice() {
		
	}

	public Notice(int noticeNo, int userNo, int userTypeNo, String noticeTitle, Date noticeDate, String noticeContent) {
		super();
		this.noticeNo = noticeNo;
		this.userNo = userNo;
		this.userTypeNo = userTypeNo;
		this.noticeTitle = noticeTitle;
		this.noticeDate = noticeDate;
		this.noticeContent = noticeContent;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
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

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", userNo=" + userNo + ", userTypeNo=" + userTypeNo + ", noticeTitle="
				+ noticeTitle + ", noticeDate=" + noticeDate + ", noticeContent=" + noticeContent + "]";
	}	
	
}
