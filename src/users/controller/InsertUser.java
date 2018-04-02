package users.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import users.model.service.UsersService;
import users.model.vo.User;
import users.model.vo.Users;

/**
 * Servlet implementation class InsertUserInfo
 */
@WebServlet("/Insertuser.sm")
public class InsertUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	System.out.println(request.getParameter("user_type"));//101이면 학생 102면 선생
	request.setCharacterEncoding("utf-8");
	Users user = new Users();
	user.setUserEmail(request.getParameter("email"));
	user.setUserPassword(request.getParameter("pwd"));
	user.setUserName(request.getParameter("name"));
	user.setUserGender(request.getParameter("gender"));
	user.setUserAge(Integer.parseInt(request.getParameter("age")));
	user.setUserPhone(request.getParameter("phone"));
	user.setUserLoc(request.getParameter("loc"));
	user.setUserTypeNo(Integer.parseInt(request.getParameter("user_type")));
	System.out.println(user);
	int result = new UsersService().insertUsers(user);
	
	response.setContentType("text/html; charset=utf-8"); 
	if(result > 0) {
		response.sendRedirect("EnrollSucess.jsp");
	}else {
		
		RequestDispatcher view = request.getRequestDispatcher("");
		request.setAttribute("message", "회원 가입 실패");
		view.forward(request, response);
		
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
