package learnLog.model.service;

import java.sql.*;
import java.util.ArrayList;

import learnLog.model.dao.LearnLogDao;
import learnLog.model.vo.LearnLog;
import learnLog.model.vo.LearnLogAdmin;
import learnLog.model.vo.Learnlogforinfo;

import static common.JDBCTemplate.*;

public class LearnLogService {

	public LearnLogService() {}

	public ArrayList<LearnLog> onlesson(int user) {
		Connection conn = getConnection();
		ArrayList<LearnLog> onlesson = new LearnLogDao().onlesson(user,conn);
		
		
		close(conn);
		return onlesson;
	}

	public int cancleLesson(int lesson_no, int userno) {
		Connection conn = getConnection();
		
		int result = new LearnLogDao().cancleLesson(conn,userno,lesson_no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}



	public ArrayList<Learnlogforinfo> getlessonLog(int user) {
		Connection conn = getConnection();
		ArrayList<Learnlogforinfo> onlesson = new LearnLogDao().getlessonLog(user,conn);
		
		
		close(conn);
		return onlesson;
	}

	public ArrayList<Learnlogforinfo> getlessonLog1(int user) {
		Connection conn = getConnection();
		ArrayList<Learnlogforinfo> onlesson = new LearnLogDao().getlessonLog1(user,conn);
		
		
		close(conn);
		return onlesson;
	}

	public ArrayList<Learnlogforinfo> getlessonLog3(int user) {
		Connection conn = getConnection();
		ArrayList<Learnlogforinfo> onlesson = new LearnLogDao().getlessonLog3(user,conn);
		
		
		close(conn);
		return onlesson;
	}

	public ArrayList<Learnlogforinfo> getlessonLog4(int user) {
		Connection conn = getConnection();
		ArrayList<Learnlogforinfo> onlesson = new LearnLogDao().getlessonLog4(user,conn);
		
		
		close(conn);
		return onlesson;
	}

	public int Comfirmlog(int parseInt, int parseInt2, int i) {
		Connection conn = getConnection();
		
		int result = new LearnLogDao().Comfirmlog(conn,parseInt,parseInt2,i);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		return result;
		
	}

	public ArrayList<Learnlogforinfo> getlessonLog3_1(int user) {
		Connection conn = getConnection();
		ArrayList<Learnlogforinfo> onlesson = new LearnLogDao().getlessonLog3_1(user,conn);
		close(conn);
		return onlesson;
	}

	public ArrayList<Learnlogforinfo> getlessonLog4_1(int user) {
		Connection conn = getConnection();
		ArrayList<Learnlogforinfo> onlesson = new LearnLogDao().getlessonLog4_1(user,conn);
		
		
		close(conn);
		return onlesson;
	}

	public int summitLesson(int parseInt, int parseInt2, int i) {
		Connection conn = getConnection();
		int result=new LearnLogDao().summitLesson(conn,parseInt,parseInt2,i);
		
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		
		return result;
	}

	public int finishstudent(int parseInt, int parseInt2, int parseInt3) {
		Connection conn = getConnection();
		int result=new LearnLogDao().finishstudent(conn,parseInt,parseInt2,parseInt3);
		
		if(result>0)
			commit(conn);
		else 
			rollback(conn);
		close(conn);
		
		return result;
	}

	public int checkLesson(int parseInt, int parseInt2, int parseInt3) {
		Connection conn = getConnection();
		int result=new LearnLogDao().checkLesson(conn,parseInt,parseInt2,parseInt3);
		
		close(conn);
		
		return result;
	}

	public ArrayList<LearnLogAdmin> auLessona(int lesson_no) {
		Connection con = getConnection();
		ArrayList<LearnLogAdmin> lessona = new LearnLogDao().auLessona(con,lesson_no);
		close(con);
		
		return lessona;
	}

	public int changeStatelesson(int parseInt) {
	
		Connection conn = getConnection();
		int result=new LearnLogDao().changeStatelesson(conn,parseInt);
		
		close(conn);
		
		return result;
		
	
	}
	
}
