package semina.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semina.model.service.SeminaService;
import semina.model.vo.Semina;

/**
 * Servlet implementation class Seminainsert
 */
@WebServlet("/semupup")
public class SeminaUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeminaUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		// 업로드할 파일의 용량 제한 : 10Mbyte로 제한한다면
				int maxSize = 1024 * 1024 * 10;

				RequestDispatcher view = null;
				// enctype="multipart/form-data" 로 전송되었는지 확인
				if (!ServletFileUpload.isMultipartContent(request)) {
					view = request.getRequestDispatcher("04.OJK/insertSemina.jsp");
					request.setAttribute("message", "form enctype 속성 사용 안 됨!");
					view.forward(request, response);
				}
				// 해당 컨테이너의 구동중인 웹 애플리케이션의 루트 경로 알아냄
				String root = request.getSession().getServletContext().getRealPath("/");
				// 업로드되는 파일이 저장될 폴더명과 경로 연결 처리
				String savePath = root + "seminaTitleimg";
				// web/seminaTitleimg을 세미나 강의에서 받을 타이틀 이미지로 지정함
			System.out.println("root="+root);
			System.out.println("savePath="+savePath);
				// request 를 MultipartRequest 객체로 변환함
				MultipartRequest mrequest = new MultipartRequest(
				request, savePath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());
				Semina semi= new Semina();
				semi.setSeminaTitle(mrequest.getParameter("title"));
				semi.setSeminaNo(Integer.parseInt(mrequest.getParameter("semino")));
				semi.setSeminaEndDate(Date.valueOf(mrequest.getParameter("seminadate")));
				semi.setSeminaLocation(mrequest.getParameter("loc"));
				semi.setSeminaPrice(Integer.parseInt(mrequest.getParameter("cost")));
				semi.setSeminaMax(Integer.parseInt(mrequest.getParameter("max")));
				semi.setSeminaMin(Integer.parseInt(mrequest.getParameter("min")));
				semi.setUserNo(Integer.parseInt(mrequest.getParameter("userno")));
				semi.setSeminatitle1(mrequest.getParameter("detailtitle"));
				semi.setSeminaContent1(mrequest.getParameter("detailinfo"));
				//1번디테을은 널일수가없다.
				if(mrequest.getParameter("detailtitle1")!=null) {
				semi.setSeminatitle2(mrequest.getParameter("detailtitle1"));
				semi.setSeminaContent2(mrequest.getParameter("detailinfo1"));
				}else {
				semi.setSeminatitle2("추후에 준비합니다");
				semi.setSeminaContent2("추후에 준비합니다");	
				}
				if(mrequest.getParameter("detailtitle2")!=null) {
				semi.setSeminatitle3(mrequest.getParameter("detailtitle2"));
				semi.setSeminaContent3(mrequest.getParameter("detailinfo2"));
				}else {
				semi.setSeminatitle3("추후에 준비합니다");
				semi.setSeminaContent3("추후에 준비합니다");	
				}
				if(mrequest.getParameter("detailtitle3")!=null) {
				semi.setSeminatitle4(mrequest.getParameter("detailtitle3"));
				semi.setSeminaContent4(mrequest.getParameter("detailinfo3"));
				}else {
				semi.setSeminatitle4("추후에 준비합니다");
				semi.setSeminaContent4("추후에 준비합니다");	
				}
				
				
				
				
				String originFileName = mrequest.getFilesystemName("titleimg");
				
				if (originFileName != null) {
					// 업로도된 파일명을 "년월일시분초.확장자" 로 변경함
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

					// 파일명 바꾸기하려면 File 객체의 renameTo() 사용함
					File originFile = new File(savePath + "\\" + originFileName);
					File renameFile = new File(savePath + "\\" + renameFileName);

					// 파일이름 바꾸기 실행 >> 실패할 경우 직접 바꾸기함
					// 새 파일만들고 원래 파일내용 읽어서 복사 기록하고
					// 원 파일 삭제함
					if (!originFile.renameTo(renameFile)) {
						int read = -1;
						byte[] buf = new byte[1024];
						// 한번에 읽을 배열 크기 지정
						FileInputStream fin = new FileInputStream(originFile);
						FileOutputStream fout = new FileOutputStream(renameFile);

						while ((read = fin.read(buf, 0, buf.length)) != -1) {
							fout.write(buf, 0, read);
						}

						fin.close();
						fout.close();
						originFile.delete(); // 원본 파일 삭제함
					}

			    semi.setSeminaOriginalFileName(originFileName);
				semi.setSeminaRenameFileName(renameFileName);
				} 
				
				System.out.println(semi.toString());
				
				response.setContentType("text/html; charset=utf-8");
				
				
			
				if (new SeminaService().updateSemina(semi) > 0) {
					
					response.sendRedirect("/prototype/04.OJK/teacherinfo.jsp");
					
				} else {
					view = request.getRequestDispatcher("views/board/boardError.jsp");
					request.setAttribute("message", "게시 원글 등록 서비스 실패!");
					view.forward(request, response);
				}
			}
	
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
