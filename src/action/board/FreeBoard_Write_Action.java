package action.board;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.QnABoardDAO;
import vo.QnABoardVO;

@WebServlet("/free_board_write.do")
public class FreeBoard_Write_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			
			String 	fb_title 		= request.getParameter("fb_title");   // 제목 파라미터
			String 	fb_writer 		= request.getParameter("fb_writer");  // 작성자 파라미터
			String 	fb_content 		= request.getParameter("fb_content"); // 내용 파라미터
			String  fb_pwd 			= request.getParameter("fb_pwd");
			
			// VO에 저장
			QnABoardVO board = new QnABoardVO();
			board.setFb_title(fb_title);
			board.setFb_writer(fb_writer);
			board.setFb_content(fb_content);
			board.setFb_pwd(fb_pwd);
			
			// DB에 insert
			QnABoardDAO.getInstance().insert_Board( board );
			
			// 게시판 메인페이지로 이동
			response.sendRedirect("free_board_main.do");
	}
		
}
