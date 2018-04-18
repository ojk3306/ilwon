package semina.controller;

import java.io.IOException;

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
import seminaDetail.model.service.SeminaDetailService;
import seminaDetail.model.vo.*;
/**
 * Servlet implementation class AdminSeminaView
 */
@WebServlet("/auseminav")
public class AdminSeminaView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSeminaView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int semina_no = Integer.parseInt(request.getParameter("no"));
		Semina semina = new SeminaService().auSemina(semina_no);
		
		response.setContentType("text/html; charset=utf-8");
		RequestDispatcher view=null;
		if(semina != null) {
			view = request.getRequestDispatcher("/04.OJK/adminSeminaUpdate.jsp");
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
