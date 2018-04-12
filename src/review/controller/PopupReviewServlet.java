package review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lesson.model.service.LessonService;
import lesson.model.vo.LessonDetail;

/**
 * Servlet implementation class PopupReviewServlet
 */
@WebServlet("/popreview")
public class PopupReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PopupReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int user_no = Integer.parseInt(request.getParameter("userno"));
		int lesson_no = Integer.parseInt(request.getParameter("no"));
		
		LessonDetail lesson = new LessonService().lessonView(lesson_no);
		
		response.setContentType("text/html; charset=utf-8"); 
		RequestDispatcher view =null;
		
		if(lesson != null) {
			view = request.getRequestDispatcher("04.OJK/insertreview.jsp");
			request.setAttribute("lesson", lesson);
			request.setAttribute("user_no", user_no);
			request.setAttribute("lesson_no", lesson_no);
			view.forward(request, response);
			
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
