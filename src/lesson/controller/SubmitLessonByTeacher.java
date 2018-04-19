package lesson.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import learnLog.model.service.LearnLogService;
import learnLog.model.vo.LearnLog;

/**
 * Servlet implementation class SubmitLessonByTeacher
 */
@WebServlet("/submitlesson")
public class SubmitLessonByTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitLessonByTeacher() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(request.getParameter("no"));
		String[] arr = request.getParameter("no").split("/");
		//학생,선생,강의
		int result=new LearnLogService().summitLesson(Integer.parseInt(arr[0]),Integer.parseInt(arr[1]),Integer.parseInt(arr[2]));
		//레슨로그를 인설트하고
		
		if(result>0) {
			//레슨로그가 제대로 인설트되면 강의 상태를 매칭중으로 바꾼다.
			//int result1 = new LearnLogService().changeStatelesson(Integer.parseInt(arr[2]));
			System.out.println("레슨신청 성공");
			if(Integer.parseInt(arr[3]) == 1002)
			response.sendRedirect("/prototype/04.OJK/teacherinfo.jsp");
			else
			response.sendRedirect("/prototype/04.OJK/studentinfo.jsp");	
			
		}else {
			System.out.println("레슨신청 실패");
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
