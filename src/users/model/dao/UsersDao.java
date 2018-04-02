package users.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import static common.JDBCTemplate.*;

import users.model.vo.Users;

public class UsersDao {
	
	
	public UsersDao() {
		
	}
	
	public Users loginCheck(Connection con, String userId, String userPwd) {
		Users loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from users where user_email= ? "
				+ "and user_pwd = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Users();
				
				loginUser.setUserEmail(rset.getString("user_email"));
				loginUser.setUserPassword(rset.getString("user_pwd"));
				loginUser.setUserName(rset.getString("user_name"));
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;		
	}

	public int checkEmail(Connection con, String email) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select user_email from users where user_email = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result++;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int insertUsers(Connection con, Users user) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = "insert into users values((SELECT max(user_no) from users)+1,?,?,?,?,?,?,?,?,'','','5','Y','Y','3',sysdate)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, user.getUserTypeNo());
			pstmt.setString(2, user.getUserEmail());
			pstmt.setString(3, user.getUserPassword());
			pstmt.setString(4, user.getUserName());
			pstmt.setString(5, user.getUserGender());
			pstmt.setInt(6, user.getUserAge());
			pstmt.setString(7, user.getUserLoc());
			pstmt.setString(8, user.getUserPhone());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
		
	}

	
	
	
	
	
}
