package review.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import review.model.dao.ReviewDao;
import review.model.vo.Review;
public class ReviewService {

	public ReviewService() {}

	public ArrayList<Review> previewReview(int lesson_no) {
		Connection conn = getConnection();
		
		ArrayList<Review> previewReview = new ReviewDao().previewReview(conn, lesson_no);
		
		close(conn);
		
		return previewReview;
	}

	public int insertReview(Review review) {
		Connection con = getConnection();
		int result = new ReviewDao().insertReview(con,review);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}

	public int deleteReview(int review_no) {
		Connection con = getConnection();
		int result = new ReviewDao().deleteReview(con,review_no);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}

	public int updateReview(int review_no, Review review) {
		
		Connection con = getConnection();
		int result = new ReviewDao().updateReview(con,review_no,review); 
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		return result;
	}

	


	
}
