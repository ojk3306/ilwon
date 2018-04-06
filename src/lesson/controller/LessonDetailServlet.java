package lesson.controller;

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
		
		response.setContentType("text/html; charset=utf-8"); 
		RequestDispatcher view =null;
		if(lessondetail != null) {
			view = request.getRequestDispatcher("04.OJK/teacherdetail.jsp");
			request.setAttribute("lessondetail", lessondetail);
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
