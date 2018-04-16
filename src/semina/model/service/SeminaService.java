package semina.model.service;

import semina.model.dao.SeminaDao;
import semina.model.vo.Semina;
import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import lesson.model.dao.LessonDao;
import lesson.model.vo.Lesson;
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
		Semina semi=  new SeminaDao().getseminabyno1(con,seminano);
		close(con);
		return semi;
	}

	public int enrollseminabyuser(int seminano,int studentno) {

		Connection con=getConnection();
		int result= new SeminaDao().enrollseminabyuser(con,seminano,studentno);
		if(result>0) {
			commit(con);
		System.out.println("세미나에 신청완료");
		}else
			rollback(con);
		close(con);
		return result;
		
		
		
		
	}

	public int seminaupnow(int seminano) {
		Connection con=getConnection();
		int result= new SeminaDao().seminaupnow(con,seminano);
		if(result>0) {
			commit(con);
		System.out.println("세미나 현재인원 상승완료");
		}else
			rollback(con);
		close(con);
		return result;
		
	}

	public ArrayList<Semina> getSeminaInfoByuserNo(int user) {
		Connection con=getConnection();
		ArrayList<Semina> semi=new SeminaDao().getSeminaInfoByuserNo(con,user);
		close(con);
		
		return semi;
	}

	public int stopsemina(int parseInt) {
		//세미나 중단.
		Connection con=getConnection();
		int result= new SeminaDao().stopsemina(con,parseInt);
		if(result>0)
			commit(con);
		else 
			rollback(con);
		close(con);
		
		return result;
	}

	public int updateSemina(Semina semi) {
		Connection con=getConnection();
		int result= new SeminaDao().updateSemina(con,semi);
		if(result>0)
			commit(con);
		else 
			rollback(con);
		close(con);
		

		return result;
	}

	public ArrayList<Semina> aSeminaList() {
		Connection con = getConnection();
		ArrayList<Semina> semina = new SeminaDao().aSeminaList(con);
		close(con);
		return semina;
	}

	public Semina auSemina(int semina_no) {
		Connection con = getConnection();
		Semina semina = new SeminaDao().auSemina(con, semina_no);
		close(con);
		return semina;
	}

	public int adminUpdateSemina(int seminano, String value, int type) {
		Connection con = getConnection();
		int result = new SeminaDao().adminUpdateSemina(con,seminano,value,type);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
			System.out.println("수정실패!");
		
		}
		close(con);
		return result;
	}

	public ArrayList<Semina> aSearchSemina(String str, int option) {
		Connection con = getConnection();
		ArrayList<Semina> semina = new SeminaDao().aSearchSemina(con,str,option);
		close(con);
		return semina;
	}



}
