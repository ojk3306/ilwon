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
			//enctype �꽕�젙�씠 �릺吏� �븡�븯�떎硫�
			view = request.getRequestDispatcher("views/board/boardError.jsp");
			request.setAttribute("message", "form �깭洹몄뿉 enctype �냽�꽦�씠 �꽕�젙�릺吏� �븡�븯�뒿�땲�떎.");
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
		lesson.setLesson_orginal2(mrequest.getFilesystemName("upfile2"));
		lesson.setLesson_orginal3(mrequest.getFilesystemName("upfile3"));
		
		//키워드 합치기 부분
				String[] keywords = mrequest.getParameterValues("keyword");
				StringBuilder sb = new StringBuilder();
				for(int i = 0; i <  keywords.length; i++) {
					if(i < keywords.length -1) {
						sb.append(keywords[i] + ", ");
					}else {
						sb.append(keywords[i]);
					}
					lesson.setLesson_keyword(sb.toString());
				}
				System.out.println(keywords);
				
				//String.join() 사용
		
		
		
		
		
		//업로드 파일 부분 1
		String original = lesson.getLesson_orginal();
		if(original!=null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String rename = sdf.format(new java.sql.Date(System.currentTimeMillis()))
					+ "." + original.substring(original.lastIndexOf(".") + 1);
			
			File originFile = new File(savePath + "\\" + original);
			File renameFile = new File(savePath + "\\" + rename);
			
			if(!originFile.renameTo(renameFile)) {
				
				int read = -1;
				byte[] buf = new byte[1024];
				
				FileInputStream fin = new FileInputStream(originFile);
				
				FileOutputStream fout = new FileOutputStream(renameFile);
				
				
				while((read = fin.read(buf, 0, buf.length)) != -1) {
					fout.write(buf, 0, read);
				}
				
			
				fin.close();
				fout.close();
				originFile.delete(); 
				
			} //rename if close
			
			lesson.setLesson_rename(rename);
		}
		
		//업로드 파일 부분 2
		String original2 = lesson.getLesson_orginal2();
		if(original2!=null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String rename2 = sdf.format(new java.sql.Date(System.currentTimeMillis()))+"2"
					+ "." + original2.substring(original2.lastIndexOf(".") + 1);
			
			File originFile2 = new File(savePath + "\\" + original2);
			File renameFile2 = new File(savePath + "\\" + rename2);
			
			if(!originFile2.renameTo(renameFile2)) {
				
				int read = -1;
				byte[] buf = new byte[1024];
				
				FileInputStream fin2 = new FileInputStream(originFile2);
				
				FileOutputStream fout2 = new FileOutputStream(renameFile2);
				
				
				while((read = fin2.read(buf, 0, buf.length)) != -1) {
					fout2.write(buf, 0, read);
				}
				
			
				fin2.close();
				fout2.close();
				originFile2.delete(); 
				
			} //rename if close
			
			lesson.setLesson_rename2(rename2);
		}
		
		//업로드 파일 부분 3
		String original3 = lesson.getLesson_orginal3();
		if(original3!=null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String rename3 = sdf.format(new java.sql.Date(System.currentTimeMillis()))+"3"
					+ "." + original3.substring(original3.lastIndexOf(".") + 1);
			
			File originFile3 = new File(savePath + "\\" + original3);
			File renameFile3 = new File(savePath + "\\" + rename3);
			
			if(!originFile3.renameTo(renameFile3)) {
				
				int read = -1;
				byte[] buf = new byte[1024];
				
				FileInputStream fin3 = new FileInputStream(originFile3);
				
				FileOutputStream fout3 = new FileOutputStream(renameFile3);
				
				
				while((read = fin3.read(buf, 0, buf.length)) != -1) {
					fout3.write(buf, 0, read);
				}
				
			
				fin3.close();
				fout3.close();
				originFile3.delete(); 
				
			} //rename if close
			
			lesson.setLesson_rename3(rename3);
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
