package users.controller;

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
			//enctype �꽕�젙�씠 �릺吏� �븡�븯�떎硫�
			view = request.getRequestDispatcher("views/board/boardError.jsp");
			request.setAttribute("message", "form �깭洹몄뿉 enctype �냽�꽦�씠 �꽕�젙�릺吏� �븡�븯�뒿�땲�떎.");
			view.forward(request, response);
		}
		
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "userTitleimg";
		
		MultipartRequest mrequest = new MultipartRequest(
				request, savePath, maxSize, "utf-8",
				new DefaultFileRenamePolicy());		
		
		Users user = new Users();
		
		user.setUserNo(Integer.parseInt(mrequest.getParameter("no")));
		user.setUserOriginalPhoto(mrequest.getFilesystemName("upfile"));
		
		String original = user.getUserOriginalPhoto();
		if(original!=null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String rename = sdf.format(new java.sql.Date(System.currentTimeMillis()))
					+ "." + original.substring(original.lastIndexOf(".") + 1);
			//�뙆�씪紐� 諛붽씀�젮硫� File 媛앹껜�쓽 renameTo() �궗�슜�븿
			File originFile = new File(savePath + "\\" + original);
			File renameFile = new File(savePath + "\\" + rename);
			
			if(!originFile.renameTo(renameFile)) {
				//�뙆�씪�씠由� 諛붽씀湲� �떎�뙣�뻼�떎硫�
				int read = -1;
				byte[] buf = new byte[1024];
				//�븳踰덉뿉 �씫�쓣 諛곗뿴 �겕湲� 吏��젙
				//�썝蹂몄쓣 �씫湲� �쐞�븳 �뙆�씪�뒪�듃由� �깮�꽦
				FileInputStream fin = new FileInputStream(originFile);
				//�씫�� �궡�슜 湲곕줉�븷 蹂듭궗蹂� �뙆�씪 異쒕젰�슜 �뒪�듃由� �깮�꽦
				FileOutputStream fout = new FileOutputStream(renameFile);
				
				//�썝蹂� �씫�뼱�꽌 蹂듭궗蹂몄뿉 湲곕줉 泥섎━
				while((read = fin.read(buf, 0, buf.length)) != -1) {
					fout.write(buf, 0, read);
				}
				
				//�뒪�듃由� 諛섎궔
				fin.close();
				fout.close();
				originFile.delete(); //�썝蹂� �궘�젣
				
			} //rename if close
			
			user.setUserRenamePhoto(rename);
		}
		
		int result = new UsersService().uploadProfile(user);
		
		response.setContentType("text/html; charset=utf-8");
		
		if(result > 0) {
			response.sendRedirect("/prototype/04.OJK\\teacherdetail.jsp");
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
