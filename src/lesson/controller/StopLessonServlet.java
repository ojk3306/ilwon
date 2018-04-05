package lesson.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lesson.model.service.LessonService;

/**
 * Servlet implementation class StopLessonServlet
 */
@WebServlet("/stoplesson")
public class StopLessonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StopLessonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int lesson_no = Integer.parseInt(request.getParameter("no"));
		
		int result = new LessonService().stopLesson(lesson_no);
		
		if(result > 0) {
			response.sendRedirect("/prototype/04.OJK\\teacherinfo.jsp");
			
		}else {
			//에러ㅍㅔ이지 추가하자
			RequestDispatcher view = request.getRequestDispatcher("/prototype/index.jsp");
			request.setAttribute("message","");
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
