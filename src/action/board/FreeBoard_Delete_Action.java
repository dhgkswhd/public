package action.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnABoardDAO;

@WebServlet("/free_board_delete.do")
public class FreeBoard_Delete_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String Strfb_idx = request.getParameter("fb_idx");
		int fb_idx = Integer.parseInt(Strfb_idx);
		
		System.out.println("삭제할 게시물번호 : " + Strfb_idx);
		
		QnABoardDAO.getInstance().delete_Board( fb_idx );
		
		response.sendRedirect("free_board_main.do");
		
	}

}
