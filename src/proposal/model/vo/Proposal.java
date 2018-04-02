package proposal.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Proposal implements Serializable{
	
	private static final long serialVersionUID = 6000L;
	private int proposalNo;
	private int userNo;
	private int userTypeNo;
	private String proposalTitle;
	private Date proposalDate;
	private String proposalContent;
	private String proposalOriginalFileName;
	private String proposalRenameFileName;
	
	public Proposal() {
		
	}

	public Proposal(int proposalNo, int userNo, int userTypeNo, String proposalTitle, Date proposalDate,
			String proposalContent, String proposalOriginalFileName, String proposalRenameFileName) {
		super();
		this.proposalNo = proposalNo;
		this.userNo = userNo;
		this.userTypeNo = userTypeNo;
		this.proposalTitle = proposalTitle;
		this.proposalDate = proposalDate;
		this.proposalContent = proposalContent;
		this.proposalOriginalFileName = proposalOriginalFileName;
		this.proposalRenameFileName = proposalRenameFileName;
	}

	public int getProposalNo() {
		return proposalNo;
	}

	public void setProposalNo(int proposalNo) {
		this.proposalNo = proposalNo;
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

	public String getProposalTitle() {
		return proposalTitle;
	}

	public void setProposalTitle(String proposalTitle) {
		this.proposalTitle = proposalTitle;
	}

	public Date getProposalDate() {
		return proposalDate;
	}

	public void setProposalDate(Date proposalDate) {
		this.proposalDate = proposalDate;
	}

	public String getProposalContent() {
		return proposalContent;
	}

	public void setProposalContent(String proposalContent) {
		this.proposalContent = proposalContent;
	}

	public String getProposalOriginalFileName() {
		return proposalOriginalFileName;
	}

	public void setProposalOriginalFileName(String proposalOriginalFileName) {
		this.proposalOriginalFileName = proposalOriginalFileName;
	}

	public String getProposalRenameFileName() {
		return proposalRenameFileName;
	}

	public void setProposalRenameFileName(String proposalRenameFileName) {
		this.proposalRenameFileName = proposalRenameFileName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Proposal [proposalNo=" + proposalNo + ", userNo=" + userNo + ", userTypeNo=" + userTypeNo
				+ ", proposalTitle=" + proposalTitle + ", proposalDate=" + proposalDate + ", proposalContent="
				+ proposalContent + ", proposalOriginalFileName=" + proposalOriginalFileName
				+ ", proposalRenameFileName=" + proposalRenameFileName + "]";
	}
	
	

}
