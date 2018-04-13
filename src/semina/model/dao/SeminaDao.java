package semina.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javafx.scene.Parent;
import oracle.net.aso.p;
import semina.model.vo.Semina;
import static common.JDBCTemplate.*;
public class SeminaDao {

	public int insertSemina(Connection con, Semina semi) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="insert into SEMINA values((select max(SEMINA_NO)+1 from SEMINA),?,?,?,?,sysdate,?,?,?,?,?,?,?,?,?,?,0,?,?,?,'1')";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, semi.getUserNo());
			pstmt.setString(2,semi.getSeminaTitle());
			pstmt.setString(3,semi.getSeminaLocation());
			pstmt.setInt(4,semi.getSeminaPrice());
			pstmt.setString(5,semi.getSeminatitle1());
			pstmt.setString(6,semi.getSeminaContent1());
			pstmt.setString(7,semi.getSeminatitle2() );
			pstmt.setString(8, semi.getSeminaContent2());
			pstmt.setString(9, semi.getSeminatitle3());
			pstmt.setString(10, semi.getSeminaContent3());
			pstmt.setString(11, semi.getSeminatitle4());
			pstmt.setString(12, semi.getSeminaContent4());
			pstmt.setDate(13, semi.getSeminaEndDate());
			pstmt.setInt(14, semi.getSeminaMin());
			pstmt.setInt(15, semi.getSeminaMax());
			pstmt.setString(16, semi.getSeminaOriginalFileName());
			pstmt.setString(17, semi.getSeminaRenameFileName());
			result=pstmt.executeUpdate();
			} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int getlistcount(Connection con) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		int result=0;
		String sql="select count(*) from semina";
		try {
			pstmt=con.prepareStatement(sql);
			rset=pstmt.executeQuery();
			if(rset.next())
				result=rset.getInt(1);			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Semina> getseminalist(Connection con, int limit, int currentPage) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Semina> al=new ArrayList<Semina>();
		String sql="select * from (select ROWNUM AS RNUM, A.* FROM   (SELECT * FROM semina where SEMINA_ENDDATE - sysdate > 0 ) A WHERE ROWNUM < ? ) WHERE RNUM >= ? ORDER BY SEMINA_STARTDATE DESC ";
		int startRow = (currentPage - 1) * limit + 1; 
		int endRow = startRow + limit - 1;
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,endRow);
			pstmt.setInt(2,startRow);
			rset=pstmt.executeQuery();
			while(rset.next()) {
			Semina semi=new Semina();
			semi.setSeminaNo(rset.getInt("SEMINA_NO"));
			semi.setUserNo(rset.getInt("USER_NO"));
			semi.setSeminaTitle(rset.getString("SEMINA_TITLE"));
			semi.setSeminaLocation(rset.getString("SEMINA_LOCATION"));
			semi.setSeminaPrice(rset.getInt("SEMINA_PRICE"));
			semi.setSeminaStartDate(rset.getDate("SEMINA_STARTDATE"));
			
			semi.setSeminatitle1(rset.getString("SEMINA_TITLE1"));
			semi.setSeminaContent1(rset.getString("SEMINA_CONTENT1"));
			
			semi.setSeminatitle2(rset.getString("SEMINA_TITLE2"));
			semi.setSeminaContent2(rset.getString("SEMINA_CONTENT2"));
			
			semi.setSeminatitle3(rset.getString("SEMINA_TITLE3"));
			semi.setSeminaContent3(rset.getString("SEMINA_CONTENT3"));
			
			semi.setSeminatitle4(rset.getString("SEMINA_TITLE4"));
			semi.setSeminaContent4(rset.getString("SEMINA_CONTENT4"));

			semi.setSeminaEndDate(rset.getDate("SEMINA_ENDDATE"));
			
			semi.setSeminaMin(rset.getInt("SEMINA_MIN"));
			semi.setSeminaNow(rset.getInt("SEMINA_NOW"));
			semi.setSeminaMax(rset.getInt("SEMINA_MAX"));
			semi.setSeminaOriginalFileName(rset.getString("SEMINA_ORIGINALFILENAME"));
			semi.setSeminaRenameFileName(rset.getString("SEMINA_RENAMEFILENAME"));
			al.add(semi);
			System.out.println(semi.toString());			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return al;
	}

	public ArrayList<Semina> getallsemi(Connection con) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Semina> al=new ArrayList<Semina>();
		String sql="select * from Semina where SEMINA_ENDDATE - sysdate > 0 and SEMINA_STATE = 1 ";
		
		try {
			pstmt=con.prepareStatement(sql);
			rset=pstmt.executeQuery();
			while(rset.next()) {
			Semina semi=new Semina();
			semi.setSeminaNo(rset.getInt("SEMINA_NO"));
			semi.setUserNo(rset.getInt("USER_NO"));
			semi.setSeminaTitle(rset.getString("SEMINA_TITLE"));
			semi.setSeminaLocation(rset.getString("SEMINA_LOCATION"));
			semi.setSeminaPrice(rset.getInt("SEMINA_PRICE"));
			semi.setSeminaStartDate(rset.getDate("SEMINA_STARTDATE"));
			
			semi.setSeminatitle1(rset.getString("SEMINA_TITLE1"));
			semi.setSeminaContent1(rset.getString("SEMINA_CONTENT1"));
			
			semi.setSeminatitle2(rset.getString("SEMINA_TITLE2"));
			semi.setSeminaContent2(rset.getString("SEMINA_CONTENT2"));
			
			semi.setSeminatitle3(rset.getString("SEMINA_TITLE3"));
			semi.setSeminaContent3(rset.getString("SEMINA_CONTENT3"));
			
			semi.setSeminatitle4(rset.getString("SEMINA_TITLE4"));
			semi.setSeminaContent4(rset.getString("SEMINA_CONTENT4"));

			semi.setSeminaEndDate(rset.getDate("SEMINA_ENDDATE"));
			
			semi.setSeminaMin(rset.getInt("SEMINA_MIN"));
			semi.setSeminaNow(rset.getInt("SEMINA_NOW"));
			semi.setSeminaMax(rset.getInt("SEMINA_MAX"));
			semi.setSeminaOriginalFileName(rset.getString("SEMINA_ORIGINALFILENAME"));
			semi.setSeminaRenameFileName(rset.getString("SEMINA_RENAMEFILENAME"));
			al.add(semi);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return al;
	}

	public ArrayList<Semina> getPopular(Connection con) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Semina> al=new ArrayList<Semina>();
		
		String sql="select * from SEMINA where SEMINA_ENDDATE - sysdate >0 order and SEMINA_STATE = 1 by SEMINA_NOW desc";
		try {
			pstmt=con.prepareStatement(sql);
			rset=pstmt.executeQuery();
			
			int i=0;
			
			while(rset.next()){
			Semina semi=new Semina();
			semi.setSeminaNo(rset.getInt("SEMINA_NO"));
			semi.setUserNo(rset.getInt("USER_NO"));
			semi.setSeminaTitle(rset.getString("SEMINA_TITLE"));
			semi.setSeminaLocation(rset.getString("SEMINA_LOCATION"));
			semi.setSeminaPrice(rset.getInt("SEMINA_PRICE"));
			semi.setSeminaStartDate(rset.getDate("SEMINA_STARTDATE"));
			
			semi.setSeminatitle1(rset.getString("SEMINA_TITLE1"));
			semi.setSeminaContent1(rset.getString("SEMINA_CONTENT1"));
			
			semi.setSeminatitle2(rset.getString("SEMINA_TITLE2"));
			semi.setSeminaContent2(rset.getString("SEMINA_CONTENT2"));
			
			semi.setSeminatitle3(rset.getString("SEMINA_TITLE3"));
			semi.setSeminaContent3(rset.getString("SEMINA_CONTENT3"));
			
			semi.setSeminatitle4(rset.getString("SEMINA_TITLE4"));
			semi.setSeminaContent4(rset.getString("SEMINA_CONTENT4"));

			semi.setSeminaEndDate(rset.getDate("SEMINA_ENDDATE"));
			
			semi.setSeminaMin(rset.getInt("SEMINA_MIN"));
			semi.setSeminaNow(rset.getInt("SEMINA_NOW"));
			semi.setSeminaMax(rset.getInt("SEMINA_MAX"));
			semi.setSeminaOriginalFileName(rset.getString("SEMINA_ORIGINALFILENAME"));
			semi.setSeminaRenameFileName(rset.getString("SEMINA_RENAMEFILENAME"));
			al.add(semi);
			i++;
			if(i>=4)
			break;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return al;
	}

	public int getlistcountBySearch(Connection con, String search) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		int result=0;
		String sql="select count(*) from semina where (SEMINA_TITLE like ? or user_no in(select user_no from users where user_name like ? )) and  SEMINA_ENDDATE - sysdate > 0";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,"%"+search+"%");
			pstmt.setString(2,"%"+search+"%");
			rset=pstmt.executeQuery();
			if(rset.next())
				result=rset.getInt(1);			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Semina> getseminalistbysearch(Connection con, int limit, int currentPage, String search) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		ArrayList<Semina> al=new ArrayList<Semina>();
		String sql="select * from (select ROWNUM AS RNUM, A.* FROM   (select * from semina where (SEMINA_TITLE like ? or user_no in(select user_no from users where user_name like ? )) and  SEMINA_ENDDATE - sysdate > 0 and SEMINA_STATE = 1) A WHERE ROWNUM < ? ) WHERE RNUM >= ? ORDER BY SEMINA_STARTDATE DESC";
		int startRow = (currentPage - 1) * limit + 1; 
		int endRow = startRow + limit - 1;
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,"%"+search+"%");
			pstmt.setString(2,"%"+search+"%");
			pstmt.setInt(3,endRow);
			pstmt.setInt(4,startRow);
			rset=pstmt.executeQuery();
			while(rset.next()) {
			Semina semi=new Semina();
			semi.setSeminaNo(rset.getInt("SEMINA_NO"));
			semi.setUserNo(rset.getInt("USER_NO"));
			semi.setSeminaTitle(rset.getString("SEMINA_TITLE"));
			semi.setSeminaLocation(rset.getString("SEMINA_LOCATION"));
			semi.setSeminaPrice(rset.getInt("SEMINA_PRICE"));
			semi.setSeminaStartDate(rset.getDate("SEMINA_STARTDATE"));
			
			semi.setSeminatitle1(rset.getString("SEMINA_TITLE1"));
			semi.setSeminaContent1(rset.getString("SEMINA_CONTENT1"));
			
			semi.setSeminatitle2(rset.getString("SEMINA_TITLE2"));
			semi.setSeminaContent2(rset.getString("SEMINA_CONTENT2"));
			
			semi.setSeminatitle3(rset.getString("SEMINA_TITLE3"));
			semi.setSeminaContent3(rset.getString("SEMINA_CONTENT3"));
			
			semi.setSeminatitle4(rset.getString("SEMINA_TITLE4"));
			semi.setSeminaContent4(rset.getString("SEMINA_CONTENT4"));
			semi.setSeminaEndDate(rset.getDate("SEMINA_ENDDATE"));
			semi.setSeminaMin(rset.getInt("SEMINA_MIN"));
			semi.setSeminaNow(rset.getInt("SEMINA_NOW"));
			semi.setSeminaMax(rset.getInt("SEMINA_MAX"));
			semi.setSeminaOriginalFileName(rset.getString("SEMINA_ORIGINALFILENAME"));
			semi.setSeminaRenameFileName(rset.getString("SEMINA_RENAMEFILENAME"));
			al.add(semi);
			System.out.println(semi.toString());			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return al;
		
		
		
		
		
		
		
		
		
		
	}

	public Semina getseminabyno(Connection con, int seminano) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Semina semi=null;
		String sql="select * from Semina where USER_NO= ? and SEMINA_STATE = 1 ";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,seminano);
			rset=pstmt.executeQuery();
			if(rset.next())
			{  
				semi=new Semina();
				semi.setSeminaNo(rset.getInt("SEMINA_NO"));
				semi.setUserNo(rset.getInt("USER_NO"));
				semi.setSeminaTitle(rset.getString("SEMINA_TITLE"));
				semi.setSeminaLocation(rset.getString("SEMINA_LOCATION"));
				semi.setSeminaPrice(rset.getInt("SEMINA_PRICE"));
				semi.setSeminaStartDate(rset.getDate("SEMINA_STARTDATE"));
				
				semi.setSeminatitle1(rset.getString("SEMINA_TITLE1"));
				semi.setSeminaContent1(rset.getString("SEMINA_CONTENT1"));
				
				semi.setSeminatitle2(rset.getString("SEMINA_TITLE2"));
				semi.setSeminaContent2(rset.getString("SEMINA_CONTENT2"));
				
				semi.setSeminatitle3(rset.getString("SEMINA_TITLE3"));
				semi.setSeminaContent3(rset.getString("SEMINA_CONTENT3"));
				
				semi.setSeminatitle4(rset.getString("SEMINA_TITLE4"));
				semi.setSeminaContent4(rset.getString("SEMINA_CONTENT4"));
				semi.setSeminaEndDate(rset.getDate("SEMINA_ENDDATE"));
				semi.setSeminaMin(rset.getInt("SEMINA_MIN"));
				semi.setSeminaNow(rset.getInt("SEMINA_NOW"));
				semi.setSeminaMax(rset.getInt("SEMINA_MAX"));
				semi.setSeminaOriginalFileName(rset.getString("SEMINA_ORIGINALFILENAME"));
				semi.setSeminaRenameFileName(rset.getString("SEMINA_RENAMEFILENAME"));
				System.out.println(semi.toString());
			}
		} catch (Exception e) {
		e.printStackTrace();	
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return semi;
	}

	public int enrollseminabyuser(Connection con, int seminano,int studentno) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="insert into SEMINA_DETAIL values((select max(SEMINA_DETAIL_NO)+1 from SEMINA_DETAIL),?,?,sysdate,1)";
		System.out.println("세미 언롤 DAO:" + seminano+".."+studentno);
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, seminano);
			pstmt.setInt(2, studentno);
			result=pstmt.executeUpdate();
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int seminaupnow(Connection con, int seminano) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="update semina set SEMINA_NOW = (select max(SEMINA_NOW)+1 from SEMINA where SEMINA_NO=? ) where SEMINA_NO=?";
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, seminano);
			pstmt.setInt(2, seminano);
			result=pstmt.executeUpdate();
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
		close(pstmt);
		}
		
		return result;
	}

	public Semina getSeminaInfoByuserNo(Connection con, int user) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		Semina semi=null;
		String sql="select * from semina where USER_NO = ? and SEMINA_ENDDATE-sysdate > 0 and SEMINA_STATE = 1";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,user);
			rset=pstmt.executeQuery();
			
				if(rset.next())
				{  
					semi=new Semina();
					semi.setSeminaNo(rset.getInt("SEMINA_NO"));
					semi.setUserNo(rset.getInt("USER_NO"));
					semi.setSeminaTitle(rset.getString("SEMINA_TITLE"));
					semi.setSeminaLocation(rset.getString("SEMINA_LOCATION"));
					semi.setSeminaPrice(rset.getInt("SEMINA_PRICE"));
					semi.setSeminaStartDate(rset.getDate("SEMINA_STARTDATE"));
					
					semi.setSeminatitle1(rset.getString("SEMINA_TITLE1"));
					semi.setSeminaContent1(rset.getString("SEMINA_CONTENT1"));
					
					semi.setSeminatitle2(rset.getString("SEMINA_TITLE2"));
					semi.setSeminaContent2(rset.getString("SEMINA_CONTENT2"));
					
					semi.setSeminatitle3(rset.getString("SEMINA_TITLE3"));
					semi.setSeminaContent3(rset.getString("SEMINA_CONTENT3"));
					
					semi.setSeminatitle4(rset.getString("SEMINA_TITLE4"));
					semi.setSeminaContent4(rset.getString("SEMINA_CONTENT4"));
					semi.setSeminaEndDate(rset.getDate("SEMINA_ENDDATE"));
					semi.setSeminaMin(rset.getInt("SEMINA_MIN"));
					semi.setSeminaNow(rset.getInt("SEMINA_NOW"));
					semi.setSeminaMax(rset.getInt("SEMINA_MAX"));
					semi.setSeminaOriginalFileName(rset.getString("SEMINA_ORIGINALFILENAME"));
					semi.setSeminaRenameFileName(rset.getString("SEMINA_RENAMEFILENAME"));
					System.out.println(semi.toString());
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		return semi;
	}

	public int stopsemina(Connection con, int parseInt) {
	//세미나 중단하기 dao
		PreparedStatement pstmt=null;
		int result=0;
		String sql="update semina set SEMINA_STATE = 2 where SEMINA_NO = ?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,parseInt);
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
