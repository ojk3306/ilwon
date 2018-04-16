package notice.controller;

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

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class MainNoticeServlet
 */
@WebServlet("/mainnotice")
public class MainNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//리스트 결과를 json 배열에 담아서, 전송하는 컨트롤러				
			ArrayList<Notice> list = new NoticeService().selectMainNotice();				
				
			//전송은 json 객체 한개만 전송할 수 있음
			//최종 전송용 json 객체 생성함
			JSONObject json = new JSONObject();
				
			//list 를 옮겨 담을 json 배열 객체가 필요함.
			JSONArray jarr = new JSONArray();
				
			//list 에서 user 객체 한 개 꺼냄
			// => json 객체 한 개에 값들을 옮겨 담음.
			// => json 객체를 json 배열에 저장함.
			for(Notice notice : list) {
				//한 사람의 정보를 저장할 json 객체 생성함
				JSONObject job = new JSONObject();
				job.put("noticeNo", notice.getNoticeNo());
				job.put("noticeTitle",notice.getNoticeTitle());					
				job.put("userName", notice.getUserName());			
				job.put("noticeDate", notice.getNoticeDate().toString());
					
				jarr.add(job);			
			}
				
				//전송용 객체에 jarr 배열 담음
				json.put("list", jarr);
				System.out.println("MainNoticeJson : " + json.toJSONString());
				
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
