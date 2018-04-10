package learnLog.model.service;

import java.sql.*;
import java.util.ArrayList;

import learnLog.model.dao.LearnLogDao;
import learnLog.model.vo.LearnLog;

import static common.JDBCTemplate.*;

public class LearnLogService {

	public LearnLogService() {}

	public ArrayList<LearnLog> onlesson(int user) {
		Connection conn = getConnection();
		ArrayList<LearnLog> onlesson = new LearnLogDao().onlesson(user,conn);
		
		
		close(conn);
		return onlesson;
	}
	
}
