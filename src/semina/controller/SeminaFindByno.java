package semina.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semina.model.service.SeminaService;
import semina.model.vo.Semina;

/**
 * Servlet implementation class SeminaFindByno
 */
@WebServlet("/semiup")
public class SeminaFindByno extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeminaFindByno() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println(request.getParameter("semino"));
	//세미나 수정 하기위해 세미나 정보를 가져감.
	
	Semina semi=new SeminaService().getseminabyno(Integer.parseInt(request.getParameter("semino")));
	
	RequestDispatcher view= null;
	if(semi!=null) {
	view=request.getRequestDispatcher("/04.OJK/seminaupdate.jsp");
	request.setAttribute("list",semi);
	view.forward(request, response);
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
