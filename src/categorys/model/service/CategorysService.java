package categorys.model.service;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import categorys.model.vo.Categorys;

public class CategorysService {

	public ArrayList<Categorys> getclist() {
	Connection con=getConnection();
	ArrayList<Categorys> clit=new categorys.model.dao.CategorysDao().getclist(con);
	close(con);
	return clit;
	}

	public ArrayList<String> getlistcount() {
		
		Connection con=getConnection();
		ArrayList<String> listcount=new categorys.model.dao.CategorysDao().getbig(con);
		close(con);

		
		return listcount;
	}

}
