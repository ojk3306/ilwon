package notice.model.dao;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import static common.JDBCTemplate.*;

import notice.model.vo.Notice;

public class NoticeDao {
	
public NoticeDao() {
		
	}

	public ArrayList<Notice> selectList(Connection con, int currentPage, int limit) {
			
		ArrayList<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from notice n, users u "
						+ "where n.user_no = u.user_no "
						+ "and rownum >= ? "
						+ "and rownum <= ? "
						+ "order by n.notice_no desc";
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setUserNo(rset.getInt("user_no"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setUserName(rset.getString("user_name"));
				n.setNoticeDate(rset.getDate("notice_date"));
				n.setNoticeContent(rset.getString("notice_content"));				
				
				list.add(n);				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("Daolist : " + list + " / (To.NoticeDao)");
		return list;		
	}
	
	public Notice selectNotice(Connection con, int noticeNo) {
		
		Notice notice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * "
				+ "from notice n, users u "
				+ "where notice_no = ? " 
				+ "and n.user_no = u.user_no";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				notice = new Notice();
				notice.setNoticeNo(noticeNo);
				notice.setUserNo(rset.getInt("user_no"));
				notice.setNoticeTitle(rset.getString("notice_title"));
				notice.setUserName(rset.getString("user_name"));
				notice.setNoticeContent(rset.getString("notice_content"));
				notice.setNoticeDate(rset.getDate("notice_date"));				
				
			} else {
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("Daonotice : " + notice + " / (To.NoticeDao)");
		return notice;
	}
	
	public int insertNotice(Connection con, Notice notice) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into notice values "
				+ "((select max(notice_no) from notice) + 1, "
				+ "?, ?, sysdate, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, notice.getUserNo());
			pstmt.setString(2, notice.getNoticeTitle());
			pstmt.setString(3, notice.getNoticeContent());			
			
			System.out.println(notice.getUserNo());
			System.out.println(notice.getNoticeTitle());
			System.out.println(notice.getNoticeContent());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println("Daoresult : " + result + " / (To.NoticeDao)");
		return result;
	}
	
	public int updateNotice(Connection con, Notice notice) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "update notice set notice_title = ?,"
						+ "notice_content = ? "
						+ "where notice_no = ?"; 
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());
			pstmt.setInt(3, notice.getNoticeNo());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("Daoresult : " + result + " / (To.NoticeDao)");
		return result;
	}

	public int deleteNotice(Connection con, int noticeNo) {
	
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "delete from notice where notice_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("Daoresult : " + result + " / (To.NoticeDao)");
		return result;
	}
	
	public ArrayList<Notice> selectSearchTitle(Connection con, String keyword) {
		ArrayList<Notice> list = new ArrayList<Notice>();		
		
		return list;
	}
	
	public ArrayList<Notice> selectSearchDate(Connection con, Date start, Date end) {
		ArrayList<Notice> list = new ArrayList<Notice>();		
		
		return list;
	}
	
	public ArrayList<Notice> selectSearchWriter(Connection con, String keyword) {
		ArrayList<Notice> list = new ArrayList<Notice>();		
		
		return list;
	}
	
public ArrayList<Notice> selectMainNotice(Connection con) {
		
		ArrayList<Notice> list = new ArrayList<Notice>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * "
						+ "from (select * "
								+ "from notice "
								+ "order by notice_date desc) n, users u "
						+ "where rownum <= 8 "
						+ "and n.user_no = u.user_no";
				
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeDate(rset.getDate("notice_date"));
				n.setUserName(rset.getString("user_name"));
				n.setNoticeContent(rset.getString("notice_content"));				
				
				list.add(n);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		System.out.println("DaoList : " + list);
		return list;
	}

	public int getListCount(Connection con) {
		
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from notice";
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);				
			} else {
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return listCount;
	}	

}
