package proposal.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import proposal.model.vo.Proposal;

import static common.JDBCTemplate.*;
public class ProposalDao {

	public int getlistcount(Connection con, int serchoption) {
	PreparedStatement pstmt=null;
	ResultSet rset=null;
	
	int result=0;
	String sql="select count(*) from PROPOSAL order by PROPOSAL_DATE desc"; 
	
	
	try {
	pstmt=con.prepareStatement(sql);
	rset=pstmt.executeQuery();
	if(rset.next()) {
	result=rset.getInt(1);	
	}
	
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}finally {
		close(con);
	}
	return result;
	}

	public ArrayList<Proposal> getprolist(Connection con, int limit, int currentPage) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Proposal pro=null;
		ArrayList<Proposal> plist=new ArrayList<Proposal>();
		int startRow = (currentPage - 1) * limit + 1; 
		int endRow = startRow + limit - 1;
		String sql="select * from (select ROWNUM AS RNUM, A.* FROM   (SELECT * FROM PROPOSAL ORDER BY proposal_date desc) A WHERE ROWNUM < ? ) WHERE RNUM >= ? ORDER BY PROPOSAL_DATE DESC ";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			rset=pstmt.executeQuery();
			while(rset.next()) {
			pro=new Proposal();
			pro.setProposalContent(rset.getString("PROPOSAL_CONTENT"));
			pro.setProposalDate(rset.getDate("PROPOSAL_DATE"));
			pro.setProposalhit(rset.getInt("PROPOSA_HIT"));
			pro.setProposalNo(rset.getInt("PROPOSAL_NO"));
			pro.setProposalTitle(rset.getString("PROPOSAL_TITLE"));
			pro.setUserNo(rset.getInt("USER_NO"));
			System.out.println(pro.toString());
			plist.add(pro);
			}
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
		close(rset);
		close(pstmt);
		}
		
		return plist;
	}

	public int getlistcountBySearch(Connection con, String search, int searchoption) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		
		int result=0;
		String sql="";
		
		switch (searchoption) {
		case 1://제목
			sql="select count(*) from PROPOSAL where PROPOSAL_TITLE like ?";
			break;
		case 2://내용
			sql="select count(*) from PROPOSAL where PROPOSAL_CONTENT like ?";
			break;
		case 3://작성자
			sql="select count(*) from PROPOSAL where USER_NO = (select USER_NO from USERS where USER_NAME like ? )  ";
			break;	
		}

		try {
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,"%"+search+"%");
		rset=pstmt.executeQuery();
		if(rset.next()) {
		result=rset.getInt(1);	
		}
		
		} catch (Exception e) {

			e.printStackTrace();
		}finally {
			close(con);
		}
		return result;
	}

	public ArrayList<Proposal> getprolistBysearch(Connection con, int limit, int currentPage, String search,int seachOption) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Proposal pro=null;
		ArrayList<Proposal> plist=new ArrayList<Proposal>();
		int startRow = (currentPage - 1) * limit + 1; 
		int endRow = startRow + limit - 1;
		String sql="";
		switch (seachOption) {
		case 1://제목
			sql="select * from (select ROWNUM AS RNUM, A.* FROM   (SELECT * FROM PROPOSAL where PROPOSAL_TITLE like ? ORDER BY proposal_date desc) A WHERE ROWNUM < ? ) WHERE RNUM >= ? ORDER BY PROPOSAL_DATE DESC ";
			break;
		case 2://내용
			sql="select * from (select ROWNUM AS RNUM, A.* FROM   (SELECT * FROM PROPOSAL where PROPOSAL_CONTENT like ? ORDER BY proposal_date desc) A WHERE ROWNUM < ? ) WHERE RNUM >= ? ORDER BY PROPOSAL_DATE DESC ";
			break;
		case 3://작성자
			sql="select * from (select ROWNUM AS RNUM, A.* FROM   (SELECT * FROM PROPOSAL where USER_NO in (select USER_NO from users where USER_NAME like ? ORDER BY proposal_date desc) ) A WHERE ROWNUM < ? ) WHERE RNUM >= ? ORDER BY PROPOSAL_DATE DESC ";
			break;	
		}
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,"%"+search+"%");
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, startRow);
			rset=pstmt.executeQuery();
		while(rset.next()) {
			pro=new Proposal();
			pro.setProposalContent(rset.getString("PROPOSAL_CONTENT"));
			pro.setProposalDate(rset.getDate("PROPOSAL_DATE"));
			pro.setProposalhit(rset.getInt("PROPOSA_HIT"));
			pro.setProposalNo(rset.getInt("PROPOSAL_NO"));
			pro.setProposalTitle(rset.getString("PROPOSAL_TITLE"));
			pro.setUserNo(rset.getInt("USER_NO"));
			System.out.println(pro.toString());
			plist.add(pro);
		}
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
		close(rset);
		close(pstmt);
		}
		
		return plist;
	
	}

	public int insertproposal(Connection con, Proposal pro) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql="insert into PROPOSAL values((select max(PROPOSAL_NO)+1 from PROPOSAL),?,0,?,sysdate,?)";
		
		if(pro.getUserNo()==null)
		sql="insert into PROPOSAL values((select max(PROPOSAL_NO)+1 from PROPOSAL),'',0,?,sysdate,?)";
		
		try {
			pstmt=con.prepareStatement(sql);
			
			if(pro.getUserNo()!=null) {
			pstmt.setInt(1, pro.getUserNo());
			pstmt.setString(2, pro.getProposalTitle());
			pstmt.setString(3, pro.getProposalContent());
			}else {
				pstmt.setString(1, pro.getProposalTitle());
				pstmt.setString(2, pro.getProposalContent());
			}
			
			
			
			result=pstmt.executeUpdate();
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
		close(pstmt);
		}
		return result;
	}

	public Proposal getproposaldetail(Connection con, int parseInt) {
		Proposal pro=null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql="select * from PROPOSAL where PROPOSAL_NO = ?";		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,parseInt);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				pro=new Proposal();
				pro.setProposalContent(rset.getString("PROPOSAL_CONTENT"));
				pro.setProposalDate(rset.getDate("PROPOSAL_DATE"));
				pro.setProposalhit(rset.getInt("PROPOSA_HIT"));
				pro.setProposalNo(rset.getInt("PROPOSAL_NO"));
				pro.setProposalTitle(rset.getString("PROPOSAL_TITLE"));
				pro.setUserNo(rset.getInt("USER_NO"));
				System.out.println(pro.toString());	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
		return pro;
	}

	public int updatehitProposal(Connection con, int proposalNo) {
	PreparedStatement pstmt=null;
	int result=0;
	String sql="update proposal set PROPOSA_HIT = (select max(PROPOSA_HIT)+1 from proposal where PROPOSAL_NO=?) where PROPOSAL_NO = ? ";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,proposalNo);
			pstmt.setInt(2,proposalNo);
			result=pstmt.executeUpdate();
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public Proposal findProposal(Connection con, int parseInt) {
		Proposal pro=null;
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql="select * from proposal where PROPOSAL_NO=? ";
			
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,parseInt);
			
			rset=pstmt.executeQuery();
			if(rset.next()) {
				pro=new Proposal();
				pro.setProposalContent(rset.getString("PROPOSAL_CONTENT"));
				pro.setProposalDate(rset.getDate("PROPOSAL_DATE"));
				pro.setProposalhit(rset.getInt("PROPOSA_HIT"));
				pro.setProposalNo(rset.getInt("PROPOSAL_NO"));
				pro.setProposalTitle(rset.getString("PROPOSAL_TITLE"));
				pro.setUserNo(rset.getInt("USER_NO"));
				System.out.println(pro.toString());
			}
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
		close(pstmt);
		}
		return pro;
	}

	public int updateProposal(Connection con, int parseInt, String parameter, String parameter2) {
		int result=0;
		System.out.println(parseInt);
		System.out.println(parameter);
		System.out.println(parameter2);
		PreparedStatement pstmt=null;
		String sql="update proposal set PROPOSAL_TITLE =? , PROPOSAL_CONTENT = ? where PROPOSAL_NO=?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, parameter);
			pstmt.setString(2, parameter2);
			pstmt.setInt(3,parseInt);
			
			
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
		close(pstmt);
		}
		
		
		
		return result;
	}

}
