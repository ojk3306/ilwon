package searchLog.model.service;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.sql.Date;
import java.util.*;

import searchLog.model.vo.SearchLog;
import users.model.vo.NewestLessonByAdmin;
import users.model.vo.Users;
import searchLog.model.dao.SearchLogDao;

public class SearchLogService {
	
	public int ArrayList;

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
//		검색결과가 5개가 안됫을시, 다른것을 추가로 넣는다.
//		if(al.size()<5) {
//			Connection con1 = getConnection();
//		    ArrayList<String> al1=new SearchLogDao().Searchlog2(con1,al,sl);
//			close(con);
//			
//			return al1;
//		}
		/*System.out.println("al : " + al + " / (To.SearchLogService)");*/
		return al;
	}
	
		public ArrayList<String> realTimeList(){
			Connection con = getConnection();
			ArrayList<String> list=new ArrayList<String>();
			list=new SearchLogDao().realTimeLog(con,list);
			close(con);
			return list;
			
		}
		
		public ArrayList<NewestLessonByAdmin> newestLessonList(){
			Connection connn = getConnection();
			ArrayList<NewestLessonByAdmin> list=new ArrayList<NewestLessonByAdmin>();
			list=new SearchLogDao().newstLessonLog(connn,list);
			return list;
			
		}

		public ArrayList<String> getSearchhistroy(int parseInt) {
			Connection con = getConnection();
			ArrayList<String>  list = new SearchLogDao().getSearchhistroy(con,parseInt);
			close(con);
			return list;
		}
		
		public ArrayList<String> getUserLessonSeminaNumbers(){
			Connection con = getConnection();
			ArrayList<String> list=new ArrayList<String>();
			list = new SearchLogDao().getNumbers(con,list);
			close(con);
			return list;
			
		}
		
		public ArrayList<Users> getNewUsers(){
			Connection con = getConnection();
			ArrayList<Users> list=new ArrayList<Users>();
			list = new SearchLogDao().newUsers(con,list);
			close(con);
			return list;
		
		
	}



}






