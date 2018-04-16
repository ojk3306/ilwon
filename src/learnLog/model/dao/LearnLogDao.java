package learnLog.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import learnLog.model.vo.LearnLog;
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
		//학생이 본인이 수강한 레슨들 
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
		//학생이 본인이 수강한 레슨들 
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

		//선생의 학생로그
		String sql = "select * from  LEARN_LOG,users,lesson where LEARN_LOG.LESSON_NO=lesson.LESSON_NO and LEARN_LOG.USER_NO1=users.USER_NO and LEARN_LOG.USER_NO2=? ";		
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
}
