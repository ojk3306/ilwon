package lesson.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lesson.model.service.LessonService;
import lesson.model.vo.Lesson;

/**
 * Servlet implementation class AdminLessonList
 */
@WebServlet("/adminlessnolist")
public class AdminLessonList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLessonList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Lesson> lesson = new LessonService().aLessonList();
		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view=null;
		if(lesson != null) {
			view = request.getRequestDispatcher("/04.OJK/adminlesson.jsp");
			request.setAttribute("lesson", lesson);
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
