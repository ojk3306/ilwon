package seach_log.model.service;

import static common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;

import seach_log.model.dao.Seach_logDao;

import seach_log.model.vo.Seach_log;


public class Seach_logService {
	public Seach_logService() {}

	
	
	public int insertlog(Seach_log sl) {
		Connection con = getConnection();
		int result = new Seach_logDao().insertlog(con,sl);
		System.out.println("reuslt="+result);
		if(result>0)
			commit(con);
		else 
			rollback(con);
		close(con);
		return result;
	}




}








