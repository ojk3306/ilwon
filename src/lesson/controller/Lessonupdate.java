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

/**
 * Servlet implementation class Lessonupdate
 */
@WebServlet("/lessonupdate")
public class Lessonupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Lessonupdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		Lesson le=new LessonService().findLessonBylessonNo(Integer.parseInt(request.getParameter("lessno")));
	
	    response.setContentType("text/html; charset=utf-8 "); 
		RequestDispatcher view=null;
		if(le!=null) {
		view=request.getRequestDispatcher("/04.OJK/lessonupdate.jsp");
		request.setAttribute("list",le);
		view.forward(request, response);
		}else {
			
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
