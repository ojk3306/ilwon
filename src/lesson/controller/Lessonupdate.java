package lesson.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lesson.model.service.LessonService;
import lesson.model.vo.Lesson;
import users.model.service.UsersService;

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
	
		System.out.println(le.getLesson_keyword());
		
		ArrayList<String> keyword=new ArrayList<String>();
		if(le.getLesson_keyword()!=null) {
		StringTokenizer tokens = new StringTokenizer(le.getLesson_keyword());
         while(tokens.hasMoreTokens()) {
		 keyword.add(tokens.nextToken(","));
		 }
		}
		int keymax = new UsersService().getmaxkeyword(le.getUser_no2());
		
		for(String i : keyword)
	        System.out.println(i);
	        
	    response.setContentType("text/html; charset=utf-8 "); 
		RequestDispatcher view=null;
		if(le!=null) {
		view=request.getRequestDispatcher("/04.OJK/updateclass.jsp");
		request.setAttribute("list",le);
		request.setAttribute("keyword",keyword);
		request.setAttribute("keyamx",keymax);
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
