package users.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import users.model.vo.Users;

/**
 * Servlet implementation class AdminDetailUser
 */
@WebServlet("/aDtail")
public class AdminDetailUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminDetailUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//System.out.println("AdminDetailUser : 유저번호="+request.getParameter("userno"));
	
	Users user=new users.model.service.UsersService().userDetailByAdmin(Integer.parseInt(request.getParameter("userno")));
	
	System.out.println(user.toString());
	
	response.setContentType("text/html; charset=utf-8");
	RequestDispatcher view=null;
	if(user!=null) {
	view=request.getRequestDispatcher("/01.CJS/detailOfadmin.jsp");
	request.setAttribute("user",user);
	view.forward(request, response);
	}else {
	view=request.getRequestDispatcher("/01.CJS/ErrorPage.jsp");
	request.setAttribute("message","실패");
	view.forward(request, response);
	}
}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
