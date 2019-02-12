package action.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDAO;
import dao.QnABoardDAO;
import vo.CommentVO;
import vo.QnABoardVO;


@WebServlet("/free_board_comment.do")
public class FreeBoard_Comment_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String Strfb_idx = request.getParameter("fb_idx");
		int fb_idx = Integer.parseInt(Strfb_idx);
		
		String com_comment = request.getParameter("com_comment");
		String com_writer = request.getParameter("com_writer");
		
		// VO에 저장
		CommentVO comment = new CommentVO();
		comment.setFb_idx(fb_idx);
		comment.setCom_comment(com_comment);
		comment.setCom_writer(com_writer);
		
		// DB에 insert
		CommentDAO.getInstance().insert_Comment(comment);
		
		response.setContentType("text/plain; charset=utf-8");
		String resultStr = String.format("[{'fb_idx': '%s'}]" ,Strfb_idx);
		response.getWriter().println( resultStr );// 응답 페이지에 내용 쓰기
		
	}

}
