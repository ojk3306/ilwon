package categorys.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import categorys.model.service.CategorysService;

/**
 * Servlet implementation class Bigcateadd
 */
@WebServlet("/bigadd")
public class Bigcateadd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bigcateadd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println(request.getParameter("cate"));
	
	int result=new CategorysService().addbigcate(request.getParameter("cate"));
	RequestDispatcher view=null;
	if(result>0) {
		response.setContentType("text/html; charset=utf-8");
		response.sendRedirect("/prototype/01.CJS/categorys.jsp");
	}else {
		response.setContentType("text/html; charset=utf-8");
		view=request.getRequestDispatcher("/01.CJS/categorys.jsp");
		request.setAttribute("message","삭제 실패했습니다.");
		view.forward(request,response);
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
