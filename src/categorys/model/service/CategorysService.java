package categorys.model.service;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import categorys.model.dao.CategorysDao;
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

	public int updatesmall(Categorys cup) {
		Connection con=getConnection();
		int result=new CategorysDao().updatesmall(con,cup);
		if(result>0)
			commit(con);
		else
			rollback(con);
		close(con);
		
		return result;
		
		
	}

	public int deletecate(String parameter) {
		
		Connection con=getConnection();
		int result=new CategorysDao().deletecate(con,parameter);
		if(result>0)
			commit(con);
		else
			rollback(con);
		close(con);
		
		return result;
		
		
	}

	public int addbigcate(String parameter) {
		Connection con=getConnection();
		int result=new CategorysDao().addbigcate(con,parameter);
		if(result>0)
			commit(con);
		else
			rollback(con);
		close(con);
		
		return result;
	}

	public Categorys addsmallcate(Categorys cate) {
		Connection con=getConnection();
		int result=new CategorysDao().addsmallcate(con,cate);
		if(result>0)
			commit(con);
		else
			rollback(con);
		close(con);
		
		Connection con1=getConnection();
	
		Categorys cc=new CategorysDao().selectgategoryBysmallcate(con1,cate);
		
		if(cc!=null)
			commit(con);
		else
			rollback(con);
		close(con);
		
		
		return cc;
	}

}
