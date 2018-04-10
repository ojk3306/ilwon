package categorys.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import categorys.model.service.CategorysService;

/**
 * Servlet implementation class DeleteCategory
 */
@WebServlet("/dcate")
public class DeleteCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	int result=new CategorysService().deletecate(request.getParameter("userno"));
	RequestDispatcher view=null;
	if(result>0) {
		
		response.setContentType("text/html; charset=utf-8");
		response.sendRedirect("/prototype/01.CJS/categorys.jsp");
	}else {
		response.setContentType("text/html; charset=utf-8");
		response.sendRedirect("/prototype/01.CJS/categorys.jsp");
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
