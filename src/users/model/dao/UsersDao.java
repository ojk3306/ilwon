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
				loginUser.setUserNo(rset.getInt("user_no"));
				loginUser.setUserTypeNo(rset.getInt("user_type"));
				loginUser.setUserGender(rset.getString("user_gender"));
				loginUser.setUserAge(rset.getInt("user_age"));
				loginUser.setUserLoc(rset.getString("user_loc"));
				loginUser.setUserPhone(rset.getString("user_phone"));
				loginUser.setUserOriginalPhoto(rset.getString("user_original_photo"));
				loginUser.setUserRenamePhoto(rset.getString("user_rename_photo"));
				loginUser.setUserKeywordCount(rset.getInt("user_keyword_count"));
				loginUser.setUserLoginable(rset.getString("user_loginable"));
				loginUser.setUserExeable(rset.getString("user_exeable"));
				loginUser.setUserLessonmax(rset.getInt("user_lessonmax"));
				loginUser.setUserEnrollDate(rset.getDate("user_enrolldate"));
				
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

	public ArrayList<Users> seachUserByAdmin(Connection con, Users user, String seach, int seachOption, int limit, int currentPage) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Users> al=new ArrayList<Users>();
		String query="";
		
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		System.out.println("usertype="+user.getUserTypeNo());
		
		if(seachOption==1) {
		//모든 설정으로 검색.
		query="select * from (select ROWNUM AS RNUM, A.* FROM  (SELECT * FROM users where user_type like ? and ( USER_EMAIL like ? or USER_NAME like ? or USER_GENDER like ? or USER_AGE like ? or USER_LOC like ? or USER_PHONE like ?) ) A WHERE ROWNUM < ? ) WHERE RNUM >= ? ORDER BY user_no DESC ";
		}else if(seachOption==2) {
			//이름으로 검색
			query="select * from (select ROWNUM AS RNUM, A.* FROM  (select * from users where user_type like ? and ( USER_NAME like ?) ) A WHERE ROWNUM < ? ) WHERE RNUM >= ? ORDER BY user_no DESC";
	
		}else if(seachOption==3) {
			//이메일로 검색.
			query="select * from (select ROWNUM AS RNUM, A.* FROM  (select * from users where user_type like ? and ( USER_email like ? ) ) A WHERE ROWNUM < ? ) WHERE RNUM >= ? ORDER BY user_no DESC";

	
		}else if(seachOption==4) {
			//현재 정상인지,차단인지로 검색.
			query="select * from (select ROWNUM AS RNUM, A.* FROM  (select * from users where user_type like ? and ( USER_EXEABLE like ? or USER_LOGINABLE like ? ) ) A WHERE ROWNUM < ? ) WHERE RNUM >= ? ORDER BY user_no DESC ";

		}else if(seachOption==5) {
			//나이로 검색 (오차한계 2살)
			query="select * from (select ROWNUM AS RNUM, A.* FROM  (select * from users where user_type like ? and ( USER_age between ? and ? ) ) A WHERE ROWNUM < ? ) WHERE RNUM >= ?  ORDER BY user_no DESC ";

	
		}else if(seachOption==6) {
			//성별로검색
			query="select * from (select ROWNUM AS RNUM, A.* FROM  (select * from users where user_type like ? and ( USER_gender like ?  ) ) WHERE RNUM >= ? ORDER BY user_no DESC ";

		}else if(seachOption==7) {
		//주소로검색
			query="select * from (select ROWNUM AS RNUM, A.* FROM  (select * from users where user_type like ? and ( USER_loc like ? ) ) WHERE RNUM >= ? ORDER BY user_no DESC ";

		}else if(seachOption==8) {
			//전화번호로검색
			query="select * from (select ROWNUM AS RNUM, A.* FROM  (select * from users where user_type like ? and ( USER_phone like ? )) WHERE RNUM >= ? ORDER BY user_no DESC ";

		}
			
		try {
			pstmt=con.prepareStatement(query);
			if(seachOption==1) {
			
				pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
				pstmt.setString(2,"%"+seach+"%");
				pstmt.setString(3,"%"+seach+"%");
				pstmt.setString(4,"%"+seach+"%");
				pstmt.setString(5,"%"+seach+"%");
				pstmt.setString(6,"%"+seach+"%");
				pstmt.setString(7,"%"+seach+"%");
				
				pstmt.setInt(8, endRow);
				pstmt.setInt(9, startRow);
				
				}else if(seachOption==2) {
					//이름으로 검색
					
					pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
					pstmt.setString(2,"%"+seach+"%");
					pstmt.setInt(4, startRow);
					pstmt.setInt(3, endRow);
				}else if(seachOption==3) {
					//이메일로 검색.
								
					pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
					pstmt.setString(2,"%"+seach+"%");
					pstmt.setInt(3, endRow);
					pstmt.setInt(4, startRow);
				}else if(seachOption==4) {
					//현재 정상인지,차단인지로 검색.
					pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
					pstmt.setString(2,"%"+seach+"%");
					pstmt.setString(3,"%"+seach+"%");
					pstmt.setInt(5, startRow);
					pstmt.setInt(4, endRow);
				}else if(seachOption==5) {
					//나이로 검색 (오차한계 2살)
					pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
					pstmt.setInt(2,Integer.parseInt(seach)-2);
					pstmt.setInt(3,Integer.parseInt(seach)+2);
					pstmt.setInt(5, startRow);
					pstmt.setInt(4, endRow);
				}else if(seachOption==6) {
					//성별로검색
					pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
					pstmt.setString(2,"%"+seach+"%");
					pstmt.setInt(4, startRow);
					pstmt.setInt(3, endRow);
				}else if(seachOption==7) {
					//주소로검색
					pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
					pstmt.setString(2,"%"+seach+"%");
					pstmt.setInt(3, startRow);
					pstmt.setInt(4, endRow);
				}else if(seachOption==8) {
					//전화번호로검색
					pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
					pstmt.setString(2,"%"+seach+"%");
					pstmt.setInt(4, startRow);
					pstmt.setInt(3, endRow);
				}
			
			
			rset=pstmt.executeQuery();
		
			while(rset.next()) {
			user=new Users();
			user.setUserNo(rset.getInt("USER_NO"));
			user.setUserTypeNo(rset.getInt("USER_TYPE"));
			user.setUserEmail(rset.getString("USER_EMAIL"));
			user.setUserName(rset.getString("USER_NAME"));
			user.setUserGender(rset.getString("USER_GENDER"));
			user.setUserAge(rset.getInt("USER_AGE"));
			user.setUserLoc(rset.getString("USER_LOC"));
			user.setUserPhone(rset.getString("USER_PHONE"));
			user.setUserKeywordCount(rset.getInt("USER_KEYWORD_COUNT"));
			user.setUserLoginable(rset.getString("USER_LOGINABLE"));
			user.setUserExeable(rset.getString("USER_EXEABLE"));
			user.setUserLessonmax(rset.getInt("USER_LESSONMAX"));
			user.setUserEnrollDate(rset.getDate("USER_ENROLLDATE"));
					if(rset.getString("USER_ORIGINAL_PHOTO")!=null) {
					user.setUserOriginalPhoto(rset.getString("USER_ORIGINAL_PHOTO"));	
					}
					if(rset.getString("USER_RENAME_PHOTO")!=null) {
						user.setUserRenamePhoto(rset.getString("USER_RENAME_PHOTO"));	
					}
			System.out.println(user.toString());

			al.add(user);	
			
			}
			
			
		}catch (Exception e) {
			
		e.printStackTrace();
		
		}finally {
			close(rset);
			close(pstmt);
		}		
		return al;
	}

	
	public int getListCount(Connection con, Users user, String seach, int seachOption) {
	int result=0;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	String query="";
	if(seachOption==1) {
		//모든 설정으로 검색.
		query="select count(USER_NO) from users where user_type like ? and (USER_EMAIL like ? or USER_NAME like ? or USER_GENDER like ? or USER_AGE like ? or USER_LOC like ? or USER_PHONE like ? ) ";
	}else if(seachOption==2) {
		//이름으로 검색
		query="select count(USER_NO) from users where user_type like ? and USER_NAME like ? ";
	}else if(seachOption==3) {
		//이메일로 검색.
		query="select count(USER_NO) from users where user_type like ? and USER_email like ?";
	}else if(seachOption==4) {
		//현재 정상인지,차단인지로 검색.
		query="select count(USER_NO) from users where user_type like ? and USER_EXEABLE like ? or USER_LOGINABLE like ?";
	}else if(seachOption==5) {
		//나이로 검색 (오차한계 2살)
		query="select count(USER_NO) from users where user_type like ? and USER_age like ?";
	}else if(seachOption==6) {
		//성별로검색
		query="select count(USER_NO) from users where user_type like ? and USER_gender like ?";
	}else if(seachOption==7) {
		//주소로검색
		query="select count(USER_NO) from users where user_type like ? and USER_loc like ?";
	}else if(seachOption==8) {
		//전화번호로검색
		query="select count(USER_NO) from users where user_type like ? and USER_phone like ?";
	}
		
	try {
		pstmt=con.prepareStatement(query);
		
		if(seachOption==1) {
		
		pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
		pstmt.setString(2,"%"+seach+"%");
		pstmt.setString(3,"%"+seach+"%");
		pstmt.setString(4,"%"+seach+"%");
		pstmt.setString(5,"%"+seach+"%");
		pstmt.setString(6,"%"+seach+"%");
		pstmt.setString(7,"%"+seach+"%");
		}else if(seachOption==2) {
			//이름으로 검색
			
			pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
			pstmt.setString(2,"%"+seach+"%");
		}else if(seachOption==3) {
			//이메일로 검색.
						
			pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
			pstmt.setString(2,"%"+seach+"%");
		}else if(seachOption==4) {
			//현재 정상인지,차단인지로 검색.
			pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
			pstmt.setString(2,"%"+seach+"%");
			pstmt.setString(3,"%"+seach+"%");
			
		}else if(seachOption==5) {
			//나이로 검색 (오차한계 2살)
			pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
			pstmt.setString(2,"%"+seach+"%");
		}else if(seachOption==6) {
			//성별로검색
			pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
			pstmt.setString(2,"%"+seach+"%");
		}else if(seachOption==7) {
			//주소로검색
			pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
			pstmt.setString(2,"%"+seach+"%");
		}else if(seachOption==8) {
			//전화번호로검색
			pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
			pstmt.setString(2,"%"+seach+"%");
		}
		
		
		rset=pstmt.executeQuery();
		
		if(rset.next()) {
		result=rset.getInt(1);
		}
		
		
	}catch (Exception e) {
	e.printStackTrace();
	
	}finally {
		close(rset);
		close(pstmt);
	}		
	return result;
	}

	
	
	
	public Users userDetailByAdmin(Connection con, int i) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Users user=null;
		String query="select * from users where USER_NO = ?";
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1,i);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				user=new Users();
				user.setUserNo(rset.getInt("USER_NO"));
				user.setUserTypeNo(rset.getInt("USER_TYPE"));
				user.setUserEmail(rset.getString("USER_EMAIL"));
				user.setUserName(rset.getString("USER_NAME"));
				user.setUserGender(rset.getString("USER_GENDER"));
				user.setUserAge(rset.getInt("USER_AGE"));
				user.setUserLoc(rset.getString("USER_LOC"));
				user.setUserPhone(rset.getString("USER_PHONE"));
				user.setUserKeywordCount(rset.getInt("USER_KEYWORD_COUNT"));
				user.setUserLoginable(rset.getString("USER_LOGINABLE"));
				user.setUserExeable(rset.getString("USER_EXEABLE"));
				user.setUserLessonmax(rset.getInt("USER_LESSONMAX"));
				user.setUserEnrollDate(rset.getDate("USER_ENROLLDATE"));
				if(rset.getString("USER_ORIGINAL_PHOTO")!=null) {
				user.setUserOriginalPhoto(rset.getString("USER_ORIGINAL_PHOTO"));	
				}
				if(rset.getString("USER_RENAME_PHOTO")!=null) {
				user.setUserRenamePhoto(rset.getString("USER_RENAME_PHOTO"));	
				}
				
			}
			
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return user;
	}

	
	
	
	
	
}
