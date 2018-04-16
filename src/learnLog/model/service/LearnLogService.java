package learnLog.model.service;

import java.sql.*;
import java.util.ArrayList;

import learnLog.model.dao.LearnLogDao;
import learnLog.model.vo.LearnLog;
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
	
}
