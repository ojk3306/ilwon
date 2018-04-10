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
@WebServlet("/tclist")
public class CategorylistView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategorylistView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<Categorys> categoryInfo = new CategorysService().getclist();
		ArrayList<String> bigCategory = new CategorysService().getBigCategory();
		RequestDispatcher view = null;
		
		if(categoryInfo.size() > 0) {
			
			JSONObject json = new JSONObject();			
			JSONArray jarr = new JSONArray();
			
			for(Categorys info : categoryInfo) {
				
				JSONObject job = new JSONObject();
				
				job.put("categoryNo", info.getCATEGORY_NO());
				job.put("categoryBig", info.getcATEGORY_BIG());
				job.put("categorySmall", info.getCATEGORY_SMALL());
				job.put("categoryHit", info.getCATEGORY_HIT());
				job.put("bigCategoryss", bigCategory);
				
				jarr.add(job);
			}
			
			json.put("categoryInfo", jarr);
			
			jarr = new JSONArray();
			
			for(String categoryBig : bigCategory) {
				
				JSONObject job = new JSONObject();
				
				job.put("categoryBig", categoryBig);
				
				jarr.add(job);
			}
			json.put("bigCategory", jarr);
			
			System.out.println("CategoryJson : " + json.toJSONString() + " / (To.CategorylistViewServlet)");
			
		    response.setContentType("application/json; charset=utf-8;");
			PrintWriter out = response.getWriter();
			out.print(json.toJSONString());
			out.flush();
			out.close();
		
		} else {
			
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
