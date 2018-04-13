package users.model.service;

import static common.JDBCTemplate.*;


import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import users.model.*;
import users.model.dao.UsersDao;
import users.model.vo.NewestLessonByAdmin;
import users.model.vo.Users;

public class UsersService {

	public UsersService() {
		
	}

	public Users loginCheck(String userId, String userPwd) {
		Connection con = getConnection();
		Users user = new UsersDao().loginCheck(con, userId, userPwd);
		close(con);
		return user;
	}
	
	public int checkEmail(String email) {
		Connection con = getConnection();
		int result = new UsersDao().checkEmail(con,email);
		close(con);
		return result;
	}

	public int insertUsers(Users user) {
		Connection con = getConnection();
		int result = new UsersDao().insertUsers(con,user);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}

	public ArrayList<Users> seachUserByAdmin(Users user, String seach, int seachOption,int limit, int currentPage) {
		
		 Connection con = getConnection();
		 
		 ArrayList<Users> al=new UsersDao().seachUserByAdmin(con,user,seach,seachOption,limit,currentPage);
		
		 close(con);
		
		 return al;
	}
	
	
	//태환
	

	//태환
	
	
	
	public int getListCount(Users user, String seach, int seachOption) {
		Connection con = getConnection();
		int listCount = new UsersDao().getListCount(con,user,seach,seachOption);
		close(con);
		return listCount;
	}

	public Users userDetailByAdmin(int i) {
		Connection con = getConnection();
		Users user=new UsersDao().userDetailByAdmin(con,i);
		close(con);

		return user;
	}

	public int adminUpdate(int userno, String value, int type) {
		Connection con = getConnection();
		int result= new UsersDao().adminupdate(con,userno,value,type);
	
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
			System.out.println("adminUpdate�꽌鍮꾩뒪 �떎�뙣");
		}
		
		close(con);
		
		return result;
	}

	public Users getUserinfofromsemina(int userNo) {
		Connection con = getConnection();
		Users user=new UsersDao().getUserinfofromsemina(con,userNo);
		close(con);			
		
		
		return user;
	}

	public Users getUserinfoFromproposal(Integer userNo) {
		Connection con = getConnection();
		Users user=new UsersDao().getUserinfofromsemina(con, userNo);
		close(con);			
		
		
		return user;
	}

	public int uploadProfile(Users user) {
		Connection conn = getConnection();
		
		int result = new UsersDao().uploadProfile(conn,user);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public Users updateLogin(int userNo) {
		Connection con = getConnection();
		Users user = new UsersDao().updateLogin(con, userNo);
		close(con);
		return user;
	}

	public String getUserImg(int userimg) {
		Connection con = getConnection();
		String result = new UsersDao().getUserImg(con, userimg);
		
		close(con);
		return result;
	}

	

	
	
	
	
	
}
