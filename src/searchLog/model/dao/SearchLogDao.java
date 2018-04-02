package searchLog.model.dao;


import java.sql.*;
import java.util.*;

import searchLog.model.vo.SearchLog;

import static common.JDBCTemplate.*;

public class SearchLogDao {	

	public SearchLogDao() {}

	public int insertlog(Connection con, SearchLog sl) {
		
		int result =0;
		PreparedStatement pstmt = null;		
		String query;
		
		if(sl.getUserNo() != 0) {
		query="insert into SEARCH_LOG values( (SELECT max(search_no) from SEARCH_LOG)+1 , ? , ? , sysdate)";
		} else {
		query="insert into SEARCH_LOG values( (SELECT max(search_no) from SEARCH_LOG)+1 , null , ? ,sysdate)";
		}
	
	try {
		pstmt=con.prepareStatement(query);		
		pstmt.setString(1,sl.getSearchContent());		
		result=pstmt.executeUpdate(); 
		System.out.println(result);
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		close(pstmt);
	}
		return result;
	}	
}














