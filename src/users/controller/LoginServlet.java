package users.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import users.model.service.UsersService;
import users.model.vo.Users;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.sm")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("id");
        String userPwd = request.getParameter("pwd");
        System.out.println("아이디 : " + userId + "\n암호 : " + userPwd);
        
        //3. 비즈니스 로직을 처리할 서비스 모델 클래스의
        //로그인 처리용 메소드로 값을 전달하고, 결과를 받음.
        Users loginUser = new UsersService().loginCheck(userId, userPwd);
        
        //4. 받은 결과를 가지고 성공/ 실패에 따라 뷰를 선택해서 내보냄
        response.setContentType("text/html; charset=UTF-8");
        if(loginUser != null) {
        	//로그인 성공 처리 : session 객체 이용
        	HttpSession session = request.getSession();        	
        	
        	session.setAttribute("loginUser", loginUser);
        	
        	System.out.println(loginUser.toString());
        	
        	response.sendRedirect("/prototype/index.jsp");
        	
        } else {
        	RequestDispatcher view=request.getRequestDispatcher("/03.OHW/views/login.jsp");
        	//response.sendRedirect("/prototype/03.OHW/views/login.jsp");
        	request.setAttribute("message","이메일과 비밀번호가 일치하지않습니다!");
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
