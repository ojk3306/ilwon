package lesson.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import lesson.model.dao.LessonDao;
import lesson.model.vo.Lesson;

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
	
}
