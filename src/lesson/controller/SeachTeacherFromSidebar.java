package lesson.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lesson.model.service.LessonService;
import lesson.model.vo.Lesson;
import searchLog.model.service.SearchLogService;

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
		
		if(request.getParameter("userno")!=null) {
		System.out.println(request.getParameter("userno"));
		//로그인이 아닐시 유저가 평소에 검색한 키워드를 추출해온다.
		ArrayList<String> list=new SearchLogService().getSearchhistroy(Integer.parseInt(request.getParameter("userno")));
		
				if(list.size()!=0) {
				//로그인 유저가 평소에 검색한것이 있다면, 그 키워드를 토대로 강의를 가져온다.
				ArrayList<Lesson> LessonList = new LessonService().seachlistByKeyword(list.get(0));
				
					
				}
		}else {
		//비로그인시, 검색결과가 없다는것이므로, 강의를 전체검색후, 랜덤하게 6개를 뽑는다.
			
			
			
		}
		
		
		
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
