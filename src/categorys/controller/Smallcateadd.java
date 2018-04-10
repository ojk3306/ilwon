package categorys.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import categorys.model.service.CategorysService;
import categorys.model.vo.Categorys;

/**
 * Servlet implementation class Smallcateadd
 */
@WebServlet("/smalladd")
public class Smallcateadd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Smallcateadd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println(request.getParameter("cate"));
		//System.out.println(request.getParameter("cateno"));
		
		String catego=request.getParameter("cateno");
		
		String renamecate=catego.substring(0,catego.length()-1);
		
		Categorys cate=new Categorys();
		cate.setcATEGORY_BIG(renamecate);
		cate.setCATEGORY_SMALL(request.getParameter("cate"));
		
		Categorys result=new CategorysService().addsmallcate(cate);
		
		if(result!=null) {			
			JSONObject json = new JSONObject();
			
			json.put("CATEGORY_NO",result.getCATEGORY_NO() );
			json.put("CATEGORY_BIG",result.getcATEGORY_BIG());
			json.put("CATEGORY_SMALL",result.getCATEGORY_SMALL());
			json.put("CATEGORY_HIT",result.getCATEGORY_HIT());
		
		
			
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
