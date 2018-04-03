package users.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import users.model.vo.*;
import users.model.service.*;
/**
 * Servlet implementation class AdminSeachUser
 */
@WebServlet("/adminseachuser")
public class AdminSeachUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSeachUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String seach=request.getParameter("seach");
	
	int seachOption=Integer.parseInt(request.getParameter("option"));
	
	Users user=new Users();
	
	user.setUserTypeNo(Integer.parseInt(request.getParameter("type")));
	
	ArrayList<Users> al=new users.model.service.UsersService().seachUserByAdmin(user,seach,seachOption);
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
