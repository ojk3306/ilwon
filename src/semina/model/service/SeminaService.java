package semina.model.service;

import semina.model.dao.SeminaDao;
import semina.model.vo.Semina;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import oracle.net.aso.s;
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

	public int getlistcount() {
		Connection con=getConnection();
		int result=new SeminaDao().getlistcount(con);
		close(con);
		return result;
	}

	public ArrayList<Semina> getseminalist(int limit, int listCount) {
		Connection con=getConnection();
		ArrayList<Semina> al= new SeminaDao().getseminalist(con,limit,listCount);
		
		close(con);
		return al;
	}

	public ArrayList<Semina> getallsemi() {
		Connection con=getConnection();
		ArrayList<Semina> al= new SeminaDao().getallsemi(con);
		
		close(con);
		return al;
	}

	public ArrayList<Semina> getPopular() {
		Connection con=getConnection();
		ArrayList<Semina> al= new SeminaDao().getPopular(con);
		
		close(con);
		return al;
	}

	public int getlistcountBySearch(String search) {
		Connection con=getConnection();
		int al= new SeminaDao().getlistcountBySearch(con,search);
		
		close(con);
		return al;
	}

	public ArrayList<Semina> getseminalistbysearch(int limit, int currentPage, String search) {
		
		Connection con=getConnection();
		ArrayList<Semina> al= new SeminaDao().getseminalistbysearch(con,limit,currentPage,search);
		
		close(con);
		return al;
		
		
		
	}

	public Semina getseminabyno(int seminano) {
		Connection con=getConnection();
		Semina semi=  new SeminaDao().getseminabyno(con,seminano);
		close(con);
		return semi;
	}

}
