package review.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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
	
}
