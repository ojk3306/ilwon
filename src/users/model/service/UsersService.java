package users.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import users.model.*;
import users.model.dao.UsersDao;
import users.model.vo.User;
public class UsersService {

	public UsersService() {}

	public int checkEmail(String email) {
		Connection con = getConnection();
		int result = new UsersDao().checkEmail(con,email);
		close(con);
		return result;
	}

	public int insertUsers(User user) {
		Connection con = getConnection();
		int result = new UsersDao().insertUsers(con,user);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		return result;
	}
	
	
	
	
	
	
}
