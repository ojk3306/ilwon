package seminaDetail.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import lesson.model.service.LessonService;
import lesson.model.vo.Onlesson;
import seminaDetail.model.service.SeminaDetailService;
import seminaDetail.model.vo.SeminaDetailByInfo;

/**
 * Servlet implementation class SeminaDetailByUesr
 */
@WebServlet("/checksemina")
public class SeminaDetailByUesr extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeminaDetailByUesr() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	ArrayList<SeminaDetailByInfo> semi=new SeminaDetailService().getseminadetail(Integer.parseInt(request.getParameter("no")));
	
	JSONObject json = new JSONObject();
	
	JSONArray jarr = new JSONArray();
	
	for(SeminaDetailByInfo l : semi) {
		
		JSONObject job = new JSONObject();
		job.put("SEMINA_DETAIL_NO", l.getSEMINA_DETAIL_NO());
		job.put("SEMINA_DETAIL_STATE", l.getSEMINA_DETAIL_STATE());
		job.put("SEMINA_ENDDATE", l.getSEMINA_ENDDATE());
		job.put("SEMINA_LOCATION", l.getSEMINA_LOCATION());
		job.put("SEMINA_NO", l.getSEMINA_NO());
		job.put("SEMINA_NOW", l.getSEMINA_NOW());
		job.put("SEMINA_STATE", l.getSEMINA_STATE());
		job.put("SEMINA_TITLE", l.getSEMINA_TITLE());
		job.put("USER_NO", l.getUSER_NO());
		job.put("USER_PHONE", l.getUSER_PHONE());
		jarr.add(job);
	}
 
	json.put("semi", jarr);
				
	
	System.out.println(json.toJSONString());
    response.setContentType("application/json; charset=utf-8;");
	PrintWriter out = response.getWriter();
	out.print(json.toJSONString());
	out.flush();
	out.close();
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
