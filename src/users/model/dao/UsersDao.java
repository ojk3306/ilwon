package users.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

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
				loginUser.setUserNo(rset.getInt("USER_NO"));
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

	public ArrayList<Users> seachUserByAdmin(Connection con, Users user, String seach, int seachOption) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Users> al=null;
		String query="";
		System.out.println("seach="+seach+"\tseachOption="+seachOption);
		/*
		 * <option value="1">모든설정으로검색(무관)</option>
                  	 <option value="2">이름으로검색</option>
                  	 <option value="3">이메일로검색</option>
                  	 <option value="4">현상태로검색</option>
                  	 <option value="5">나이로 검색 (오차한계 2살) </option>
                  	 <option value="6">성별로검색</option>
                  	 <option value="7">주소로검색</option>
                  	 <option value="8">전화번호로검색</option>
		 * 
		 * 
		 * */
		if(seachOption==1) {
			//모든 설정으로 검색.
			query="select * from users where user_type like ? and (USER_EMAIL like ? or USER_NAME like ? or USER_GENDER like ? or USER_AGE like ? or USER_LOC like ? or USER_PHONE  like ?) ";
		}else if(seachOption==2) {
			//이름으로 검색
			query="";
		}else if(seachOption==3) {
			//이메일로 검색.
			query="";
		}else if(seachOption==4) {
			//현재 정상인지,차단인지로 검색.
			query="";
		}else if(seachOption==5) {
			//나이로 검색 (오차한계 2살)
			query="";
		}else if(seachOption==6) {
			//성별로검색
			query="";
		}else if(seachOption==7) {
			//주소로검색
			query="";
		}else if(seachOption==8) {
			//전화번호로검색
			query="";
		}
			
		try {
			if(seachOption==1) {
			pstmt=con.prepareStatement(query);
			pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
			pstmt.setString(2,"%"+seach+"%");
			pstmt.setString(3,"%"+seach+"%");
			pstmt.setString(4,"%"+seach+"%");
			pstmt.setString(5,"%"+seach+"%");
			pstmt.setString(6,"%"+seach+"%");
			pstmt.setString(7,"%"+seach+"%");
			}else if(seachOption==2) {
				//이름으로 검색
				query="";
			}else if(seachOption==3) {
				//이메일로 검색.
				query="";
			}else if(seachOption==4) {
				//현재 정상인지,차단인지로 검색.
				query="";
			}else if(seachOption==5) {
				//나이로 검색 (오차한계 2살)
				query="";
			}else if(seachOption==6) {
				//성별로검색
				query="";
			}else if(seachOption==7) {
				//주소로검색
				query="";
			}else if(seachOption==8) {
				//전화번호로검색
				query="";
			}
			
			
			rset=pstmt.executeQuery();
			while(rset.next()) {
				
			}
			
			
		}catch (Exception e) {
		e.printStackTrace();
		
		}finally {
			
		}		
		
		return al;
	}

	
	
	
	
	
}
