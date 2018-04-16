package semina.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lesson.model.service.LessonService;
import semina.model.service.SeminaService;

/**
 * Servlet implementation class AdminSeminaUpdate
 */
@WebServlet("/ausemina")
public class AdminSeminaUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSeminaUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int seminano= Integer.parseInt(request.getParameter("seminano"));
		String value=request.getParameter("value");
		int type= Integer.parseInt(request.getParameter("type"));
		
		int result=new SeminaService().adminUpdateSemina(seminano,value,type);
		
		if(result>0) {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(value);
		out.flush();
		out.close();
		
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
