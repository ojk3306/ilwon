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
import searchLog.model.service.SearchLogService;
import lesson.model.vo.Sidebar;
/**
 * Servlet implementation class SeachTeacherFromSidebar
 */
@WebServlet("/tsider")
public class SeachTeacherFromSidebar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

    public SeachTeacherFromSidebar() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//선생을 찾는것이 아니라 강의를 찾는것
	ArrayList<Sidebar> LessonList = new ArrayList<Sidebar>();
		
	if(request.getParameter("userno")!=null) {
		
		//로그인이 아닐시 유저가 평소에 검색한 키워드를 추출해온다.
		ArrayList<String> list=new SearchLogService().getSearchhistroy(Integer.parseInt(request.getParameter("userno")));
		
		if(list.size()!=0) {
		//로그인 유저가 평소에 검색한것이 있다면, 그 키워드를 토대로 강의를 가져온다.
		LessonList = new LessonService().seachlistByKeyword(list.get(0));
					System.out.println( list.size());
	    //첫번째 키워드값을 지닌 강의의 수가 적을수 있다. 그럴경우 2번째 꺼까지 간다.
		if(LessonList.size()<9 && list.size() > 2  ) 
		LessonList=new LessonService().seachlistByKeyword(list.get(1),LessonList);		
		}
	}
		
	//비로그인시, 검색결과가 없다는것이므로, 강의를 전체검색후, 랜덤하게 6개를 뽑는다. 혹은 위에서 로그인하고도, 키워드 검색후 레슨결과가 6개가 안나왔을시,
	if(LessonList.size()<9)
	LessonList = new LessonService().seachlistByKeyword(LessonList);
			
	//모든 값이 정리되었으므로, 이제 제이슨을 이용해서 다시 jsp로 쏜다.		
	
	JSONObject json = new JSONObject();
	
	JSONArray jarr = new JSONArray();
	
	for(Sidebar l : LessonList) {
		
		JSONObject job = new JSONObject();
		job.put("username", l.getUser_name());
		job.put("lesson_no", l.getLesson_no());
		job.put("CATEGORY_SMALL", l.getCategory_small());
		
		if(l.getLESSON_RENAME_PHOTO()!=null) {			
		job.put("LESSON_RENAME_PHOTO", l.getLESSON_RENAME_PHOTO());
		}else {
		job.put("LESSON_RENAME_PHOTO","rakoon.jpg");
		}
		jarr.add(job);
	}
	
	
	
	
	json.put("list", jarr);

    response.setContentType("application/json; charset=utf-8;");
	PrintWriter out = response.getWriter();
	out.print(json.toJSONString());
	out.flush();
	out.close();
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
