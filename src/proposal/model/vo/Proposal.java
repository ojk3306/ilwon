package proposal.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Proposal implements Serializable{
	
	private static final long serialVersionUID = 6000L;
	private int proposalNo;
	private Integer userNo;	
	private String proposalTitle;
	private String proposalContent;
	private Date proposalDate;
	private int proposalhit;
	public Proposal() {
		
	}
	public int getProposalNo() {
		return proposalNo;
	}
	public void setProposalNo(int proposalNo) {
		this.proposalNo = proposalNo;
	}
	public Integer getUserNo() {
		return userNo;
	}
	public void setUserNo(Integer userNo) {
		this.userNo = userNo;
	}
	public String getProposalTitle() {
		return proposalTitle;
	}
	public void setProposalTitle(String proposalTitle) {
		this.proposalTitle = proposalTitle;
	}
	public String getProposalContent() {
		return proposalContent;
	}
	public void setProposalContent(String proposalContent) {
		this.proposalContent = proposalContent;
	}
	public Date getProposalDate() {
		return proposalDate;
	}
	public void setProposalDate(Date proposalDate) {
		this.proposalDate = proposalDate;
	}
	public int getProposalhit() {
		return proposalhit;
	}
	public void setProposalhit(int proposalhit) {
		this.proposalhit = proposalhit;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Proposal(int proposalNo, int userNo, String proposalTitle, String proposalContent, Date proposalDate,
			int proposalhit) {
		super();
		this.proposalNo = proposalNo;
		this.userNo = userNo;
		this.proposalTitle = proposalTitle;
		this.proposalContent = proposalContent;
		this.proposalDate = proposalDate;
		this.proposalhit = proposalhit;
	}
	@Override
	public String toString() {
		return "Proposal [proposalNo=" + proposalNo + ", userNo=" + userNo + ", proposalTitle=" + proposalTitle
				+ ", proposalContent=" + proposalContent + ", proposalDate=" + proposalDate + ", proposalhit="
				+ proposalhit + "]";
	}

	
	
}
