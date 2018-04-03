package notice.model.dao;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import static common.JDBCTemplate.*;

import notice.model.vo.Notice;

public class NoticeDao {
	
public NoticeDao() {
		
	}

	public List<Notice> selectList(Connection con) {
		List<Notice> list = new ArrayList<Notice>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from notice order by notice_no desc";
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("notice_no"));
				n.setNoticeTitle(rset.getString("notice_title"));
				n.setNoticeDate(rset.getDate("notice_date"));
				n.setUserNo(rset.getInt("user_no"));
				n.setNoticeContent(rset.getString("notice_content"));				
				
				list.add(n);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
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
		
		return notice;
	}
	
	public int insertNotice(Connection con, Notice notice) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into notice values ("
				+ "(select max(notice_no) from notice) + 1, "
				+ "?, sysdate, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setInt(2, notice.getUserNo());
			pstmt.setString(3, notice.getNoticeContent());
			
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		return result;
	}
	
	public int updateNotice(Connection con, Notice notice) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "update notice set noticetitle = ?,"
						+ "noticecontent = ? "					
						+ "where noticeno = ?"; 
		
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
		
		return result;
	}
	
	public List<Notice> selectSearchTitle(Connection con, String keyword) {
		List<Notice> list = new ArrayList<Notice>();		
		
		return list;
	}
	
	public List<Notice> selectSearchDate(Connection con, Date start, Date end) {
		List<Notice> list = new ArrayList<Notice>();		
		
		return list;
	}
	
	public List<Notice> selectSearchWriter(Connection con, String keyword) {
		List<Notice> list = new ArrayList<Notice>();		
		
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

}
