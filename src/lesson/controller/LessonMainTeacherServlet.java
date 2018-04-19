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

/**
 * Servlet implementation class LessonMainTeacherServlet
 */
@WebServlet("/lmteacher")
public class LessonMainTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LessonMainTeacherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//리스트 결과를 json 배열에 담아서, 전송하는 컨트롤러				
				ArrayList<Lesson> list = new LessonService().selectMainTeacher();				
				System.out.println("TeacherList : " + list + " / (To.LessonMainTeacherServlet)");	
				//전송은 json 객체 한개만 전송할 수 있음
				//최종 전송용 json 객체 생성함
				JSONObject json = new JSONObject();
					
				//list 를 옮겨 담을 json 배열 객체가 필요함.
				JSONArray jarr = new JSONArray();
					
				//list 에서 user 객체 한 개 꺼냄
				// => json 객체 한 개에 값들을 옮겨 담음.
				// => json 객체를 json 배열에 저장함.
				for(Lesson lesson : list) {
					//한 사람의 정보를 저장할 json 객체 생성함
					JSONObject job = new JSONObject();			
					job.put("lessonNo",lesson.getLesson_no());
					job.put("levelNo",lesson.getLevel_no());
					job.put("stateNo",lesson.getState_no());
					job.put("categoryNo", lesson.getCategory_no());
					job.put("categoryBName", lesson.getCategory_bigName());
					job.put("categorySName", lesson.getCategory_smallName());
					job.put("userNo1", lesson.getUser_no1());			
					job.put("userNo2", lesson.getUser_no2());			
					job.put("userName1", lesson.getUser_name1());			
					job.put("userName2", lesson.getUser_name2());			
					job.put("lessonTitle",lesson.getLesson_title());	
					job.put("lessonLocation",lesson.getLesson_loc());	
					job.put("lessonRadius",lesson.getLesson_rad());	
					job.put("lessonPrice",lesson.getLesson_price());	
					job.put("lessonCount",lesson.getLesson_count());
					job.put("lessonStartDate", lesson.getLesson_startdate().toString());			
					job.put("lessonContop",lesson.getLesson_contop());
					job.put("lessonConmid",lesson.getLesson_conmid());
					job.put("lessonConbot",lesson.getLesson_conbot());
					job.put("lessonKeyword",lesson.getLesson_keyword());
					job.put("lessonType",lesson.getLesson_type());
					if(lesson.getLesson_rename()!=null)
						job.put("photo",lesson.getLesson_rename());
						else 
						job.put("photo","rakoon.jpg");
							
					jarr.add(job);			
				}
					
					//전송용 객체에 jarr 배열 담음
					json.put("list", jarr);
					System.out.println("Lessonjson : " + json.toJSONString());
					
					response.setContentType("application/json; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println(json.toJSONString());
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
