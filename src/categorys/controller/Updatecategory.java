package categorys.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import categorys.model.service.CategorysService;
import categorys.model.vo.Categorys;

/**
 * Servlet implementation class Updatecategory
 */
@WebServlet("/upcate")
public class Updatecategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Updatecategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println(request.getParameter("userno"));
	System.out.println(request.getParameter("cate"));
	Categorys cup=new Categorys();
	cup.setCATEGORY_NO(Integer.parseInt(request.getParameter("userno")));
	cup.setCATEGORY_SMALL(request.getParameter("cate"));
	int result=new CategorysService().updatesmall(cup);

	if(result>0) {			
		JSONObject json = new JSONObject();
		
		
		json.put("userno",cup.getCATEGORY_NO());
		json.put("cate",cup.getCATEGORY_SMALL());
		
		System.out.println(json.toJSONString());
	    response.setContentType("application/json; charset=utf-8;");
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
		out.flush();
		out.close();
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
