package searchLog.controller;

import java.io.IOException;
import searchLog.model.service.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RealTimeSearch
 */
@WebServlet("/rtsearch")
public class RealTimeSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RealTimeSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	SearchLogService list = new SearchLogService();
	
	String first = list.realTimeList().get(0);
	String second =list.realTimeList().get(1);
	String third =list.realTimeList().get(2);
	String fourth =list.realTimeList().get(3);
	String fifth =list.realTimeList().get(4);
	String user =list.getUserLessonSeminaNumbers().get(0);
	String lesson=list.getUserLessonSeminaNumbers().get(1);
	String semina=list.getUserLessonSeminaNumbers().get(2);
	System.out.println("리스트 값: "+first+second+third+fourth+fifth);
	
	
	//1. response.sendRedirect("해당 jsp파일의 주소");
	
	//2. request.getRequestDispatcher("해당 jsp 파일의 주소");
	
	response.setContentType("text/html; charset=utf-8");
	
	RequestDispatcher view = null;
	view=request.getRequestDispatcher("./01.CJS/adminpage.jsp");
	request.setAttribute("first", first);
	request.setAttribute("second", second);
	request.setAttribute("third", third);
	request.setAttribute("fourth", fourth);
	request.setAttribute("fifth", fifth);	
	request.setAttribute("user", user);	
	request.setAttribute("lesson", lesson);	
	request.setAttribute("semina", semina);	
	
	view.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
