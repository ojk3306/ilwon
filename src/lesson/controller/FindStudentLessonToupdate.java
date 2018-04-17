package lesson.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lesson.model.service.LessonService;
import lesson.model.vo.Lesson;
import lesson.model.vo.LessonSearch;

/**
 * Servlet implementation class FindStudentLessonToupdate
 */
@WebServlet("/findstules")
public class FindStudentLessonToupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindStudentLessonToupdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	Lesson less=new LessonService().getLssoninfoByLessonNo(Integer.parseInt(request.getParameter("no")));
	
	RequestDispatcher view=null;
	
	if(less!=null) {
		view=request.getRequestDispatcher("/04.OJK/lessonUpdate2.jsp");
		request.setAttribute("list",less);
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
