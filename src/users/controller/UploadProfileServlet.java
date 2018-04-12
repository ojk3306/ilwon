package users.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import lesson.model.service.LessonService;
import users.model.service.UsersService;
import users.model.vo.Users;

/**
 * Servlet implementation class UploadProfileServlet
 */
@WebServlet("/uploadp")
public class UploadProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadProfileServlet() {
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
			
			view = request.getRequestDispatcher("views/board/boardError.jsp");
			request.setAttribute("message", "form �깭洹몄뿉 enctype �냽�꽦�씠 �꽕�젙�릺吏� �븡�븯�뒿�땲�떎.");
			view.forward(request, response);
		}
		
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "userTitleimg";
		
		MultipartRequest mrequest = new MultipartRequest(
				request, savePath, maxSize, "utf-8",
				new DefaultFileRenamePolicy());		
		int userNo = Integer.parseInt(mrequest.getParameter("userno"));
		Users user = new Users();
		
		user.setUserNo(Integer.parseInt(mrequest.getParameter("userno")));
		user.setUserOriginalPhoto(mrequest.getFilesystemName("upfile"));
		
		String original = user.getUserOriginalPhoto();
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
			
			user.setUserRenamePhoto(rename);
		}
		
		int result = new UsersService().uploadProfile(user);
		Users loginUser = new UsersService().updateLogin(userNo);
		response.setContentType("text/html; charset=utf-8");
		
		//세션 새로생성하자
	/*	HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
			response.sendRedirect("index.jsp");
		}*/
		
		if(loginUser != null) {
		HttpSession session = request.getSession(false);        	
		session.invalidate();
		HttpSession session2 = request.getSession();
    	session2.setAttribute("loginUser", loginUser);
    	
		   }
		
		if(result > 0) {
			 PrintWriter out = response.getWriter();
			 String str="";
			   str = "<script language='javascript'>";
			   str += "opener.window.location.reload();";  //오프너 새로고침
			   str += "self.close();";   // 창닫기
			    str += "</script>";
			   out.print(str);
			//response.sendRedirect("/prototype/04.OJK\\teacherdetail.jsp");
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
