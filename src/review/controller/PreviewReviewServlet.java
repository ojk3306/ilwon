package review.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import review.model.service.ReviewService;
import review.model.vo.Review;

/**
 * Servlet implementation class PreviewReviewServlet
 */
@WebServlet("/previewreview")
public class PreviewReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PreviewReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int lesson_no = Integer.parseInt(request.getParameter("lesson_no"));
		int avg_rate = 0;
		int count=0;
		int sum=0;
		System.out.println(lesson_no);
		
		ArrayList<Review> review = new ReviewService().previewReview(lesson_no);
		
		JSONObject json = new JSONObject();
		JSONObject avg = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Review r : review) {
			
			JSONObject job = new JSONObject();
			job.put("review_no", r.getReviewNo());
			job.put("review_date", r.getReviewDate().toString());
			job.put("review_content", r.getReviewContent());
			job.put("review_prepare", r.getReviewPrepare());
			job.put("review_sincerity", r.getReviewSincerity());
			job.put("review_delivery", r.getReviewDelivery());
			job.put("sum_rate", r.getReviewDelivery()+r.getReviewPrepare()+r.getReviewSincerity());
			//평균점수가 필요하다~
			sum +=  r.getReviewDelivery()+r.getReviewPrepare()+r.getReviewSincerity();
			count++;
			jarr.add(job);
		}
		avg_rate = sum/count; 
		json.put("review", jarr);
		avg.put("avg_rate", avg_rate);
		System.out.println(json.toJSONString());
		System.out.println(avg.toJSONString());
		response.setContentType("application/json; charset=utf-8;");
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.print(avg.toJSONString());
		out.flush();
		out.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
