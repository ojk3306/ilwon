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
			//로그인시
		query="insert into SEARCH_LOG values( (SELECT max(search_no) from SEARCH_LOG)+1 , ? , ? , sysdate)";
		} else {
			//비로그인
		query="insert into SEARCH_LOG values( (SELECT max(search_no) from SEARCH_LOG)+1 , null , ? ,sysdate)";
		}
	System.out.println(sl.toString());
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
		ArrayList<String> al=new ArrayList<String>();
		PreparedStatement pstmt = null;		
		ResultSet rset=null;
		String query="";
		
		if(sl.getUserNo() == null) {
		query="select SEACH_CONTENT , count(SEACH_CONTENT) from SEARCH_LOG where SEACH_CONTENT like ? group by SEACH_CONTENT order by count(SEACH_CONTENT) desc";
		}else {
		query="select SEACH_CONTENT , count(SEACH_CONTENT) from SEARCH_LOG where SEACH_CONTENT like ? and user_no = ? group by SEACH_CONTENT order by count(SEACH_CONTENT) desc";
		}
		try {
			pstmt=con.prepareStatement(query);
			if(sl.getUserNo() == null) {
				pstmt.setString(1,"%"+sl.getSearchContent()+"%");	
			}else {
				pstmt.setString(1,"%"+sl.getSearchContent()+"%");
				pstmt.setInt(2, sl.getUserNo());
			}	
			
			rset=pstmt.executeQuery();
		int i=0;
	while(i<5)
		{rset.next();
		al.add(rset.getString("SEACH_CONTENT"));
		i++;
		};
		
		}catch(java.sql.SQLException e){
		
		System.out.println("본에러는 무시해도됨.");
		}catch(Exception e1) {
			e1.printStackTrace();
		}finally {
			
		close(rset);
			
		close(pstmt);
		}
		return al;
	}	
}














