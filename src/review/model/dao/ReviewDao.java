package review.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import review.model.vo.Review;
public class ReviewDao {
	
	public ReviewDao() {}

	public ArrayList<Review> previewReview(Connection conn, int lesson_no) {
		ArrayList<Review> review = new ArrayList<Review>(); 
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = 
				"select r.*, u.user_name from review r, users u where lesson_no = ? and r.user_no = u.user_no order by r.review_no desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, lesson_no);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Review r = new Review();
				r.setReviewNo(rset.getInt("review_no"));
				r.setReviewDate(rset.getDate("review_date"));
				r.setReviewContent(rset.getString("review_content"));
				r.setReviewPrepare(rset.getInt("review_prepare"));
				r.setReviewSincerity(rset.getInt("review_sincerity"));
				r.setReviewDelivery(rset.getInt("review_delivery"));
				r.setUserNO(rset.getInt("user_no"));
				r.setUserName(rset.getString("user_name"));
				System.out.println(r.toString());
				review.add(r);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
			
		}
		
		return review;
		
		
		

	}
	
}