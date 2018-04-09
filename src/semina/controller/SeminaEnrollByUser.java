package semina.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semina.model.service.SeminaService;

/**
 * Servlet implementation class SeminaEnrollByUser
 */
@WebServlet("/enrollsemina")
public class SeminaEnrollByUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeminaEnrollByUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int seminano=Integer.parseInt(request.getParameter("semino"));
		int studentno=Integer.parseInt(request.getParameter("studentno"));
		//세미나디테일에 등록.
		int result= new SeminaService().enrollseminabyuser(seminano,studentno); 
	
		//세미나에가서 현재 신청인원 +시키기.
		
		if(result>0) {
			int resutl1=new SeminaService().seminaupnow(seminano);
			request.setAttribute("resutl1",seminano);
				if(resutl1>0) {
				      System.out.println("세미나 신청과정 성공");
				}else {
					System.out.println("세미나 신청 이후, now 상승 실패.");	
				}
		}else {
		System.out.println("세미나 신청 실패.");	
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
