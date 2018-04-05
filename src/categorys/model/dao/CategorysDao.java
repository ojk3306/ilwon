package categorys.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import static common.JDBCTemplate.*;
import categorys.model.vo.Categorys;

public class CategorysDao {

	public ArrayList<Categorys> getclist(Connection con) {
		PreparedStatement pstmt=null;
		ResultSet rset= null;
		ArrayList<Categorys> clist=new ArrayList<Categorys>();
		String query="select * from CATEGORYS";
		
		try {
		pstmt=con.prepareStatement(query);
		rset=pstmt.executeQuery();	
		while(rset.next()) {
			Categorys cate=new Categorys();
			cate.setcATEGORY_BIG(rset.getString("CATEGORY_BIG"));	
			cate.setCATEGORY_HIT(rset.getInt("CATEGORY_HIT"));
			cate.setCATEGORY_NO(rset.getInt("CATEGORY_NO"));
			cate.setCATEGORY_SMALL(rset.getString("CATEGORY_SMALL"));
			clist.add(cate);
		
		}
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return clist;
	}

	public ArrayList<String> getbig(Connection con) {
		PreparedStatement pstmt=null;
		ResultSet rset= null;
		ArrayList<String> al=new ArrayList<String>();
		String query="select CATEGORY_BIG from CATEGORYS group by CATEGORY_BIG";
		try {
			pstmt=con.prepareStatement(query);
			rset=pstmt.executeQuery();
			while(rset.next()) {
			
			al.add(rset.getString(1));
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return al;
	}

}
