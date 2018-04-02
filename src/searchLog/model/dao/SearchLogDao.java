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
		if(sl.getUserNo() != null) {
		query="insert into SEARCH_LOG values( (SELECT max(search_no) from SEARCH_LOG)+1 , ? , ? , sysdate)";
		} else {
		query="insert into SEARCH_LOG values( (SELECT max(search_no) from SEARCH_LOG)+1 , null , ? ,sysdate)";
		System.out.println("유저의 정보가없음");
		System.out.println(sl.getSearchContent());
		}
	
	try {
		pstmt=con.prepareStatement(query);	
		if(sl.getUserNo() != null) {
			pstmt.setInt(1,sl.getUserNo());
			pstmt.setString(2,sl.getSearchContent());
		}else {
			pstmt.setString(1,sl.getSearchContent());	
		}

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
		ArrayList<String> al=null;
		PreparedStatement pstmt = null;		
		ResultSet rset=null;
		String query="";
		
		if(sl.getUserNo() == null) {
			query="select SEACH_CONTENT , count(SEACH_CONTENT) from SEARCH_LOG where SEACH_CONTENT like ? group by SEACH_CONTENT";
		}else {
		//	query="select SEACH_CONTENT , count(SEACH_CONTENT) from SEARCH_LOG where SEACH_CONTENT like '%a%' and user_no = 3 group by SEACH_CONTENT";
		}
		try {
		pstmt=con.prepareStatement(query);
		pstmt.setString(1,"%"+sl.getSearchContent()+"%");
		rset=pstmt.executeQuery();
		while(rset.next())
		{
			al=new ArrayList<String>();
			al.add(rset.getString("SEACH_CONTENT"));	
			
		};		
		
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return al;
	}	
}














