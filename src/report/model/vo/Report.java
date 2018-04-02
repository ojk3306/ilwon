package report.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Report implements Serializable {

	private static final long serialVersionUID = 7000L;
	private int reportNo;
	private int userNo;	
	private String reportTitle;
	private Date reportDate;
	private String reportContent;
	private String reportOriginalFileName;
	private String reportRenameFileName;
	
	public Report() {
		// TODO Auto-generated constructor stub
	}

	public Report(int reportNo, int userNo, String reportTitle, Date reportDate, String reportContent,
			String reportOriginalFileName, String reportRenameFileName) {
		super();
		this.reportNo = reportNo;
		this.userNo = userNo;		
		this.reportTitle = reportTitle;
		this.reportDate = reportDate;
		this.reportContent = reportContent;
		this.reportOriginalFileName = reportOriginalFileName;
		this.reportRenameFileName = reportRenameFileName;
	}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}	

	public String getReportTitle() {
		return reportTitle;
	}

	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public String getReportOriginalFileName() {
		return reportOriginalFileName;
	}

	public void setReportOriginalFileName(String reportOriginalFileName) {
		this.reportOriginalFileName = reportOriginalFileName;
	}

	public String getReportRenameFileName() {
		return reportRenameFileName;
	}

	public void setReportRenameFileName(String reportRenameFileName) {
		this.reportRenameFileName = reportRenameFileName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Report [reportNo=" + reportNo + ", userNo=" + userNo + ", reportTitle="
				+ reportTitle + ", reportDate=" + reportDate + ", reportContent=" + reportContent
				+ ", reportOriginalFileName=" + reportOriginalFileName + ", reportRenameFileName="
				+ reportRenameFileName + "]";
	}	

}
