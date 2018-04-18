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
import lesson.model.vo.LessonSearch;

/**
 * Servlet implementation class LearnSearchServlet
 */
@WebServlet("/lsearch")
public class LessonKeywordSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LessonKeywordSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LessonKeywordSearchServlet Run : " + request.getParameter("keywordValue"));
	
		String keywordValue = request.getParameter("keywordValue");		
		
		LessonSearch ls = new LessonSearch(keywordValue);			
		System.out.println("SendInfo : " + ls + " / (To.LessonKeywordSearchServlet)");		
		ArrayList<LessonSearch> list = new LessonService().selectSearchKeyword(ls);
					
		//전송은 json 객체 한개만 전송할 수 있음
		//최종 전송용 json 객체 생성함
		JSONObject json = new JSONObject();
			
		//list 를 옮겨 담을 json 배열 객체가 필요함.
		JSONArray jarr = new JSONArray();
			
		//list 에서 user 객체 한 개 꺼냄
		// => json 객체 한 개에 값들을 옮겨 담음.
		// => json 객체를 json 배열에 저장함.
		for(LessonSearch lessonSearch : list) {
			//한 사람의 정보를 저장할 json 객체 생성함
			JSONObject job = new JSONObject();
			
			job.put("locationValue", lessonSearch.getLocationValue());
			job.put("lessonValue", lessonSearch.getLessonValue());
			job.put("genderValue", lessonSearch.getTeacherGenderValue());
			job.put("teacherPreValue", lessonSearch.getTeacherAgePreValue());
			job.put("teacherEndValue", lessonSearch.getTeacherAgeEndValue());
			job.put("lessonPricePreValue", lessonSearch.getLessonPricePreValue());
			job.put("lessonPriceEndValue", lessonSearch.getLessonPriceEndValue());
			job.put("lessonLevelPreValue", lessonSearch.getLessonLevelPreValue());
			job.put("lessonLevelEndValue", lessonSearch.getLessonLevelEndValue());
			job.put("lessonNo",lessonSearch.getLesson_no());
			job.put("levelNo",lessonSearch.getLevel_no());
			job.put("stateNo",lessonSearch.getState_no());
			job.put("categoryNo", lessonSearch.getCategory_no());
			job.put("categoryBName", lessonSearch.getCategory_bigName());
			job.put("categorySName", lessonSearch.getCategory_smallName());
			job.put("userNo1", lessonSearch.getUser_no1());			
			job.put("userNo2", lessonSearch.getUser_no2());			
			job.put("userName1", lessonSearch.getUser_name1());			
			job.put("userName2", lessonSearch.getUser_name2());			
			job.put("lessonTitle",lessonSearch.getLesson_title());	
			job.put("lessonLocation",lessonSearch.getLesson_loc());	
			job.put("lessonRadius",lessonSearch.getLesson_rad());	
			job.put("lessonPrice",lessonSearch.getLesson_price());	
			job.put("lessonCount",lessonSearch.getLesson_count());
			job.put("lessonStartDate", lessonSearch.getLesson_startdate().toString());
			/*job.put("lessonEndDate", lessonSearch.getLesson_enddate().toString());*/
			job.put("lessonContop",lessonSearch.getLesson_contop());
			job.put("lessonConmid",lessonSearch.getLesson_conmid());
			job.put("lessonConbot",lessonSearch.getLesson_conbot());
			job.put("lessonKeyword",lessonSearch.getLesson_keyword());
			job.put("lessonType",lessonSearch.getLesson_type());
				
			jarr.add(job);			
		}
			
			//전송용 객체에 jarr 배열 담음
			json.put("list", jarr);
			System.out.println("Lessonjson : " + json.toJSONString() + " / (To.LessonKeywordSearchServlet)");
			
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
