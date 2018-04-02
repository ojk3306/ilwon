package users.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import users.model.service.UsersService;

/**
 * Servlet implementation class EmailCheck
 */
@WebServlet("/emailcheck")
public class EmailCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		
		System.out.println(email);
		
		String ok = "사용가능한 email 입니다";
		String no = "중복된 email 입니다";
		
		int result = new UsersService().checkEmail(email);
		
		if(result > 0 ) {
			response.setContentType("text/html; charset=utf-8"); 
			PrintWriter out = response.getWriter();
			out.append(no);
			
		}else {
			response.setContentType("text/html; charset=utf-8"); 
			PrintWriter out = response.getWriter();
			out.append(ok);
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
