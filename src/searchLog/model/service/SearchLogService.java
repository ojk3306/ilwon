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
		int result = new SearchLogDao().insertlog(con,sl);
		System.out.println("reuslt="+result);
		if(result>0)
			commit(con);
		else 
			rollback(con);
		close(con);
		return result;
	}

}








