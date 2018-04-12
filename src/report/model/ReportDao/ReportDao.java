package report.model.ReportDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import proposal.model.vo.Proposal;
import report.model.vo.Report;
import static common.JDBCTemplate.*;
public class ReportDao {

	public int insertReport(Connection con, Report repo) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="insert into REPORT values((select max(REPORT_NO)+1 from REPORT),?,?,sysdate,?,?,?)";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, repo.getUserNo());
			pstmt.setString(2,repo.getReportTitle());
			pstmt.setString(3, repo.getReportContent());
			if(repo.getReportOriginalFileName()!=null) {
			pstmt.setString(4, repo.getReportOriginalFileName());
			pstmt.setString(5, repo.getReportRenameFileName());
			}else {
			pstmt.setString(4,"");
			pstmt.setString(5,"");	
			}
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		
		
		return result;
	}

	public int getlistcount(Connection con) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql="select count(*) from REPORT";
		int result=0;
		try {
			pstmt=con.prepareStatement(sql);
			rset=pstmt.executeQuery();
			result=rset.getInt(1);
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	

	public int getlistcountBySearch(Connection con, String search, int seachOption) {
		
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql="select count(*) from REPORT where ";
		int result=0;
		switch (seachOption) {
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
			pstmt.setString(1,search);
			rset=pstmt.executeQuery();
			result=rset.getInt(1);
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Report> getprolist(Connection con, int limit, int currentPage) {
		ArrayList<Report> ar=new ArrayList<Report>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Report re=null;
		int startRow = (currentPage - 1) * limit + 1; 
		int endRow = startRow + limit - 1;
		String sql="select * from (select ROWNUM AS RNUM, A.* FROM (SELECT * FROM PROPOSAL ORDER BY proposal_date desc) A WHERE ROWNUM < ? ) WHERE RNUM >= ? ORDER BY PROPOSAL_DATE DESC ";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, endRow);
			pstmt.setInt(2, startRow);
			rset=pstmt.executeQuery();
			while(rset.next()) {
			re =new  Report();
			re.setReportContent(rset.getString("REPORT_CONTENT"));
			re.setReportDate(rset.getDate("REPORT_DATE"));
			re.setReportNo(rset.getInt("REPORT_NO"));
			re.setReportOriginalFileName(rset.getString("REPORT_ORIGINAL_FILENAME"));
			re.setReportRenameFileName(rset.getString("REPORT_RENAME_FILENAME"));
			re.setReportTitle(rset.getString("REPORT_TITLE"));
			re.setUserNo(rset.getInt("USER_NO"));
		
			ar.add(re);
			}
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
		close(rset);
		close(pstmt);
		}
		
		return ar;
	}
}
