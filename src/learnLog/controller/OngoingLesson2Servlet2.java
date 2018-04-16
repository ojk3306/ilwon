package learnLog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
 * Servlet implementation class OngoingLesson2Servlet
 */
@WebServlet("/onlesson3")
public class OngoingLesson2Servlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OngoingLesson2Servlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int user = Integer.parseInt(request.getParameter("user"));
		System.out.println(user);
		//숨김형태의 내역을 뽑아내는것.
		
		ArrayList<Learnlogforinfo> onlesson = new LearnLogService().getlessonLog1(user);
		
		JSONObject json = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		
		for(Learnlogforinfo l : onlesson) {
			
			JSONObject job = new JSONObject();
			job.put("username", l.getUSER_NAME());//선생의 이름 
			job.put("state", l.getLOG_STATE());
			job.put("lesson_no", l.getLESSON_NO());
			job.put("lesson_title", l.getLESSON_TITLE());
			job.put("log_no", l.getLOG_NO());
			job.put("log_date", l.getLOG_DATE().toString());
		
			//job.put("user2_no", l.getUserNo2());
			
		jarr.add(job);
		}
		
		json.put("onlesson", jarr);
		System.out.println("onlesson3:"+json.toJSONString());
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
