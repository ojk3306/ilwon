package lesson.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lesson.model.service.LessonService;
import lesson.model.vo.LessonDetail;
import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class LessonDetailServlet
 */
@WebServlet("/lessondetail")
public class LessonDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LessonDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int lesson_no = Integer.parseInt(request.getParameter("no"));
		
		LessonDetail lessondetail = new LessonService().lessonView(lesson_no);
		ArrayList<Review> review = new ReviewService().previewReview(lesson_no);
		//일단 리뷰 전부다 가져옴!
		int sumd = 0;
		int sump = 0;
		int sums = 0;
		int count = 0;
		double avga = 0;
		int avgd= 0;
		int avgs= 0;
		int avgp= 0;
		
		//리뷰 평점 구하기
		for(Review i : review) {
			sumd += i.getReviewDelivery();
			sump += i.getReviewPrepare();
			sums += i.getReviewSincerity();
			
			count++;
		}
		if(sumd != 0 && sump != 0 && sums != 0) {
		avgd= sumd/count;
		avgp= sump/count;
		avgs= sums/count;
		avga= (double)(avgd+avgp+avgs)/3;
		}else {
			avgd= 0;
			avgp= 0;
			avgs= 0;
			avga= 0;	
		}
		System.out.println("카운트는"+count+"avgd="+avgd+"avgp="+avgp+"avgs="+avgs+"avga="+avga);
		
		response.setContentType("text/html; charset=utf-8"); 
		RequestDispatcher view =null;
		if(lessondetail != null || review != null) {
			view = request.getRequestDispatcher("04.OJK/teacherdetail.jsp");
			request.setAttribute("lessondetail", lessondetail);
			request.setAttribute("review", review);
			request.setAttribute("avgd", avgd);
			request.setAttribute("avgp", avgp);
			request.setAttribute("avgs", avgs);
			request.setAttribute("avga", avga);
			view.forward(request, response);
			
		}else if(lessondetail != null || review == null){
			view = request.getRequestDispatcher("04.OJK/teacherdetail.jsp");
			request.setAttribute("lessondetail", lessondetail);
			request.setAttribute("review", 0);
			avgd=0;
			avgp=0;
			avgs=0;
			avga=0;
			request.setAttribute("avgd", avgd);
			request.setAttribute("avgp", avgp);
			request.setAttribute("avgs", avgs);
			request.setAttribute("avga", avga);
			view.forward(request, response);
			
			
		}else {
//에러페이지 만들자
			view = request.getRequestDispatcher("#");
			request.setAttribute("message","강의조회 실패");
			view.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
