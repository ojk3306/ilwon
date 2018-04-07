package semina.model.service;

import semina.model.dao.SeminaDao;
import semina.model.vo.Semina;
import static common.JDBCTemplate.*;

import java.sql.Connection;
public class SeminaService {

	public int insertSemina(Semina semi) {
		Connection con=getConnection();
		int result=new SeminaDao().insertSemina(con,semi);
		
		if(result>0) {
		commit(con);
		System.out.println("세미나 인설트 성공");
		}
		else 
		rollback(con);
		close(con);
		return result;
	}

}
