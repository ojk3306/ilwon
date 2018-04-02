package searchLog.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class SearchLog implements Serializable {
	private static final long serialVersionUID = 4000L;
	private int searchNo;
	private int userNo;
	private int userTypeNo;
	private String searchContent;
	private int searchCount;
	private Date searchDate;
	
	public SearchLog() {
		// TODO Auto-generated constructor stub
	}

	public SearchLog(int searchNo, int userNo, int userTypeNo, String searchContent, int searchCount, Date searchDate) {
		super();
		this.searchNo = searchNo;
		this.userNo = userNo;
		this.userTypeNo = userTypeNo;
		this.searchContent = searchContent;
		this.searchCount = searchCount;
		this.searchDate = searchDate;
	}

	public int getSearchNo() {
		return searchNo;
	}

	public void setSearchNo(int searchNo) {
		this.searchNo = searchNo;
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

	public String getSearchContent() {
		return searchContent;
	}

	public void setSearchContent(String searchContent) {
		this.searchContent = searchContent;
	}

	public int getSearchCount() {
		return searchCount;
	}

	public void setSearchCount(int searchCount) {
		this.searchCount = searchCount;
	}

	public Date getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(Date searchDate) {
		this.searchDate = searchDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString() {
		
		return 
		this.searchNo + ", " + 
		this.userNo + ", " + 
		this.userTypeNo + ", " + 
		this.searchContent + ", " + 
		this.searchCount + ", " + 
		this.searchDate;
		
	}	
}