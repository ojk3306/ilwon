package seminaDetail.model.service;

import seminaDetail.model.dao.SeminaDetailDao;
import seminaDetail.model.vo.SeminaDetail;
import seminaDetail.model.vo.SeminaDetailByInfo;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class SeminaDetailService {

	public SeminaDetail getseminadetail(int i, int j) {
		Connection con=getConnection();
		SeminaDetail seminaDetail=new SeminaDetailDao().getseminadetail(con,i,j);
		close(con);
		return seminaDetail;
	}

	public ArrayList<SeminaDetailByInfo> getseminadetail(int parseInt) {
	
		Connection con=getConnection();
		
		ArrayList<SeminaDetailByInfo> seminaDetail=new SeminaDetailDao().getseminadetail(con,parseInt);
		close(con);
		return seminaDetail;
	}

	public int sdcan(int parseInt) {
		Connection con=getConnection();
		int result=new SeminaDetailDao().sdcan(con,parseInt);
		close(con);
		return result;
	}

}
