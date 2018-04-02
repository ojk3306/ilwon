package searchLog.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import searchLog.model.service.SearchLogService;
import searchLog.model.vo.SearchLog;

import javax.servlet.http.*;

/**
 * Servlet implementation class InsertSeach_Log
 */
@WebServlet("/insertlog")
public class InsertSeach_Log extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertSeach_Log() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//필터 생성후 utf -8 지운다.
		request.setCharacterEncoding("utf-8");		
		SearchLog sl = new SearchLog();
		String keyword=request.getParameter("seachcontent");
		sl.setSearchContent(keyword);
		sl.setUserNo(0);
		
		
		int result=new SearchLogService().insertlog(sl);
		response.setContentType("text/html; charset=utf-8");
		if(result>0) {
			System.out.println("삽입완료");
			response.sendRedirect("/prototype/tlist?word="+keyword);
		} else {
			System.out.println("삽입실패");
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
