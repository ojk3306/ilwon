package searchLog.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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
public class InsertSearchLogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertSearchLogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		SearchLog sl = new SearchLog();
		
		String keywordValue=request.getParameter("seachcontent");

		sl.setSearchContent(keywordValue);
			
		if(request.getParameter("user").equals("")  || request.getParameter("user").equals("undefined")) {
		
		}else {
		sl.setUserNo(Integer.parseInt(request.getParameter("user")));	
		}
		
		
		int result=new SearchLogService().insertlog(sl);
		response.setContentType("text/html; charset=utf-8");
		
		if(result>0) {
			
		System.out.println("삽입완료  / (To.InsertSearchLogServlet)");
		System.out.println("keyword="+keywordValue);
		RequestDispatcher view= request.getRequestDispatcher("/lnsearch?ohw-keyword="+keywordValue);
		view.forward(request, response);

		} else {
			System.out.println("삽입실패 / (To.InsertSearchLogServlet)");
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
