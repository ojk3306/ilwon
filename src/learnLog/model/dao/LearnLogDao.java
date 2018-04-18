package learnLog.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import learnLog.model.vo.LearnLog;
import learnLog.model.vo.LearnLogAdmin;
import learnLog.model.vo.Learnlogforinfo;

public class LearnLogDao {
 
	public LearnLogDao() {}

	public ArrayList<LearnLog> onlesson(int user, Connection conn) {
		ArrayList<LearnLog> onlesson = new ArrayList<LearnLog>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select ll.log_no, ll.lesson_no, ll.log_date, ll.log_state, l.lesson_title, u.user_name, l.state_no from learn_log ll, lesson l,users u where l.lesson_no in (select lesson_no from learn_log where user_no1 = ?) and u.user_no in (select user_no2 from lesson where lesson_no in (select lesson_no from learn_log where user_no1 = ?)) and ll.lesson_no = l.lesson_no and l.user_no2 = u.user_no";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user);
			pstmt.setInt(2, user);
			rset = pstmt.executeQuery();
		
		while(rset.next()) {
				LearnLog l = new LearnLog();
				l.setLessonNo(rset.getInt("lesson_no"));
				l.setLessonTitle(rset.getString("lesson_title"));
				l.setLogDate(rset.getDate("log_date"));
				l.setLogNo(rset.getInt("log_no"));
				l.setState(rset.getInt("log_state"));
				l.setUserName(rset.getString("user_name"));
				l.setLesson_state(rset.getInt("state_no"));
				//l.setUserNo2(rset.getInt("user_no2"));
				
				System.out.println(l.toString());
				onlesson.add(l);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return onlesson;
	}

	public int cancleLesson(Connection conn, int userno, int lesson_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "update LEARN_LOG set log_state = 2 where lesson_no = ? and user_no1 = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lesson_no);
			pstmt.setInt(2, userno);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Learnlogforinfo> getlessonLog(int user, Connection conn) {
		ArrayList<Learnlogforinfo> onlesson = new ArrayList<Learnlogforinfo>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//�븰�깮�씠 蹂몄씤�씠 �닔媛뺥븳 �젅�뒯�뱾 
		String sql = "select  * from  LEARN_LOG,users,lesson where LEARN_LOG.LESSON_NO=lesson.LESSON_NO and LEARN_LOG.USER_NO2=users.USER_NO and LEARN_LOG.USER_NO1 = ? and log_state = 1 ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Learnlogforinfo l = new Learnlogforinfo();
				l.setLESSON_NO(rset.getInt("lesson_no"));
				l.setLOG_DATE(rset.getDate("log_date"));
				l.setLOG_NO(rset.getInt("log_no"));
				l.setLOG_STATE(rset.getInt("log_state"));
				l.setUSER_NAME(rset.getString("user_name"));
				l.setUSER_NO1(rset.getInt("user_no1"));
				l.setUSER_NO2(rset.getInt("user_no2"));
				l.setLESSON_TITLE(rset.getString("LESSON_TITLE"));
				
				
				//l.setUserNo2(rset.getInt("user_no2"));
				
				System.out.println("getlessonLog :" +l.toString());
				onlesson.add(l);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return onlesson;
	}

	public ArrayList<Learnlogforinfo> getlessonLog1(int user, Connection conn) {
		ArrayList<Learnlogforinfo> onlesson = new ArrayList<Learnlogforinfo>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//�븰�깮�씠 蹂몄씤�씠 �닔媛뺥븳 �젅�뒯�뱾 
		String sql = "select  * from  LEARN_LOG,users,lesson where LEARN_LOG.LESSON_NO=lesson.LESSON_NO and LEARN_LOG.USER_NO2=users.USER_NO and LEARN_LOG.USER_NO1 = ? and log_state = 2 ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Learnlogforinfo l = new Learnlogforinfo();
				l.setLESSON_NO(rset.getInt("lesson_no"));
				l.setLOG_DATE(rset.getDate("log_date"));
				l.setLOG_NO(rset.getInt("log_no"));
				l.setLOG_STATE(rset.getInt("log_state"));
				l.setUSER_NAME(rset.getString("user_name"));
				l.setUSER_NO1(rset.getInt("user_no1"));
				l.setUSER_NO2(rset.getInt("user_no2"));
				l.setLESSON_TITLE(rset.getString("LESSON_TITLE"));
				
				
				//l.setUserNo2(rset.getInt("user_no2"));
				
				System.out.println("getlessonLog :" +l.toString());
				onlesson.add(l);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return onlesson;
	}

	public ArrayList<Learnlogforinfo> getlessonLog3(int user, Connection conn) {
		ArrayList<Learnlogforinfo> onlesson = new ArrayList<Learnlogforinfo>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		//�꽑�깮�쓽 �븰�깮濡쒓렇
		String sql = "select * from  LEARN_LOG,users,lesson where LEARN_LOG.LESSON_NO=lesson.LESSON_NO and LEARN_LOG.USER_NO1=users.USER_NO and LEARN_LOG.USER_NO2= ? and LOG_STATE in 1 and STATE_NO in 1";		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Learnlogforinfo l = new Learnlogforinfo();
				l.setLESSON_NO(rset.getInt("lesson_no"));
				l.setLOG_DATE(rset.getDate("log_date"));
				l.setLOG_NO(rset.getInt("log_no"));
				l.setLOG_STATE(rset.getInt("log_state"));
				l.setUSER_NAME(rset.getString("user_name"));
				l.setUSER_NO1(rset.getInt("user_no1"));
				l.setUSER_NO2(rset.getInt("user_no2"));
				l.setLOG_STATE(rset.getInt("LOG_STATE"));
				l.setLESSONTYPE(rset.getInt("LESSON_TYPE"));
				l.setLESSON_TITLE(rset.getString("LESSON_TITLE"));
				l.setUSER_PHONE(rset.getString("USER_PHONE"));
				//l.setUserNo2(rset.getInt("user_no2"));
				
				System.out.println("getlessonLog :" +l.toString());
				onlesson.add(l);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return onlesson;
	}

	public ArrayList<Learnlogforinfo> getlessonLog4(int user, Connection conn) {
	//�씠�븣源뚯� 蹂몄씤(�꽑�깮)�뿉寃� �닔�뾽�쓣 諛쏆� �븰�깮�뱾�쓽 �젙蹂대�� 戮묒븘�궡�뒗 �궡�뿭.
		ArrayList<Learnlogforinfo> onlesson = new ArrayList<Learnlogforinfo>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		//�꽑�깮�쓽 �븰�깮濡쒓렇
		String sql = "select * from  LEARN_LOG,users,lesson where LEARN_LOG.LESSON_NO=lesson.LESSON_NO and LEARN_LOG.USER_NO1=users.USER_NO and LEARN_LOG.USER_NO2= ? and LOG_STATE in 3 ";		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Learnlogforinfo l = new Learnlogforinfo();
				l.setLESSON_NO(rset.getInt("lesson_no"));
				l.setLOG_DATE(rset.getDate("log_date"));
				l.setLOG_NO(rset.getInt("log_no"));
				l.setLOG_STATE(rset.getInt("log_state"));
				l.setUSER_NAME(rset.getString("user_name"));
				l.setUSER_NO1(rset.getInt("user_no1"));
				l.setLOG_STATE(rset.getInt("LOG_STATE"));
				l.setLESSON_TITLE(rset.getString("LESSON_TITLE"));
				l.setLESSONTYPE(rset.getInt("LESSON_TYPE"));
				
				//l.setUserNo2(rset.getInt("user_no2"));
				
				System.out.println("getlessonLog4 :" +l.toString());
				onlesson.add(l);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return onlesson;
	}

	public int Comfirmlog(Connection conn, int parseInt, int parseInt2, int i) {
		
		PreparedStatement pstmt=null;
		int result=0;
		
		String sql="insert into LEARN_LOG values((select max(LOG_NO) from learn_log)+1,?,?,?,sysdate,3)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, parseInt);
			pstmt.setInt(2, parseInt2);
			pstmt.setInt(3, i);
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();			
			// TODO: handle exception
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public ArrayList<Learnlogforinfo> getlessonLog3_1(int user, Connection conn) {
		ArrayList<Learnlogforinfo> onlesson = new ArrayList<Learnlogforinfo>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		//�꽑�깮�쓽 �븰�깮濡쒓렇
		String sql = "select * from  LEARN_LOG,users,lesson where LEARN_LOG.LESSON_NO=lesson.LESSON_NO and LEARN_LOG.USER_NO2=users.USER_NO and LEARN_LOG.USER_NO1= ? and LOG_STATE in 1 and STATE_NO in 1";		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Learnlogforinfo l = new Learnlogforinfo();
				l.setLESSON_NO(rset.getInt("lesson_no"));
				l.setLOG_DATE(rset.getDate("log_date"));
				l.setLOG_NO(rset.getInt("log_no"));
				l.setLOG_STATE(rset.getInt("log_state"));
				l.setUSER_NAME(rset.getString("user_name"));
				l.setUSER_NO2(rset.getInt("user_no2"));
				l.setLOG_STATE(rset.getInt("LOG_STATE"));
				l.setLESSON_TITLE(rset.getString("LESSON_TITLE"));
				l.setUSER_PHONE(rset.getString("USER_PHONE"));
				l.setLESSONTYPE(rset.getInt("LESSON_TYPE"));

				//l.setUserNo2(rset.getInt("user_no2"));
				
				System.out.println("getlessonLog :" +l.toString());
				onlesson.add(l);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return onlesson;
	}

	public ArrayList<Learnlogforinfo> getlessonLog4_1(int user, Connection conn) {
		ArrayList<Learnlogforinfo> onlesson = new ArrayList<Learnlogforinfo>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		//�꽑�깮�쓽 �븰�깮濡쒓렇
		String sql = "select * from  LEARN_LOG,users,lesson where LEARN_LOG.LESSON_NO=lesson.LESSON_NO and LEARN_LOG.USER_NO2=users.USER_NO and LEARN_LOG.USER_NO1= ? and LOG_STATE in 3 ";		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Learnlogforinfo l = new Learnlogforinfo();
				l.setLESSON_NO(rset.getInt("lesson_no"));
				l.setLOG_DATE(rset.getDate("log_date"));
				l.setLOG_NO(rset.getInt("log_no"));
				l.setLOG_STATE(rset.getInt("log_state"));
				l.setUSER_NAME(rset.getString("user_name"));
				l.setUSER_NO2(rset.getInt("user_no2"));
				l.setLOG_STATE(rset.getInt("LOG_STATE"));
				l.setLESSON_TITLE(rset.getString("LESSON_TITLE"));
				l.setUSER_PHONE(rset.getString("USER_PHONE"));
				l.setLESSONTYPE(rset.getInt("LESSON_TYPE"));
				//l.setUserNo2(rset.getInt("user_no2"));
				
				System.out.println("getlessonLog :" +l.toString());
				onlesson.add(l);	
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return onlesson;
	}

	public int summitLesson(Connection conn, int parseInt, int parseInt2, int i) {
		int result=0;
		
		//�븰�깮,�꽑�깮,媛뺤쓽
		PreparedStatement pstmt=null;
		String sql="insert into LEARN_LOG values ((select max(LOG_NO)+1 from LEARN_LOG),?,?,?,sysdate,1) ";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,parseInt);
			pstmt.setInt(2, parseInt2);
			pstmt.setInt(3,i);
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int finishstudent(Connection conn, int parseInt, int parseInt2, int parseInt3) {
		int result=0;
		//�븰�깮,�꽑�깮,媛뺤쓽
		PreparedStatement pstmt=null;
		String sql="update LEARN_LOG set LOG_STATE = 3 where USER_NO1=? and USER_NO2=? and LESSON_NO=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,parseInt);
			pstmt.setInt(2, parseInt2);
			pstmt.setInt(3,parseInt3);
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int checkLesson(Connection conn, int parseInt, int parseInt2, int parseInt3) {
		int result=0;
		//�븰�깮,�꽑�깮,媛뺤쓽
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		String sql="select count(*) from LEARN_LOG where USER_NO1= ? and USER_NO2=? and LESSON_NO = ? and LOG_STATE = 1";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,parseInt);
			pstmt.setInt(2, parseInt2);
			pstmt.setInt(3,parseInt3);
			rset=pstmt.executeQuery();
			rset.next();
			result=rset.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public ArrayList<LearnLogAdmin> auLessona(Connection con, int lesson_no) {
		ArrayList<LearnLogAdmin> lessona = new ArrayList<LearnLogAdmin>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = "select u.*, l.* from users u, learn_log l where u.user_no = l.user_no1 and l.LESSON_NO = ?";
		
		try {
			
			pstmt= con.prepareStatement(sql);
			pstmt.setInt(1, lesson_no);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				LearnLogAdmin l = new LearnLogAdmin();
				l.setLESSON_NO(rset.getInt("lesson_no"));
				l.setLOG_DATE(rset.getDate("log_date"));
				l.setLOG_NO(rset.getInt("log_no"));
				l.setLOG_STATE(rset.getInt("log_state"));
				l.setUSER_NAME(rset.getString("user_name"));
				l.setUSER_NO1(rset.getInt("user_no1"));
				l.setLOG_STATE(rset.getInt("LOG_STATE"));
				l.setUSER_PHONE(rset.getString("USER_PHONE"));
				l.setUser_email(rset.getString("user_email"));
				l.setUser_gender(rset.getString("user_gender"));
				
				System.out.println("getlessonLog :" +l.toString());
				lessona.add(l);	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return lessona;
	}
}
