package searchLog.model.service;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.*;

import searchLog.model.vo.SearchLog;
import searchLog.model.dao.SearchLogDao;

public class SearchLogService {
	
	public SearchLogService() {
		
	}
	
	public int insertlog(SearchLog sl) {
		Connection con = getConnection();
		int result = new SearchLogDao().insertLog(con,sl);
		System.out.println("result : " + result + " / (To.SearchLogService)");
		if(result>0)
			commit(con);
		else 
			rollback(con);
		close(con);
		return result;
	}

	public ArrayList<String> searchLog(SearchLog sl) {
		Connection con = getConnection();
		ArrayList<String> al = new SearchLogDao().searchLog(con,sl);
		close(con);
//		if(al.size()<5) {
//			Connection con1 = getConnection();
//		    ArrayList<String> al1=new SearchLogDao().Searchlog2(con1,al,sl);
//			close(con);
//			
//			return al1;
//		}
		System.out.println("al : " + al + " / (To.SearchLogService)");
		return al;
	}

}








