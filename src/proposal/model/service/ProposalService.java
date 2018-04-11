package proposal.model.service;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import proposal.model.dao.ProposalDao;
import proposal.model.vo.Proposal;
public class ProposalService {

	public int getlistcount(int serchoption) {
		int result=0;
		Connection con=getConnection();
		result=new ProposalDao().getlistcount(con,serchoption);
		close(con);
	 return result;
	}

	public int getlistcountBySearch(String search, int searchoption) {
		int result=0;
		Connection con=getConnection();
		result=new ProposalDao().getlistcountBySearch(con,search,searchoption);
		close(con);
		 return result;
	}

	public ArrayList<Proposal> getprolist(int limit, int currentPage) {
		
		Connection con=getConnection();
		ArrayList<Proposal> pro=new ProposalDao().getprolist(con,limit,currentPage);
		close(con);
		return pro;
	}

	public ArrayList<Proposal> getprolistBysearch(int limit, int currentPage, String search, int seachOption) {
		Connection con=getConnection();
		ArrayList<Proposal> pro =new ProposalDao().getprolistBysearch(con,limit,currentPage,search,seachOption);
		close(con);
		return pro;
	}

	public int insertproposal(Proposal pro) {
		Connection con=getConnection();
		int result=new ProposalDao().insertproposal(con,pro);
		if(result>0)
			commit(con);
		else
			rollback(con);
		
		return result;
	}

	public Proposal getproposaldetail(int parseInt) {
		Connection con=getConnection();
		Proposal pro=new ProposalDao().getproposaldetail(con,parseInt);
		
		close(con);
		return pro;
	}

	public int updatehitProposal(int proposalNo) {
		Connection con=getConnection();
		int result=new ProposalDao().updatehitProposal(con,proposalNo);
		if(result>0)
			commit(con);
		else
			rollback(con);
		close(con);
		
		return result;
	}

	public Proposal findProposal(int parseInt) {
		Connection con=getConnection();
		Proposal result=new ProposalDao().findProposal(con,parseInt);
				
		return result;
	}

	public int updateProposal(int parseInt, String parameter, String parameter2) {
		Connection con=getConnection();
		int result=new ProposalDao().updateProposal(con,parseInt,parameter,parameter2);
		if(result>0)
			commit(con);
		else
			rollback(con);
		close(con);
		
		return result;
	}

	public int deleteProposal(String parameter) {
		Connection con=getConnection();
		int result=new ProposalDao().deleteProposal(con,parameter);
		if(result>0)
			commit(con);
		else
			rollback(con);
		close(con);
		
		return result;
	}

}
