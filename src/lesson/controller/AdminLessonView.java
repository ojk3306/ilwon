package lesson.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import learnLog.model.service.LearnLogService;
import learnLog.model.vo.LearnLogAdmin;
import lesson.model.service.LessonService;
import lesson.model.vo.Lesson;

/**
 * Servlet implementation class AdminLessonUpdate
 */
@WebServlet("/aulessonv")
public class AdminLessonView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLessonView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int lesson_no = Integer.parseInt(request.getParameter("no"));
		Lesson lesson = new LessonService().auLesson(lesson_no);
		ArrayList<LearnLogAdmin> lessona = new LearnLogService().auLessona(lesson_no); 
		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view=null;
		if(lesson != null) {
			view = request.getRequestDispatcher("/04.OJK/adminLessonUpdate.jsp");
			request.setAttribute("lesson", lesson);
			request.setAttribute("lessona", lessona);
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
