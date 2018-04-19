package lesson.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lesson.model.service.LessonService;

/**
 * Servlet implementation class CheckLessonNumber
 */
@WebServlet("/checklessonNum")
public class CheckLessonNumber extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckLessonNumber() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	//해당 유저의 최대 강의갯수를 구한다.
	int LessonMax=new users.model.service.UsersService().getLessonMaxByUserNO(Integer.parseInt(request.getParameter("no")));
		System.out.println("LessonMax="+LessonMax);
		if(LessonMax > 0 ) {
			//글쓰기권한은 있고, 이제 레슨에서 자신이 몇개의 강의를 등록했는지 , 몇개더 등록할수잇는지 확인한다.
			int LessonNowNum = new LessonService().getLessonNumByUserNO(Integer.parseInt(request.getParameter("no")));
			
			if(LessonMax > LessonNowNum) {
			//등록이 가능함
				System.out.println("해당 선생은 글쓰기 가능함.");
				//이경우, 글쓰기 권한이 없는경우이다.
				PrintWriter out = response.getWriter();
				out.println(3);
				out.flush();
				out.close();
			}else {
			//등록이 불가능함	
				System.out.println("해당 선생은 글쓰기 불가능.");
				//이경우, 글쓰기 권한이 없는경우이다.
				PrintWriter out = response.getWriter();
				out.println(2);
				out.flush();
				out.close();
			}
			
		}else {
			System.out.println("해당 선생은 글쓰기 권한이없음.");
			//이경우, 글쓰기 권한이 없는경우이다.
			PrintWriter out = response.getWriter();
			out.println(1);
			out.flush();
			out.close();
		}
		
		
		
	//해당 유저가 강의등록한 강의수를 구한다.
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
