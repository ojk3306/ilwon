package report.model.ReportDao;

import java.sql.Connection;
import java.sql.PreparedStatement;

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

}
