package lesson.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import lesson.model.dao.LessonDao;
import lesson.model.vo.LearnSearch;
import lesson.model.vo.Lesson;
import lesson.model.vo.LessonDetail;
import lesson.model.vo.LessonSearch;
import lesson.model.vo.Onlesson;
import lesson.model.vo.Sidebar;

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
		close(conn);
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
	
	public ArrayList<LessonSearch> selectSearchList(LessonSearch ls) {
		
		Connection con = getConnection();
		
		System.out.println("SendInfo : " + ls + " / (To.LessonService)");
		ArrayList<LessonSearch> list = new LessonDao().selectSearchList(con, ls);
		
		close(con);
		
		System.out.println("SearchList : " + list + " / (To.LessonService)");
		return list;
	}
	
	public ArrayList<LessonSearch> selectSearchKeyword(LessonSearch ls) {
		
		Connection con = getConnection();
		
		System.out.println("SendInfo : " + ls + " / (To.LessonService)");
		ArrayList<LessonSearch> list = new LessonDao().selectSearchKeyword(con, ls);
		System.out.println("selectSearchKeyword 서비스 에서 list 사이즈="+ list.size());
		close(con);
		
		System.out.println("SearchList : " + list + " / (To.LessonService)");
		
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
			
		close(conn);
		return result;
	}

	public LessonDetail lessonView(int lesson_no) {
		Connection conn = getConnection();
		LessonDetail lessondetail = new LessonDao().lessonView(conn,lesson_no);
		
		close(conn);
		
		return lessondetail;
	}

	public ArrayList<Sidebar> seachlistByKeyword(String string) {
		Connection con = getConnection();
		ArrayList<Sidebar> LessonList=new LessonDao().seachlistByKeyword(con,string);
		close(con);
		return LessonList;
	}

	public ArrayList<Sidebar> seachlistByKeyword(String string, ArrayList<Sidebar> lessonList) {
		Connection con = getConnection();
		ArrayList<Sidebar> l=new LessonDao().seachlistByKeyword2(con,string,lessonList);
		close(con);
		return l;
	}

	public ArrayList<Sidebar> seachlistByKeyword(ArrayList<Sidebar> lessonList) {
		Connection con = getConnection();
		ArrayList<Sidebar> l=new LessonDao().seachlistByKeyword2(con,lessonList);
		close(con);
		return l;
	}

	public Lesson findLessonBylessonNo(int parseInt) {
		Connection con = getConnection();

		Lesson ls = new LessonDao().findLessonBylessonNo(con,parseInt);
		
	close(con);
		
		return ls;
		
		
	}

	public int updatelesson(Lesson lesson) {
		Connection conn = getConnection();
		
		int result = new LessonDao().updatelesson(conn, lesson);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
		
	
	}

	public ArrayList<Onlesson> onlesson2(int user) {
		Connection conn = getConnection();
		
		ArrayList<Onlesson> onlesson = new LessonDao().onlesson2(conn, user);
		
		close(conn);
		
		return onlesson;
	}


	public ArrayList<Lesson> aLessonList() {
		Connection con = getConnection();
		ArrayList<Lesson> lesson = new LessonDao().aLessonList(con);
		close(con);
		return lesson;
	}

	public ArrayList<Lesson> aSearchLesson(String str, int option) {
		Connection con = getConnection();
		ArrayList<Lesson> lesson = new LessonDao().aSearchLesson(con,str,option);
		close(con);
		return lesson;
		
	}

	public Lesson auLesson(int lesson_no) {
		Connection con = getConnection();
		Lesson lesson = new LessonDao().auLesson(con,lesson_no);
		close(con);
		return lesson;
	}

	public int adminUpdateLesson(int lessonno, String value, int type) {
		Connection con = getConnection();
		int result = new LessonDao().adminUpdateLesson(con,lessonno,value,type);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
			System.out.println("Ű���� ���� ����");
		
		}
		close(con);
		return result;
}


	public LessonSearch getlessoninfoStudentByNo(int parseInt) {
		Connection conn = getConnection();
		
		LessonSearch ls= new LessonDao().getlessoninfoStudentByNo(conn, parseInt);
		close(conn);
		
		
		return ls;
	}
	public ArrayList<Lesson> selectLearnList() {
		Connection con = getConnection();
		
		ArrayList<Lesson> list = new LessonDao().selectLearnList(con);
		close(con);
				
		return list;
	}

	public ArrayList<LearnSearch> selectLearnSearchList(LearnSearch ls) {
		Connection con = getConnection();
		
		System.out.println("SendInfo : " + ls + " / (To.LessonService)");
		ArrayList<LearnSearch> list = new LessonDao().selectLearnSearchList(con, ls);
		
		close(con);
		
		System.out.println("SearchList : " + list + " / (To.LessonService)");
		return list;
	}

		public int insertlesson1(Lesson lesson) {
		Connection conn = getConnection();
		
		int result = new LessonDao().insertlesson1(conn, lesson);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

		public Lesson getLssoninfoByLessonNo(int parseInt) {
			Connection conn = getConnection();
			Lesson less= new  LessonDao().findLessonBylessonNo(conn,parseInt);
			close(conn);
			return less;
		}

		public ArrayList<Lesson> selectMainTeacher() {
			Connection con = getConnection();
			
			ArrayList<Lesson> list = new LessonDao().selectMainTeacher(con);
			close(con);
					
			return list;
		}

		public ArrayList<Lesson> selectMainStudent() {
			Connection con = getConnection();
			
			ArrayList<Lesson> list = new LessonDao().selectMainStudent(con);
			close(con);
					
			return list;
		}

		public int getLessonNumByUserNO(int parseInt) {
			Connection conn = getConnection();
			
			int result = new LessonDao().getLessonNumByUserNO(conn, parseInt);
			
		
			close(conn);
			return result;
		}
	
}
