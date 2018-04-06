package lesson.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import lesson.model.vo.Lesson;
import lesson.model.vo.LessonDetail;
import lesson.model.vo.Onlesson;


public class LessonDao {

	
	public LessonDao() {}

	public int insertlesson(Connection conn, Lesson lesson) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into lesson values((SELECT max(lesson_no) from lesson)+1"
				+ ",?,1,5513,null,?,?,?,?,?,?,sysdate,null,?,?,?,?,7000)";
		//카테고리 번호 같은 것 나중에 추가하자
		
		try {
		System.out.println("lesson.getUser_no2()"+lesson.getUser_no2());
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lesson.getLevel_no());
			pstmt.setInt(2, lesson.getUser_no2());
			pstmt.setString(3, lesson.getLesson_title());
			pstmt.setString(4, lesson.getLesson_loc());
			pstmt.setInt(5, lesson.getLesson_rad());
			pstmt.setInt(6, lesson.getLesson_price());
			pstmt.setInt(7, lesson.getLesson_count());
			pstmt.setString(8, lesson.getLesson_contop());
			pstmt.setString(9, lesson.getLesson_conmid());
			pstmt.setString(10, lesson.getLesson_conbot());
			pstmt.setString(11, lesson.getLesson_keyword());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Onlesson> onlesson(Connection conn, int user) {
		ArrayList<Onlesson> onlesson = new ArrayList<Onlesson>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = 
				"select l.lesson_title, u.user_name, s.state, l.lesson_no, l.lesson_enddate from lesson l, users u,state s where l.user_no2 = u.user_no and l.state_no=s.state_no and " + 
				"l.user_no2 = ? order by l.lesson_no desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, user);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
			Onlesson l = new Onlesson();
			l.setLesson_title(rset.getString("lesson_title"));
			l.setState(rset.getString("state"));
			l.setUser_name(rset.getString("user_name"));
			l.setLesson_no(rset.getInt("lesson_no"));
			l.setLesson_enddate(rset.getDate("lesson_enddate"));
			System.out.println(l.toString());
			onlesson.add(l);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return onlesson;
	}

	public int stopLesson(Connection conn, int lesson_no) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "update lesson set state_no = 2, lesson_enddate = sysdate where lesson_no = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lesson_no);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public LessonDetail lessonView() {
		LessonDetail lessondetail = new LessonDetail();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql= "select l.lesson_title, lv.lessonlev, l.lesson_loc, l.lesson_rad, l.lesson_price,\r\n" + 
				"l.lesson_count, s.state_no, l.lesson_contop, l.lesson_conmid, l.lesson_conbot, l.lesson_keyword,\r\n" + 
				"u.user_name, r.review_prepare, r.review_sincerity, r.review_delivery, r.review_no, r.review_content\r\n" + 
				"from lesson l, review r,users u,lessonlev lv\r\n" + 
				"where l.lesson_no = r.lesson_no and l.user_no2=u.user_no and l.level_no = lv.lessonlev_no and\r\n" + 
				"l.lesson_no = ? and user_no2 = (select user_no2 from lesson where lesson_no = ?) \r\n" + 
				"and l.level_no = (select level_no from lesson where lesson_no = ?)";
		
		
		return null;
	}

	
	}
	

