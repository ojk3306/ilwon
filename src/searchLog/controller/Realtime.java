package searchLog.controller;

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

import searchLog.model.service.SearchLogService;

/**
 * Servlet implementation class Realtime
 */
@WebServlet("/realtimelog")
public class Realtime extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Realtime() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	ArrayList<String> word = new SearchLogService().realTimeList();
		
	
	JSONObject json = new JSONObject();		
	//list 를 옮겨 담을 json 배열 객체가 필요함
	JSONArray jarr = new JSONArray();		
	
	//list 에서 user 객체 한 개 꺼냄
	// => json 객체 한 개에 값들을 옮겨 담음
	// => json 객체를 json 배열에 저장함

	for(String  i : word) {
	
	JSONObject job = new JSONObject();
	
	job.put("word",i);
	
	jarr.add(i);
	
	}
	//전송용 객체에 jarr 배열 담음
	json.put("list", jarr);
	/*System.out.println("json : " + json.toJSONString() + " / (To.SearchLogServlet)");*/
	
	response.setContentType("application/json; charset=utf-8");
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
