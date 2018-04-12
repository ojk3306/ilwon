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
				+ "and user_pwd = ? and USER_LOGINABLE = 'Y' ";
		
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
		
		if(seachOption==1) {
		//紐⑤뱺 �꽕�젙�쑝濡� 寃��깋.
		query="select * from (select ROWNUM AS RNUM, A.* FROM  (SELECT * FROM users where user_type like ? and ( USER_EMAIL like ? or USER_NAME like ? or USER_GENDER like ? or USER_AGE like ? or USER_LOC like ? or USER_PHONE like ?) ) A WHERE ROWNUM < ? ) WHERE RNUM >= ? ORDER BY user_no DESC ";
		}else if(seachOption==2) {
			//�씠由꾩쑝濡� 寃��깋
			query="select * from (select ROWNUM AS RNUM, A.* FROM  (select * from users where user_type like ? and ( USER_NAME like ?) ) A WHERE ROWNUM < ? ) WHERE RNUM >= ? ORDER BY user_no DESC";
	
		}else if(seachOption==3) {
			//�씠硫붿씪濡� 寃��깋.
			query="select * from (select ROWNUM AS RNUM, A.* FROM  (select * from users where user_type like ? and ( USER_email like ? ) ) A WHERE ROWNUM < ? ) WHERE RNUM >= ? ORDER BY user_no DESC";

		}else if(seachOption==4) {
			//�쁽�옱 �젙�긽�씤吏�,李⑤떒�씤吏�濡� 寃��깋.
			query="select * from (select ROWNUM AS RNUM, A.* FROM  (select * from users where user_type like ? and ( USER_EXEABLE like ? or USER_LOGINABLE like ? ) ) A WHERE ROWNUM < ? ) WHERE RNUM >= ? ORDER BY user_no DESC ";

		}else if(seachOption==5) {
			//�굹�씠濡� 寃��깋 (�삤李⑦븳怨� 2�궡)
			query="select * from (select ROWNUM AS RNUM, A.* FROM  (select * from users where user_type like ? and ( USER_age between ? and ? ) ) A WHERE ROWNUM < ? ) WHERE RNUM >= ?  ORDER BY user_no DESC ";

	
		}else if(seachOption==6) {
			//�꽦蹂꾨줈寃��깋
			query="select * from (select ROWNUM AS RNUM, A.* FROM  (select * from users where user_type like ? and ( USER_gender like ?  ) ) WHERE RNUM >= ? ORDER BY user_no DESC ";

		}else if(seachOption==7) {
		//二쇱냼濡쒓��깋
			query="select * from (select ROWNUM AS RNUM, A.* FROM  (select * from users where user_type like ? and ( USER_loc like ? ) ) WHERE RNUM >= ? ORDER BY user_no DESC ";

		}else if(seachOption==8) {
			//�쟾�솕踰덊샇濡쒓��깋
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
					//�씠由꾩쑝濡� 寃��깋
					
					pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
					pstmt.setString(2,"%"+seach+"%");
					pstmt.setInt(4, startRow);
					pstmt.setInt(3, endRow);
				}else if(seachOption==3) {
					//�씠硫붿씪濡� 寃��깋.
								
					pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
					pstmt.setString(2,"%"+seach+"%");
					pstmt.setInt(3, endRow);
					pstmt.setInt(4, startRow);
				}else if(seachOption==4) {
					//�쁽�옱 �젙�긽�씤吏�,李⑤떒�씤吏�濡� 寃��깋.
					pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
					pstmt.setString(2,"%"+seach+"%");
					pstmt.setString(3,"%"+seach+"%");
					pstmt.setInt(5, startRow);
					pstmt.setInt(4, endRow);
				}else if(seachOption==5) {
					//�굹�씠濡� 寃��깋 (�삤李⑦븳怨� 2�궡)
					pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
					pstmt.setInt(2,Integer.parseInt(seach)-2);
					pstmt.setInt(3,Integer.parseInt(seach)+2);
					pstmt.setInt(5, startRow);
					pstmt.setInt(4, endRow);
				}else if(seachOption==6) {
					//�꽦蹂꾨줈寃��깋
					pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
					pstmt.setString(2,"%"+seach+"%");
					pstmt.setInt(4, startRow);
					pstmt.setInt(3, endRow);
				}else if(seachOption==7) {
					//二쇱냼濡쒓��깋
					pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
					pstmt.setString(2,"%"+seach+"%");
					pstmt.setInt(3, startRow);
					pstmt.setInt(4, endRow);
				}else if(seachOption==8) {
					//�쟾�솕踰덊샇濡쒓��깋
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
		//紐⑤뱺 �꽕�젙�쑝濡� 寃��깋.
		query="select count(USER_NO) from users where user_type like ? and (USER_EMAIL like ? or USER_NAME like ? or USER_GENDER like ? or USER_AGE like ? or USER_LOC like ? or USER_PHONE like ? ) ";
	}else if(seachOption==2) {
		//�씠由꾩쑝濡� 寃��깋
		query="select count(USER_NO) from users where user_type like ? and USER_NAME like ? ";
	}else if(seachOption==3) {
		//�씠硫붿씪濡� 寃��깋.
		query="select count(USER_NO) from users where user_type like ? and USER_email like ?";
	}else if(seachOption==4) {
		//�쁽�옱 �젙�긽�씤吏�,李⑤떒�씤吏�濡� 寃��깋.
		query="select count(USER_NO) from users where user_type like ? and USER_EXEABLE like ? or USER_LOGINABLE like ?";
	}else if(seachOption==5) {
		//�굹�씠濡� 寃��깋 (�삤李⑦븳怨� 2�궡)
		query="select count(USER_NO) from users where user_type like ? and USER_age like ?";
	}else if(seachOption==6) {
		//�꽦蹂꾨줈寃��깋
		query="select count(USER_NO) from users where user_type like ? and USER_gender like ?";
	}else if(seachOption==7) {
		//二쇱냼濡쒓��깋
		query="select count(USER_NO) from users where user_type like ? and USER_loc like ?";
	}else if(seachOption==8) {
		//�쟾�솕踰덊샇濡쒓��깋
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
			//�씠由꾩쑝濡� 寃��깋
			
			pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
			pstmt.setString(2,"%"+seach+"%");
		}else if(seachOption==3) {
			//�씠硫붿씪濡� 寃��깋.
						
			pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
			pstmt.setString(2,"%"+seach+"%");
		}else if(seachOption==4) {
			//�쁽�옱 �젙�긽�씤吏�,李⑤떒�씤吏�濡� 寃��깋.
			pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
			pstmt.setString(2,"%"+seach+"%");
			pstmt.setString(3,"%"+seach+"%");
			
		}else if(seachOption==5) {
			//�굹�씠濡� 寃��깋 (�삤李⑦븳怨� 2�궡)
			pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
			pstmt.setString(2,"%"+seach+"%");
		}else if(seachOption==6) {
			//�꽦蹂꾨줈寃��깋
			pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
			pstmt.setString(2,"%"+seach+"%");
		}else if(seachOption==7) {
			//二쇱냼濡쒓��깋
			pstmt.setString(1,"%"+user.getUserTypeNo()+"%");
			pstmt.setString(2,"%"+seach+"%");
		}else if(seachOption==8) {
			//�쟾�솕踰덊샇濡쒓��깋
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

	public int adminupdate(Connection con, int userno, String value, int type) {
		int result=0;
		PreparedStatement pstmt = null;
		/*
		 * type   
		 * 1= �씠由꾩닔�젙
		 * 2= 硫붿씪�닔�젙
		 * 3= �꽦蹂꾩닔�젙
		 * 4= �쟾踰덉닔�젙
		 * 5= 理쒕��궎�썙�뱶媛��닔 �닔�젙
		 * 6= 理쒕�媛뺤쓽媛��닔 �닔�젙
		 */
	

		String query="";
		switch(type) {
		case 1: query="update users set user_name = ? where user_no = ?"; break;
		
		case 2: query="update users set USER_EMAIL = ? where user_no = ?"; break;
		
		case 3: query="update users set USER_AGE = ? where user_no = ?"; break;
		
		case 4: query="update users set USER_GENDER = ? where user_no = ?"; break;
		
		case 5: query="update users set USER_PHONE = ? where user_no = ?"; break;
		
		case 6: query="update users set USER_KEYWORD_COUNT = ? where user_no = ?"; break;
		
		case 7: query="update users set USER_LESSONMAX = ? where user_no = ?"; break;
		
		case 8: query="update users set USER_LOGINABLE = ? where user_no = ?"; break;
		
		case 9: query="update users set USER_EXEABLE = ? where user_no = ?"; break;
		}
		try {
			
			pstmt=con.prepareStatement(query);
			pstmt.setString(1,value);
			pstmt.setInt(2,userno);
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Users getUserinfofromsemina(Connection con, int userNo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Users user=null;
		
		String query="select * from users where USER_NO = ?";
		

		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1,userNo);
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
		System.out.println(user.toString());
		return user;
	}

	public int uploadProfile(Connection conn, Users user) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "update users set USER_ORIGINAL_PHOTO = ?, USER_RENAME_PHOTO = ? where user_no = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserOriginalPhoto());
			pstmt.setString(2, user.getUserRenamePhoto());
			pstmt.setInt(3, user.getUserNo());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Users updateLogin(Connection con, int userNo) {
		Users loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from users where user_no= ?";
				
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);
			
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

	public String getUserImg(Connection con, int userimg) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String result = null;
		String query = "select USER_RENAME_PHOTO from users where user_no= ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userimg);
			rset= pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getString("USER_RENAME_PHOTO");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	
	
}
