package learnLog.controller;

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

import learnLog.model.service.LearnLogService;
import learnLog.model.vo.Learnlogforinfo;

/**
 * Servlet implementation class LearnLogTeacher
 */
@WebServlet("/llteaher2")
public class LearnLogTeacher2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LearnLogTeacher2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int user = Integer.parseInt(request.getParameter("user"));
		System.out.println(user);
		//현재 진행중인 수업.
		
		ArrayList<Learnlogforinfo> onlesson = new LearnLogService().getlessonLog3_1(user);
		
		JSONObject json = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		
		for(Learnlogforinfo l : onlesson) {
			
			JSONObject job = new JSONObject();
			job.put("username", l.getUSER_NAME());//학생의
			job.put("state", l.getLOG_STATE());
			job.put("lesson_no", l.getLESSON_NO());
			job.put("stuno",l.getUSER_NO1());
			job.put("lesson_title", l.getLESSON_TITLE());
			job.put("log_no", l.getLOG_NO());
			job.put("log_date", l.getLOG_DATE().toString());
			job.put("phone",l.getUSER_PHONE());
			//job.put("user2_no", l.getUserNo2());
			
		jarr.add(job);
		}
		
		json.put("onlesson", jarr);
		System.out.println("llteaher:"+json.toJSONString());
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
