package seminaDetail.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semina.model.service.SeminaService;
import seminaDetail.model.service.SeminaDetailService;

/**
 * Servlet implementation class SeminaDetailcancel
 */
@WebServlet("/sdcan")
public class SeminaDetailcancel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeminaDetailcancel() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//세미나 디테일의 pk를 받음
		int result= new SeminaDetailService().sdcan(Integer.parseInt(request.getParameter("no")));
		int result1=0;
		
		if(result>0)
		result1= new SeminaService().seminaDownnow(Integer.parseInt(request.getParameter("no")));
		
		
		if(result1>0) {
			System.out.println("취소 성공");
			if(Integer.parseInt(request.getParameter("type"))==1001)
			response.sendRedirect("/prototype/04.OJK/studentinfo.jsp");
			else if(Integer.parseInt(request.getParameter("type"))==1002)
			response.sendRedirect("/prototype/04.OJK/teacherinfo.jsp");
		
		}else {
			System.out.println("취소 실패");
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
