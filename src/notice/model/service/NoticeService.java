package notice.model.service;

import static common.JDBCTemplate.*;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;

public class NoticeService {
	
public NoticeService() {
		
	}

	public ArrayList<Notice> selectList(int currentPage, int limit) {	
		
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(con, currentPage, limit);
		
		close(con);
		
		System.out.println("ServiceResult : " + list + " / (To.NoticeService)");
		return list;
	}
	
	public Notice selectNotice(int noticeNo) {
		
		Connection con = getConnection();
		Notice notice = new NoticeDao().selectNotice(con, noticeNo);
		close(con);
		
		System.out.println("ServiceResult : " + notice + " / (To.NoticeService)");
		return notice;
	}
	
	public int insertNotice(Notice notice) {
		Connection con = getConnection();
		int result = new NoticeDao().insertNotice(con, notice);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		System.out.println("ServiceResult : " + result + " / (To.NoticeService)");
		return result;
	}
	
	public int updateNotice(Notice notice) {
		
		Connection con = getConnection();
		int result = new NoticeDao().updateNotice(con, notice);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		System.out.println("ServiceResult : " + result + " / (To.NoticeService)");
		return result;
	}

	public int deleteNotice(int noticeNo) {
	
		Connection con = getConnection();
		int result = new NoticeDao().deleteNotice(con, noticeNo);
		if(result > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		System.out.println("ServiceResult : " + result + " / (To.NoticeService)");
		return result;
	}
	
	public ArrayList<Notice> selectSearchTitle(String keyword) {
		
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectSearchTitle(con, keyword);
		close(con);
		
		System.out.println("ServiceResult : " + list + " / (To.NoticeService)");
		return list;
	}
	
	public ArrayList<Notice> selectSearchDate(Date start, Date end) {
		
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectSearchDate(con, start, end);
		close(con);
		
		System.out.println("ServiceResult : " + list + " / (To.NoticeService)");
		return list;
	}
	
	public ArrayList<Notice> selectSearchWriter(String keyword) {
		
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectSearchWriter(con, keyword);
		close(con);
		
		System.out.println("ServiceResult : " + list + " / (To.NoticeService)");
		return list;
	}
	
	public ArrayList<Notice> selectMainNotice() {
		
		Connection con = getConnection();		
		ArrayList<Notice> list = new NoticeDao().selectMainNotice(con);
		close(con);
		
		System.out.println("ServiceList : " + list);
		return list;
	}
	
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new NoticeDao().getListCount(con);
		close(con);
				
		return listCount;
	}

}
