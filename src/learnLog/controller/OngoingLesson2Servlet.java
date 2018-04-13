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
import learnLog.model.vo.LearnLog;
import lesson.model.service.LessonService;
import lesson.model.vo.Onlesson;

/**
 * Servlet implementation class OngoingLesson2Servlet
 */
@WebServlet("/onlesson2")
public class OngoingLesson2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OngoingLesson2Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int user = Integer.parseInt(request.getParameter("user"));
		System.out.println(user);
		
		
		ArrayList<LearnLog> onlesson = new LearnLogService().onlesson(user);
		
		JSONObject json = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		
		for(LearnLog l : onlesson) {
			
			JSONObject job = new JSONObject();
			job.put("username", l.getUserName());
			job.put("state", l.getState());
			job.put("lesson_no", l.getLessonNo());
			job.put("lesson_title", l.getLessonTitle());
			job.put("log_no", l.getLogNo());
			job.put("log_date", l.getLogDate().toString());
			job.put("lesson_state", l.getLesson_state());
			//job.put("user2_no", l.getUserNo2());
			
			
					
			jarr.add(job);
		}
		
		json.put("onlesson", jarr);
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
