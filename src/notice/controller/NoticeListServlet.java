package notice.controller;

import java.io.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import notice.model.service.*;
import notice.model.vo.*;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/nlist")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
int currentPage = 1;
		
		//전달된 페이지값 추출
		if(request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		//한 페이지당 출력할 목록 갯수 지정
		int limit = 10;
		
		NoticeService nservice = new NoticeService();
		//전체 목록 갯수 조회
		int listCount = nservice.getListCount();
		//System.out.println("총 게시글 수 : " + listCount);			
		
		//System.out.println("list : " + list);
		
		//총 페이지수 계산 : 목록이 1개일 떄 1페이지로 처리
		int maxPage = (int)((double)listCount / limit + 0.9);
		//현재 페이지 그룹(10개 페이지를 한그룹)에 보여줄 시작 페이지 수
		//현재 페이지가 13페이지이면 그룹은 11~20페이지가 보여지게 한다.
		int startPage = (((int)((double)currentPage / limit + 0.9))-1) * limit + 1;
		
		int endPage = startPage + limit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		} else {
			
		}
		
		//리스트 결과를 json 배열에 담아서, 전송하는 컨트롤러				
		ArrayList<Notice> list = new NoticeService().selectList(currentPage, limit);
		
		response.setContentType("text/html; charset=UTF-8");
		RequestDispatcher view = null;
		if(list.size() > 0) {
			view = request.getRequestDispatcher("views/board/boardListView.jsp");
			request.setAttribute("list", list);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listCount", listCount);			
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("views/board/boardError.jsp");
			request.setAttribute("message", currentPage + "에 대한 조회 실패");
			view.forward(request, response);
		}
			
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
			System.out.println("Noticejson : " + json.toJSONString());
			
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
