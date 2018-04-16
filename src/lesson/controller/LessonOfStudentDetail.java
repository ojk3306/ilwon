package lesson.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lesson.model.vo.Lesson;
import lesson.model.vo.LessonSearch;
import users.model.vo.Users;

/**
 * Servlet implementation class LessonOfStudentDetail
 */
@WebServlet("/studentdetail")
public class LessonOfStudentDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LessonOfStudentDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//학생이올린 배우고싶어요의 상세페이지
		
		System.out.println(Integer.parseInt(request.getParameter("no")));
		System.out.println(Integer.parseInt(request.getParameter("userno")));
		
		Users user=new users.model.service.UsersService().userDetailByAdmin(Integer.parseInt(request.getParameter("userno")));
		
		LessonSearch lesson=new lesson.model.service.LessonService().getlessoninfoStudentByNo(Integer.parseInt(request.getParameter("userno")));
		
		RequestDispatcher view=null;
		if(user!=null && lesson!=null) {
			System.out.println("학생이 올린 게시판 디테일 성공");
			view=request.getRequestDispatcher("/04.OJK/studentdetail.jsp");
			request.setAttribute("user", user);
			request.setAttribute("lesson", lesson);
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
