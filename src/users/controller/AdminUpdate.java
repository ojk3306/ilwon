package users.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import netscape.javascript.JSObject;
import users.model.service.UsersService;

/**
 * Servlet implementation class AdminUpdate
 */
@WebServlet("/adminupdate")
public class AdminUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	int userno= Integer.parseInt(request.getParameter("userno"));
	String value=request.getParameter("value");
	int type= Integer.parseInt(request.getParameter("type"));
	/*
	 * type   
	 * 1= 이름수정
	 * 2= 메일수정
	 * 3= 성별수정
	 * 4= 전번수정
	 * 5= 최대키워드갯수 수정
	 * 6= 최대강의갯수 수정
	 */
	System.out.println("어드민의 유저정보수정  userno="+userno);
	System.out.println("어드민의 유저정보수정  value="+value);
	System.out.println("어드민의 유저정보수정  type="+type);
	int result=new UsersService().adminUpdate(userno,value,type);
	
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
