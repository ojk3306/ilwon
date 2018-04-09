package seminaDetail.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import seminaDetail.model.vo.SeminaDetail;
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
			semideta.setSeminaState(rset.getString("SEMINA_STATE"));
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

}
