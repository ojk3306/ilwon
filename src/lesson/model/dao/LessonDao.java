package lesson.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;

import lesson.model.vo.Lesson;


public class LessonDao {

	
	public LessonDao() {}

	public int insertlesson(Connection conn, Lesson lesson) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into lesson values((SELECT max(lesson_no) from lesson)+1"
				+ ",?,1,5513,null,?,?,?,?,?,?,sysdate,?,?,?,?,7000)";
		//분류번호 등 추가할 것
		
		try {
		System.out.println("lesson.getUser_no2()"+lesson.getUser_no2());
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, lesson.getLevel_no());
			pstmt.setInt(2, lesson.getUser_no2());
			pstmt.setString(3, lesson.getlesson_title());
			pstmt.setString(4, lesson.getlesson_loc());
			pstmt.setInt(5, lesson.getlesson_rad());
			pstmt.setInt(6, lesson.getlesson_price());
			pstmt.setInt(7, lesson.getlesson_count());
			pstmt.setString(8, lesson.getlesson_contop());
			pstmt.setString(9, lesson.getlesson_conmid());
			pstmt.setString(10, lesson.getlesson_conbot());
			pstmt.setString(11, lesson.getlesson_keyword());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
}
