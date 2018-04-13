package categorys.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

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
import lesson.model.vo.Onlesson;

/**
 * Servlet implementation class CategorylistView
 */
@WebServlet("/clist")
public class AdminCategoryView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCategoryView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Categorys> cate = new CategorysService().getclist();
		ArrayList<String> catecount=new CategorysService().getlistcount();
		RequestDispatcher view=null;
		
		if(cate.size()>0) {	
			JSONObject json = new JSONObject();
			
			JSONArray jarr = new JSONArray();
			
			for(Categorys l : cate) {
				JSONObject job = new JSONObject();
				job.put("CATEGORY_NO",l.getCATEGORY_NO());
				job.put("CATEGORY_BIG",l.getcATEGORY_BIG());
				job.put("CATEGORY_SMALL",l.getCATEGORY_SMALL());
				job.put("CATEGORY_HIT",l.getCATEGORY_HIT());
				job.put("maxcount",catecount);
				jarr.add(job);
			}
			
			json.put("clist", jarr);
			jarr = new JSONArray();
			for(String l :   catecount) {
				JSONObject job = new JSONObject();
				job.put("CATEGORY_BIG",l);
				
				jarr.add(job);
			}
			json.put("big", jarr);
			
			System.out.println("CategoryJson : " + json.toJSONString());
		    response.setContentType("application/json; charset=utf-8;");
			PrintWriter out = response.getWriter();
			out.print(json.toJSONString());
			out.flush();
			out.close();
		
		}else {
		response.setContentType("text/html; charset=utf-8");
		response.sendRedirect("/prototype/01.CJS/login.jsp");	
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
