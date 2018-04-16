package learnLog.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import learnLog.model.service.LearnLogService;

/**
 * Servlet implementation class LearnLogComfirm
 */
@WebServlet("/confirmlesson")
public class LearnLogComfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LearnLogComfirm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] arr = request.getParameter("no").split("/");

		int result=new LearnLogService().Comfirmlog(Integer.parseInt(arr[0]),Integer.parseInt(arr[1]));
			
		if(result>0) {
		response.sendRedirect("/prototype/04.OJK/teacherinfo.jsp");			
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
