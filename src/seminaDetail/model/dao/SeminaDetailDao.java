package seminaDetail.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import seminaDetail.model.vo.SeminaDetail;
import seminaDetail.model.vo.SeminaDetailByInfo;

import static common.JDBCTemplate.*;
public class SeminaDetailDao {

	public SeminaDetail getseminadetail(Connection con, int i, int j) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		SeminaDetail semideta=null;
		String sql="select * from SEMINA_DETAIL where SEMINA_NO=? and USER_NO=?";
		
		System.out.println("세미나 디테일 DAO : "+i+"....."+j);
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, i);
			pstmt.setInt(2, j);
			rset=pstmt.executeQuery();
			if(rset.next()) {
			semideta=new SeminaDetail();
			semideta.setSeminaDetailDate(rset.getDate("SEMINA_DETAIL_DATE"));
			semideta.setSeminaDetailNo(rset.getInt("SEMINA_DETAIL_NO"));
			semideta.setSeminaNo(rset.getInt("SEMINA_NO"));
			semideta.setSeminaState(rset.getString("SEMINA_DETAIL_STATE"));
			semideta.setUserNo(rset.getInt("USER_NO"));			
			}
			
		} catch (Exception e) {
	
		}finally {
			close(rset);
			close(pstmt);
		}
		try {
		System.out.println(semideta.toString());

		} catch(NullPointerException e2) {
			System.out.println("현 로그인한 사람이 세미나를 신청하지 않음.");	
			semideta=new SeminaDetail();
			semideta.setSeminaState("4");
		}
		
		
	return semideta;
	}

	public ArrayList<SeminaDetailByInfo> getseminadetail(Connection con, int parseInt) {
		PreparedStatement pstmt=null;
		ResultSet rset=null;
		SeminaDetailByInfo sa=null;
		
		ArrayList<SeminaDetailByInfo> al=new ArrayList<SeminaDetailByInfo>();
		String sql="select * from SEMINA , SEMINA_DETAIL , users where SEMINA.USER_NO=users.USER_NO and SEMINA_DETAIL.SEMINA_NO = SEMINA.SEMINA_NO and semina.SEMINA_STATE=1 and  SEMINA_DETAIL.USER_NO = ?";
		
		try {
			
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, parseInt);
			rset=pstmt.executeQuery();
			while(rset.next()) {
			sa=new SeminaDetailByInfo();
			sa.setSEMINA_DETAIL_NO(rset.getInt("SEMINA_DETAIL_NO"));
			sa.setSEMINA_DETAIL_STATE(rset.getInt("SEMINA_DETAIL_STATE"));
			sa.setSEMINA_ENDDATE(rset.getString("SEMINA_ENDDATE"));
			sa.setSEMINA_LOCATION(rset.getString("SEMINA_LOCATION"));
			sa.setSEMINA_NO(rset.getInt("SEMINA_NO"));
			sa.setSEMINA_NOW(rset.getInt("SEMINA_NOW"));
			sa.setSEMINA_STATE(rset.getInt("SEMINA_STATE"));
			sa.setSEMINA_TITLE(rset.getString("SEMINA_TITLE"));
			sa.setUSER_NO(rset.getInt("USER_NO"));//강의진행자의 유저번호
			sa.setUSER_PHONE(rset.getString("USER_PHONE"));
			System.out.println(sa.toString());
			al.add(sa);
			}
	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
	return al;
	}

	public int sdcan(Connection con, int parseInt) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql="update SEMINA_DETAIL set SEMINA_DETAIL_STATE = 2 where SEMINA_DETAIL_NO = ?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,parseInt);
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
