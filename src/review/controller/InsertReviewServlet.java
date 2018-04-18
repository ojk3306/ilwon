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
 * Servlet implementation class InsertReviewServlet
 */
@WebServlet("/insertr")
public class InsertReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Review review = new Review();
		String content = request.getParameter("content");
		content = content.replace("\r\n", "<br>");
		review.setLessonNo(Integer.parseInt(request.getParameter("lesson_no")));
		review.setUserNO(Integer.parseInt(request.getParameter("user_no")));
		review.setReviewSincerity(Integer.parseInt(request.getParameter("s")));
		review.setReviewDelivery(Integer.parseInt(request.getParameter("d")));
		review.setReviewPrepare(Integer.parseInt(request.getParameter("p")));
		review.setReviewContent(content);
		
		int result = new ReviewService().insertReview(review);
		
		response.setContentType("text/html; charset=utf-8"); 
		if(result > 0) {
			
			 PrintWriter out = response.getWriter();
			 String str="";
			   str = "<script language='javascript'>";
			   str += "opener.window.location.reload();";  //�삤�봽�꼫 �깉濡쒓퀬移�
			   str += "self.close();";   // 李쎈떕湲�
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
