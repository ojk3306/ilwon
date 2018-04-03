package lesson.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lesson.model.service.LessonService;
import lesson.model.vo.Lesson;

/**
 * Servlet implementation class InsertClassServlet
 */
@WebServlet("/insertlesson.sm")
public class InsertLessonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertLessonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println(request.getParameter("title"));
		Lesson lesson = new Lesson();
		
		lesson.setlesson_title(request.getParameter("title"));
		lesson.setLevel_no(Integer.parseInt(request.getParameter("level")));
		lesson.setUser_no2(Integer.parseInt(request.getParameter("userno")));
		lesson.setlesson_price(Integer.parseInt(request.getParameter("price")));
		lesson.setlesson_count(Integer.parseInt(request.getParameter("count")));
		lesson.setlesson_contop(request.getParameter("contop"));
		lesson.setlesson_conmid(request.getParameter("conmid"));
		lesson.setlesson_conbot(request.getParameter("conbot"));
		lesson.setlesson_loc(request.getParameter("loc"));
		lesson.setlesson_rad(Integer.parseInt(request.getParameter("rad")));
		lesson.setlesson_keyword(request.getParameter("keyword"));
		
		int result = new LessonService().insertlesson(lesson);
		
		response.setContentType("text/html; charset=utf-8");
		
		if(result > 0) {
			response.sendRedirect("/prototype/04.OJK\\teacherdetail.jsp");
		}else {
			response.sendRedirect("index.jsp");
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
