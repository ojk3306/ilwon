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
		System.out.println("sl.getUserNo()="+sl.getUserNo());
		if(sl.getUserNo() != null) {
		query="insert into SEARCH_LOG values( (SELECT max(search_no) from SEARCH_LOG)+1 , ? , ? , sysdate)";
		
		} else {
		query="insert into SEARCH_LOG values( (SELECT max(search_no) from SEARCH_LOG)+1 , null , ? ,sysdate)";
		System.out.println("일루오는건가?");
		}
	
	try {
		
		if(sl.getUserNo() != null) {
			pstmt.setInt(1,sl.getUserNo());
			pstmt.setString(2,sl.getSearchContent());
		}else {
			pstmt.setString(1,sl.getSearchContent());	
		}
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

	public ArrayList<String> Seachlog(Connection con, SearchLog sl) {
		int result =0;
		ArrayList<String> al=new ArrayList<String>();
		PreparedStatement pstmt = null;		
		String query;
		
		if(sl.getUserNo() == null) {
		query="select * from SEARCH_LOG where SEACH_CONTENT like '%a%'";

		}else {
		//	query=""
		}
		
		
		
		try {
			
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
			
		}
		
		
		return al;
	}	
}














