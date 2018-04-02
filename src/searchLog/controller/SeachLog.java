package searchLog.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import searchLog.model.service.SearchLogService;
import searchLog.model.vo.SearchLog;

/**
 * Servlet implementation class SeachLog
 */
@WebServlet("/seach")
public class SeachLog extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeachLog() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println(request.getParameter("word"));
	SearchLog sl=new SearchLog();
	/*if()
	세션을 확인해서 잇을시에 회원 번호를 sl 객체에 set한다.
	sl.setUserNo(request);
*/
	ArrayList<String> result=new SearchLogService().Seachlog(sl);
	
	response.setContentType("text/html; charset=utf-8");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
