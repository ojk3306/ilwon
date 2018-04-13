package report.model.Service;

import report.model.ReportDao.ReportDao;
import report.model.vo.Report;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
public class ReportService {

	public int insertReport(Report repo) {
		Connection con=getConnection();
		
		int result=0;
		result=new ReportDao().insertReport(con,repo);
		if(result>0)
			commit(con);
		else
			rollback(con);
		close(con);
		
		
		return result;
	}

	public int getlistcountBySearch(String search, int seachOption) {
		Connection con=getConnection();
		
		int result=0;
		
		result=new ReportDao().getlistcountBySearch(con,search,seachOption);
	
		close(con);
		
		
		return result;
	}



	public int getlistcount() {
		int result=0;
		Connection con=getConnection();
		result=new ReportDao().getlistcount(con);
		close(con);
		return result;

	}

	public ArrayList<Report> getprolist(int limit, int currentPage) {
		Connection con=getConnection();
		ArrayList<Report> ar=new ReportDao().getprolist(con,limit,currentPage);
		close(con);
		return ar;
	}

	public ArrayList<Report> getprolistBysearch(int limit, int currentPage, String search, int seachOption) {
		Connection con=getConnection();
		ArrayList<Report> ar=new ReportDao().getprolist(con,limit,currentPage,search,seachOption);
		close(con);
		return ar;
	}

	public Report getReportDetail(String parameter) {
		Connection con=getConnection();
		Report re=new ReportDao().getReportDetail(con,Integer.parseInt(parameter));
		close(con);
		return re;
	}

}
