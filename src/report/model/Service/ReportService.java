package report.model.Service;

import report.model.ReportDao.ReportDao;
import report.model.vo.Report;
import static common.JDBCTemplate.*;

import java.sql.Connection;
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

}
