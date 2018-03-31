package seach_log.model.dao;

import java.io.FileReader;
import java.sql.*;
import java.util.ArrayList;

import seach_log.model.vo.Seach_log;

import static common.JDBCTemplate.*;

public class Seach_logDao {
	private PreparedStatement pstmt;
	private ResultSet rset;

	public Seach_logDao() {}

	public int insertlog(Connection con, Seach_log sl) {
		int result =0;
		pstmt=null;
		String query;
		if(sl.getUSER_NO()!=null) {
		query="insert into SEARCH_LOG values((SELECT max(search_no)+1 from SEARCH_LOG),?,?,sysdate)";
		}else {
		query="insert into SEARCH_LOG values((SELECT max(search_no)+1 from SEARCH_LOG),null ,?, sysdate )";
		}
		System.out.println("서치 dao 중단옴");
	try {
		pstmt=con.prepareStatement(query);
		if(sl.getUSER_NO()!=null) {
		pstmt.setInt(1,sl.getUSER_NO());
		pstmt.setString(2,sl.getSEACH_CONTENT());
		}else {
		pstmt.setString(1,sl.getSEACH_CONTENT());
		}
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














