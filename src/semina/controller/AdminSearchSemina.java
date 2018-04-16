package semina.controller;

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
import semina.model.service.SeminaService;
import semina.model.vo.Semina;

/**
 * Servlet implementation class AdminSearchSemina
 */
@WebServlet("/adminsearchsemina")
public class AdminSearchSemina extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSearchSemina() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("search");
		int option = Integer.parseInt(request.getParameter("option"));
		ArrayList<Semina> semina = new SeminaService().aSearchSemina(str,option);
		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view=null;
		if(semina != null) {
			view = request.getRequestDispatcher("/04.OJK/adminsemina.jsp");
			request.setAttribute("semina", semina);
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
