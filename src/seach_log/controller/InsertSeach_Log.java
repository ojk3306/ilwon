package seach_log.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.xml.internal.bind.v2.runtime.unmarshaller.InterningXmlVisitor;

import seach_log.model.service.Seach_logService;
import seach_log.model.vo.Seach_log;

/**
 * Servlet implementation class InsertSeach_Log
 */
@WebServlet("/Insertlog")
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
		System.out.println("서치서블릿옴");
		Seach_log sl = new Seach_log();
		String keyword=request.getParameter("seachcontent");
		sl.setSEACH_CONTENT(keyword);
		sl.setUSER_NO(null);
		
		
		int result=new Seach_logService().insertlog(sl);
		response.setContentType("text/html; charset=utf-8");
		if(result>0) {
			System.out.println("삽입완료");
			response.sendRedirect("/prototype/tlist?word="+keyword);
		}else {
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
