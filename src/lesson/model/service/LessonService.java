package lesson.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import lesson.model.dao.LessonDao;
import lesson.model.vo.Lesson;
import lesson.model.vo.Onlesson;

public class LessonService {

	
	public LessonService() {}

	public int insertlesson(Lesson lesson) {
		Connection conn = getConnection();
		
		int result = new LessonDao().insertlesson(conn, lesson);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public ArrayList<Onlesson> onlesson(int user) {
		Connection conn = getConnection();
		
		ArrayList<Onlesson> onlesson = new LessonDao().onlesson(conn, user);
		
		close(conn);
		
		return onlesson;
	}

	

	
	
}
