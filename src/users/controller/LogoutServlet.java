package users.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogoutServlet() {
        super();
        System.out.println("로그아웃");
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// <a> 태그의 전송방식은 무조건 겟
		//로그 아웃 처리용 컨트롤러
		/*String redirectPage = request.getParameter("uri");
		if(redirectPage == null) {
			redirectPage = "index.jsp";
		}
		
		if(request.getParameter("page") != null) {
			String page = request.getParameter("page");
			redirectPage = redirectPage + "?page" + page;
		}
		
		request.getSession().invalidate();
		response.sendRedirect(redirectPage);	*/	
		
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
			response.sendRedirect("index.jsp");
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
