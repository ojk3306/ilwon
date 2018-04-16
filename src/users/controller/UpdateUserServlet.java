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
 * Servlet implementation class UpdateUserServlet
 */
@WebServlet("/userupdate.sm")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateUserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userno= Integer.parseInt(request.getParameter("userno"));
		String value=request.getParameter("value");
		String pwd = request.getParameter("pwd");
		int type= Integer.parseInt(request.getParameter("type"));
		System.out.println("userno =" + userno + "value =" + value + "type = " + type);
		int result=new UsersService().userUpdate(userno,value,type,pwd);
		
		if(result>0) {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(value);
		out.flush();
		out.close();
		
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
