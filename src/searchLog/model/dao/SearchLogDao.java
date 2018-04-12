package searchLog.model.dao;


import java.sql.*;
import java.util.*;

import searchLog.model.vo.SearchLog;
import users.model.vo.Users;

import static common.JDBCTemplate.*;

public class SearchLogDao {	

	public SearchLogDao() {
		
	}

	public int insertLog(Connection con, SearchLog sl) {
		
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
		
//	System.out.println(sl.toString() + " / (To.SearchLogDao)");
	
		try {
			pstmt=con.prepareStatement(query);	
		
			if(sl.getUserNo() != null) {
				pstmt.setInt(1,sl.getUserNo());
				pstmt.setString(2,sl.getSearchContent());
			
			} else {
				pstmt.setString(1,sl.getSearchContent());			
			}
			result=pstmt.executeUpdate(); 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
			return result;
	}

	public ArrayList<String> searchLog(Connection con, SearchLog sl) {
		
		ArrayList<String> al=new ArrayList<String>();
		PreparedStatement pstmt = null;		
		ResultSet rset=null;
		
		String query="";
		int row=0;
		
		if(sl.getUserNo() == null) {
			query="select SEACH_CONTENT , count(SEACH_CONTENT) from SEARCH_LOG where SEACH_CONTENT like ? group by SEACH_CONTENT order by count(SEACH_CONTENT) desc";
		} else {
			query="select SEACH_CONTENT , count(SEACH_CONTENT) from SEARCH_LOG where SEACH_CONTENT like ? and user_no = ? group by SEACH_CONTENT order by count(SEACH_CONTENT) desc";
		}
		
		try {			
			pstmt=con.prepareStatement(query);
			
			if(sl.getUserNo() == null) {
				//비로그인시
				pstmt.setString(1,"%"+sl.getSearchContent()+"%");	
				rset=pstmt.executeQuery();				
				
				while(row<5) {
					rset.next();
					al.add(rset.getString("SEACH_CONTENT"));
					row++;
					};
					
			} else {
				//회원
				pstmt.setString(1,"%"+sl.getSearchContent()+"%");
				pstmt.setInt(2, sl.getUserNo());
				
				rset=pstmt.executeQuery();
				
				int j=0;
				
				while(j<5) {
						
					if(rset.next()) {
							
						al.add(rset.getString("SEACH_CONTENT"));
						/*System.out.println("al.size : "+al.size() + " / (To.SearchLogDao)");*/
						row++;
					}						
				j++;					
				};
			} // else문 끝
			
		} catch(java.sql.SQLException e1) {
			System.out.println("SearchLogData Loading Complete / (To.SearchLogDao)");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {			
			close(rset);			
			close(pstmt);		
		}
		/*System.out.println("al : " + al + " / (To.SearchLogDao)");*/
		return al;
	}

	public ArrayList<String> searchLog2(Connection con, ArrayList<String> al, SearchLog sl) {
		PreparedStatement pstmt = null;		
		ResultSet rset=null;
		
		String query="select SEACH_CONTENT , count(SEACH_CONTENT) from SEARCH_LOG where SEACH_CONTENT like ? and user_no is null group by SEACH_CONTENT order by count(SEACH_CONTENT) desc";

		try {
			pstmt=con.prepareStatement(query);
			
			pstmt.setString(1,"%"+sl.getSearchContent()+"%");
			rset=pstmt.executeQuery();		
			
			while(al.size()<6) {				
				rset.next();				
				al.add(rset.getString("SEACH_CONTENT"));				
			};		
	
		} catch (java.sql.SQLException e) {		
			System.out.println("SearchLogData Loading Complete / (To.SearchLogDao)");		
		} catch(Exception e1) {
			e1.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		return al;
	}
	
	
	public ArrayList<String> realTimeLog(Connection con,ArrayList<String> list){
		PreparedStatement pstmt = null;		
		ResultSet rset=null;
		
		String query="select SEACH_CONTENT from SEArCH_LOG group by seach_content order by count(seach_content) desc";
		try {
			pstmt=con.prepareStatement(query);
			rset=pstmt.executeQuery();		
			
			while(list.size()<5) {				
				rset.next();				
				list.add(rset.getString("SEACH_CONTENT"));		
				System.out.println(rset.getString("SEACH_CONTENT"));
			};		
	
		} catch (java.sql.SQLException e) {		
			System.out.println("SearchLogData Loading Complete / (To.SearchLogDao)");		
		} catch(Exception e1) {
			e1.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		return list;
		
	}

	public ArrayList<String> getSearchhistroy(Connection con, int parseInt) {
		
		ArrayList<String> list =new ArrayList<String>();
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql = "select SEACH_CONTENT from search_log where user_no =?  group by SEACH_CONTENT order by count(seach_content) desc";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,parseInt);
			rset=pstmt.executeQuery();
			while(rset.next()) {
				list.add(rset.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
	return list;
	}
	
	

	public ArrayList<String> getNumbers(Connection con, ArrayList<String> list) {
		PreparedStatement pstmt = null;		
		ResultSet rset=null;
		
		String query="select (select count(USER_NO) from users),(select count(LESSON_NO) from lesson),(select count(SEMINA_NO) from semina) from dual";
		
		try {
			pstmt=con.prepareStatement(query);
			rset=pstmt.executeQuery();		
			
		rset.next();	
		String user=rset.getString(1);
		String lesson=rset.getString(2);
		String semina=rset.getString(3);
		System.out.println(user+" "+lesson+" "+semina);
		
		list.add(user);
		list.add(lesson);
		list.add(semina);
		
		} catch (java.sql.SQLException e) {		
			System.out.println("SearchLogData Loading Complete / (To.SearchLogDao)");		
		} catch(Exception e1) {
			e1.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		return list;
	}
	
	public ArrayList<Users> newUsers(Connection con,ArrayList<Users> list){
		PreparedStatement pstmt = null;		
		ResultSet rset=null;
		
		String query="select USER_EMAIL,USER_NAME,USER_ENROLLDATE from users order by user_enrolldate desc";
		try {
			pstmt=con.prepareStatement(query);
			rset=pstmt.executeQuery();	
			while(rset.next()) {
			Users u = new Users();
			u.setUserEmail(rset.getString(1));
			u.setUserName(rset.getString(2));
			u.setUserEnrollDate(rset.getDate(3));
			list.add(u);
			}
			
		} catch (java.sql.SQLException e) {		
			System.out.println("SearchLogData Loading Complete / (To.SearchLogDao)");		
		} catch(Exception e1) {
			e1.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		return list;
		
	}

}














