package semina.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import semina.model.vo.Semina;
import static common.JDBCTemplate.*;
public class SeminaDao {

	public int insertSemina(Connection con, Semina semi) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="insert into SEMINA values((select max(SEMINA_NO)+1 from SEMINA),?,?,?,?,sysdate,?,?,?,?,?,?,?,?,?,?,0,?,?,?  )";
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

}
