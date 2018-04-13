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
			rset.next();
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
			sql="select count(*) from REPORT where REPORT_TITLE like ?";
			break;
		case 2://내용
			sql="select count(*) from REPORT where REPORT_CONTENT like ?";
			break;
		case 3://작성자
			sql="select count(*) from REPORT where USER_NO = (select USER_NO from USERS where USER_NAME like ? )  ";
			break;	
		}
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,search);
			rset=pstmt.executeQuery();
			rset.next();
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
		String sql="select * from (select ROWNUM AS RNUM, A.* FROM (SELECT * FROM REPORT ORDER BY REPORT_DATE desc) A WHERE ROWNUM < ? ) WHERE RNUM >= ? ORDER BY REPORT_DATE DESC ";
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
			System.out.println(re.toString());

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

	public ArrayList<Report> getprolist(Connection con, int limit, int currentPage, String search, int seachOption) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Report re=null;
		ArrayList<Report> ar=new ArrayList<Report>();
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
				re =new  Report();
				re.setReportContent(rset.getString("REPORT_CONTENT"));
				re.setReportDate(rset.getDate("REPORT_DATE"));
				re.setReportNo(rset.getInt("REPORT_NO"));
				re.setReportOriginalFileName(rset.getString("REPORT_ORIGINAL_FILENAME"));
				re.setReportRenameFileName(rset.getString("REPORT_RENAME_FILENAME"));
				re.setReportTitle(rset.getString("REPORT_TITLE"));
				re.setUserNo(rset.getInt("USER_NO"));
				System.out.println(re.toString());
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

	public Report getReportDetail(Connection con, int parseInt) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Report re=null;
		String sql="select * from REPORT where REPORT_NO=?";
		int result=0;
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,parseInt);
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
				System.out.println(re.toString());
			
				}
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return re;
	}
}
