package lesson.controller;

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
import lesson.model.vo.Lesson;
import lesson.model.vo.Onlesson;
import semina.model.service.SeminaService;
import semina.model.vo.Semina;

/**
 * Servlet implementation class OngoingLessonServlet
 */
@WebServlet("/onlessonteacher")
public class OngoingLessonServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OngoingLessonServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int user = Integer.parseInt(request.getParameter("user"));
		System.out.println(user);
		//학생이 올린 게시판 구하는 서블릿
		
		ArrayList<Onlesson> onlesson = new LessonService().onlesson2(user);
		
		JSONObject json = new JSONObject();
		
		JSONArray jarr = new JSONArray();
		
		for(Onlesson l : onlesson) {
			
			JSONObject job = new JSONObject();
			job.put("username", l.getUser_name());
			job.put("state", l.getState());
			job.put("lesson_no", l.getLesson_no());
			job.put("lesson_title", l.getLesson_title());
			
			if(l.getLesson_enddate()!=null) {			
			job.put("lesson_enddate", l.getLesson_enddate().toString());
			}
			
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
