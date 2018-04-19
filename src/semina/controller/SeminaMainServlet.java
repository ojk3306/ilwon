package semina.controller;

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

import semina.model.vo.*;
import semina.model.service.*;

/**
 * Servlet implementation class SeminaMainServlet
 */
@WebServlet("/smlist")
public class SeminaMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeminaMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Semina> list = new SeminaService().selectMainSemina();				
		
		//전송은 json 객체 한개만 전송할 수 있음
		//최종 전송용 json 객체 생성함
		JSONObject json = new JSONObject();
			
		//list 를 옮겨 담을 json 배열 객체가 필요함.
		JSONArray jarr = new JSONArray();
			
		//list 에서 user 객체 한 개 꺼냄
		// => json 객체 한 개에 값들을 옮겨 담음.
		// => json 객체를 json 배열에 저장함.
		for(Semina semina : list) {
			//한 사람의 정보를 저장할 json 객체 생성함
			JSONObject job = new JSONObject();
			job.put("seminaNo", semina.getSeminaNo());
			job.put("userNo",semina.getUserNo());					
			job.put("seminaTitle", semina.getSeminaTitle());			
			job.put("seminaLocation", semina.getSeminaLocation());
			job.put("seminaPrice", semina.getSeminaPrice());
			job.put("seminaStartDate", semina.getSeminaStartDate());
			job.put("seminaState", semina.getSEMINA_STATE());
			job.put("seminaTitle1", semina.getSeminatitle1());
			job.put("seminaContent1", semina.getSeminaContent1());
			job.put("seminaTitle2", semina.getSeminatitle2());
			job.put("seminaContent2", semina.getSeminaContent2());
			job.put("seminaTitle3", semina.getSeminatitle3());
			job.put("seminaContent3", semina.getSeminaContent3());
			job.put("seminaTitle4", semina.getSeminatitle4());
			job.put("seminaContent4", semina.getSeminaContent4());
			job.put("seminaEndDate", semina.getSeminaEndDate());
			job.put("seminaMin", semina.getSeminaMin());
			job.put("seminaNow", semina.getSeminaNow());
			job.put("seminaMax", semina.getSeminaMax());
			job.put("seminaOFN", semina.getSeminaOriginalFileName());
			job.put("seminaRFN", semina.getSeminaRenameFileName());
			job.put("userName", semina.getUser_name());
			job.put("userEmail", semina.getUser_email());
				
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
