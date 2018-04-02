package searchLog.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class SearchLog implements Serializable {
	private static final long serialVersionUID = 4000L;
	private int searchNo;
	private Integer userNo;	
	private String searchContent;
	private int searchCount;
	private Date searchDate;
	
	public SearchLog() {}


	public SearchLog(int searchNo, Integer userNo, String searchContent, int searchCount, Date searchDate) {
		super();
		this.searchNo = searchNo;
		this.userNo = userNo;
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


	public Integer getUserNo() {
		return userNo;
	}


	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
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
		return "SearchLog [searchNo=" + searchNo + ", userNo=" + userNo + ", searchContent=" + searchContent
				+ ", searchCount=" + searchCount + ", searchDate=" + searchDate + "]";
	}	
}
