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
import seminaDetail.model.service.SeminaDetailService;
import users.model.service.UsersService;
import users.model.vo.Users;

/**
 * Servlet implementation class SeminaDetail
 */
@WebServlet("/sdetail")
public class SeminaDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeminaDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("세미나번호 :"+request.getParameter("userno"));//사실은 세미나 번호임.
		int seminano=Integer.parseInt(request.getParameter("userno"));
		if(request.getParameter("usernono")!=null) {
		System.out.println("usernono:"+request.getParameter("usernono"));
		}
		
		
		
		
		Semina semi = new SeminaService().getseminabyno(seminano); 
		
		Users user=null;
		response.setContentType("text/html; charset=utf-8");
		
	    RequestDispatcher view =null;
		if(semi!=null) {//세미나 정보찾기이후 사용자 정보찾기.
			
		user=new UsersService().getUserinfofromsemina(semi.getUserNo());
		
			}else {//세미나 정보찾기 실패. 에러창으로 보내기. 추후업데이트.
		System.out.println("세미나 정보찾기 실패!...");
		}
	
		if(user!=null) {//유저 정보찾기 성공 이제 디테일로 정보를 쏜다.
		   
			if(request.getParameter("usernono")!=null) {
					System.out.println("usernono:"+request.getParameter("usernono"));
					seminaDetail.model.vo.SeminaDetail semideta=new SeminaDetailService().getseminadetail(semi.getSeminaNo(),Integer.parseInt(request.getParameter("usernono")));
					view=request.getRequestDispatcher("/01.CJS/seminaDetail.jsp");
				    request.setAttribute("semina", semi);
				    request.setAttribute("user", user);
				    request.setAttribute("semideta", semideta);
				    System.out.println(semideta.toString());
				    view.forward(request, response);
						}else {
					view=request.getRequestDispatcher("/01.CJS/seminaDetail.jsp");
				    request.setAttribute("semina", semi);
				    request.setAttribute("user", user);
				    view.forward(request, response);
					}
			
		    }else {//유저 정보찾기 실패. 에러창으로 보내기. 추후업데이트.
		    System.out.println("세미나 이후, 유저 정보찾기 실패.");
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
