package lesson.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import lesson.model.dao.LessonDao;
import lesson.model.vo.Lesson;
import lesson.model.vo.LessonDetail;
import lesson.model.vo.Onlesson;

public class LessonService {

	
	public LessonService() {
		
	}

	public int insertlesson(Lesson lesson) {
		Connection conn = getConnection();
		
		int result = new LessonDao().insertlesson(conn, lesson);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	public int updateLesson(Lesson lesson) {
		Connection conn = getConnection();
		
		int result = new LessonDao().updateLesson(conn, lesson);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}
	
	public int deleteLesson(Lesson lesson) {
		Connection conn = getConnection();
		
		int result = new LessonDao().deleteLesson(conn, lesson);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}	
	
	public ArrayList<Lesson> selectLessonList() {
		Connection con = getConnection();
		
		ArrayList<Lesson> list = new LessonDao().selectLessonList(con);
		close(con);
				
		return list;
	}
	
	public ArrayList<Lesson> selectSearchList() {
		Connection con = getConnection();
		
		ArrayList<Lesson> list = new LessonDao().selectSearchList(con);
		close(con);
				
		return list;
	}

	public ArrayList<Onlesson> onlesson(int user) {
		Connection conn = getConnection();
		
		ArrayList<Onlesson> onlesson = new LessonDao().onlesson(conn, user);
		
		close(conn);
		
		return onlesson;
	}

	public int stopLesson(int lesson_no) {
		Connection conn = getConnection();
		
		int result = new LessonDao().stopLesson(conn,lesson_no);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public LessonDetail lessonView(int lesson_no) {
		Connection conn = getConnection();
		LessonDetail lessondetail = new LessonDao().lessonView(conn,lesson_no);
		
		close(conn);
		
		return lessondetail;
	}
	
}
