package lesson.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import lesson.model.service.LessonService;
import lesson.model.vo.Lesson;

/**
 * Servlet implementation class InsertClassServlet
 */
@WebServlet("/insertlesson.sm")
public class InsertLessonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertLessonServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int maxSize = 1024 * 1024 * 10;
		
		RequestDispatcher view = null;
		if(!ServletFileUpload.isMultipartContent(request)) {
			//enctype 설정이 되지 않았다면
			view = request.getRequestDispatcher("views/board/boardError.jsp");
			request.setAttribute("message", "form 태그에 enctype 속성이 설정되지 않았습니다.");
			view.forward(request, response);
		}
		
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "lesson_upload";
		
		MultipartRequest mrequest = new MultipartRequest(
				request, savePath, maxSize, "utf-8",
				new DefaultFileRenamePolicy());		
		
		
		Lesson lesson = new Lesson();
		
		lesson.setLesson_title(mrequest.getParameter("title"));
		lesson.setLevel_no(Integer.parseInt(mrequest.getParameter("level")));
		lesson.setUser_no2(Integer.parseInt(mrequest.getParameter("userno")));
		lesson.setLesson_price(Integer.parseInt(mrequest.getParameter("price")));
		lesson.setLesson_count(Integer.parseInt(mrequest.getParameter("count")));
		lesson.setLesson_contop(mrequest.getParameter("contop"));
		lesson.setLesson_conmid(mrequest.getParameter("conmid"));
		lesson.setLesson_conbot(mrequest.getParameter("conbot"));
		lesson.setLesson_loc(mrequest.getParameter("loc"));
		lesson.setLesson_rad(Integer.parseInt(mrequest.getParameter("rad")));
		lesson.setLesson_keyword(mrequest.getParameter("keyword"));
		lesson.setLesson_orginal(mrequest.getFilesystemName("upfile"));
		
		String original = lesson.getLesson_orginal();
		if(original!=null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String rename = sdf.format(new java.sql.Date(System.currentTimeMillis()))
					+ "." + original.substring(original.lastIndexOf(".") + 1);
			//파일명 바꾸려면 File 객체의 renameTo() 사용함
			File originFile = new File(savePath + "\\" + original);
			File renameFile = new File(savePath + "\\" + rename);
			
			if(!originFile.renameTo(renameFile)) {
				//파일이름 바꾸기 실패햇다면
				int read = -1;
				byte[] buf = new byte[1024];
				//한번에 읽을 배열 크기 지정
				//원본을 읽기 위한 파일스트림 생성
				FileInputStream fin = new FileInputStream(originFile);
				//읽은 내용 기록할 복사본 파일 출력용 스트림 생성
				FileOutputStream fout = new FileOutputStream(renameFile);
				
				//원본 읽어서 복사본에 기록 처리
				while((read = fin.read(buf, 0, buf.length)) != -1) {
					fout.write(buf, 0, read);
				}
				
				//스트림 반납
				fin.close();
				fout.close();
				originFile.delete(); //원본 삭제
				
			} //rename if close
			
			lesson.setLesson_orginal(rename);
		}
		
		
		
		int result = new LessonService().insertlesson(lesson);
		
		response.setContentType("text/html; charset=utf-8");
		
		if(result > 0) {
			response.sendRedirect("/prototype/04.OJK\\lessonSuccess.jsp");
		}else {
			response.sendRedirect("index.jsp");
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
