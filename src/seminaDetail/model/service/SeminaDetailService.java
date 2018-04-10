package seminaDetail.model.service;

import seminaDetail.model.dao.SeminaDetailDao;
import seminaDetail.model.vo.SeminaDetail;
import static common.JDBCTemplate.*;

import java.sql.Connection;

public class SeminaDetailService {

	public SeminaDetail getseminadetail(int i, int j) {
		Connection con=getConnection();
		SeminaDetail seminaDetail=new SeminaDetailDao().getseminadetail(con,i,j);
		close(con);
		return seminaDetail;
	}

}
