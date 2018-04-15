package review.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class UpdateReviewServlet
 */
@WebServlet("/updatereview")
public class UpdateReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int review_no = Integer.parseInt(request.getParameter("review_no"));
		Review review = new Review();
		review.setReviewContent(request.getParameter("content"));
		review.setReviewSincerity(Integer.parseInt(request.getParameter("s")));
		review.setReviewDelivery(Integer.parseInt(request.getParameter("d")));
		review.setReviewPrepare(Integer.parseInt(request.getParameter("p")));
		int result =  new ReviewService().updateReview(review_no,review);
		
		response.setContentType("text/html; charset=utf-8"); 
		if(result > 0) {
			
			 PrintWriter out = response.getWriter();
			 String str="";
			   str = "<script language='javascript'>";
			   str += "opener.window.location.reload();";  
			   str += "self.close();";  
			   str += "alert('수정되었습니다');";
			    str += "</script>";
			   out.print(str);
			
		}else {
			
			//error page
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
