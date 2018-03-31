package seach_log.model.dao;


import java.sql.*;
import java.util.ArrayList;

import seach_log.model.vo.Seach_log;

import static common.JDBCTemplate.*;

public class Seach_logDao {
	

	public Seach_logDao() {}

	public int insertlog(Connection con, Seach_log sl) {
		int result =0;
		 PreparedStatement pstmt = null;
		 ResultSet rset=null;
		String query;
		if(sl.getUSER_NO()!=null) 
		{
		query="insert into SEARCH_LOG values( (SELECT max(search_no) from SEARCH_LOG)+1 , ? , ? , sysdate)";
		}else
		{
		query="insert into SEARCH_LOG values( (SELECT max(search_no) from SEARCH_LOG)+1 , null , ? ,sysdate)";
		}
	
	try {
		pstmt=con.prepareStatement(query);
//	if(sl.getUSER_NO()!=null) {
//		pstmt.setInt(1,sl.getUSER_NO());
//		pstmt.setString(2,sl.getSEACH_CONTENT());
//		}else{
		
		pstmt.setString(1,sl.getSEACH_CONTENT());
//	    }
		System.out.println("dfd");
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














