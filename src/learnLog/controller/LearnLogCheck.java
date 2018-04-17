package learnLog.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import learnLog.model.service.LearnLogService;

/**
 * Servlet implementation class LearnLogCheck
 */
@WebServlet("/checkLesson")
public class LearnLogCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LearnLogCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	int result=new LearnLogService().checkLesson(Integer.parseInt(request.getParameter("userno")),Integer.parseInt(request.getParameter("teano")),Integer.parseInt(request.getParameter("leno")));
	
	System.out.println("result="+result);
	
	
	PrintWriter out = response.getWriter();
	out.print(result);
	
	out.flush();
	out.close();
	
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
