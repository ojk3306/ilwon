package categorys.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import static common.JDBCTemplate.*;
import categorys.model.vo.Categorys;

public class CategorysDao {

	public ArrayList<Categorys> getclist(Connection con) {
		
		ArrayList<Categorys> clist=new ArrayList<Categorys>();
		PreparedStatement pstmt=null;
		ResultSet rset= null;
		
		String query="select * from CATEGORYS where CATEGORY_SMALL is not null";
		
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
			
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return clist;
	}
	
	public ArrayList<String> getBigCategory(Connection con) {
		
		ArrayList<String> al = new ArrayList<String>();
		PreparedStatement pstmt=null;
		ResultSet rset= null;
		
		String query="select CATEGORY_BIG from CATEGORYS where category_small is not null group by CATEGORY_BIG";
		
		try {
			
			pstmt=con.prepareStatement(query);
			rset=pstmt.executeQuery();
			
			while(rset.next()) {			
				al.add(rset.getString(1));			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("getBigCategory : " + al + " / (To.CategoryDao)");
		return al;
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

	public int updatesmall(Connection con, Categorys cup) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="update  categorys  set CATEGORY_SMALL = ? where category_no= ?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,cup.getCATEGORY_SMALL());
			pstmt.setInt(2,cup.getCATEGORY_NO());
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deletecate(Connection con, String parameter) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="delete from CATEGORYS where category_no= ?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,Integer.parseInt(parameter));
			result=pstmt.executeUpdate();
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int addbigcate(Connection con, String parameter) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="INSERT INTO CATEGORYS VALUES ((select max(CATEGORY_NO)+1 from CATEGORYS),?,null,'')";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,parameter);
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public int addsmallcate(Connection con, Categorys cate) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="INSERT INTO CATEGORYS VALUES ((select max(CATEGORY_NO)+1 from CATEGORYS),?,?,'')";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,cate.getcATEGORY_BIG());
			pstmt.setString(2,cate.getCATEGORY_SMALL());
			result=pstmt.executeUpdate();
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Categorys selectgategoryBysmallcate(Connection con1, Categorys cate) {
		PreparedStatement pstmt=null;
		ResultSet rset= null;
		
		String sql="select * from CATEGORYS where CATEGORY_NO = (select max(CATEGORY_NO) from CATEGORYS )";
		
		try {
			pstmt=con1.prepareStatement(sql);
			rset=pstmt.executeQuery();
			if(rset.next()) {
			cate=new Categorys();
			cate.setCATEGORY_NO(rset.getInt("CATEGORY_NO"));
			cate.setcATEGORY_BIG(rset.getString("CATEGORY_BIG"));
			cate.setCATEGORY_SMALL(rset.getString("CATEGORY_SMALL"));
			cate.setCATEGORY_HIT(rset.getInt("CATEGORY_HIT"));
			}else {
			cate=null;	
			}
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
		System.out.println("dao에서 ="+cate.toString());
		
		return cate;
	}

	

}
