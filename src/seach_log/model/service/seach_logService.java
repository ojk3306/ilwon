package seach_log.model.service;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

import seach_log.model.dao.seach_logDao;


public class seach_logService {
	public seach_logService() {}

	
	
	public int insertlog(String log) {
		Connection con = getConnection();
		int result = new seach_logDao().insertlog(con,log);
		close(con);
		return 0;
	}




}








