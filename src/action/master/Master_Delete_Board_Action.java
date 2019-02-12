package action.master;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MasterDAO;


@WebServlet("/board_delete.do")
public class Master_Delete_Board_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int fb_idx = Integer.parseInt(request.getParameter("fb_idx"));
		MasterDAO.getInstance().delete_board( fb_idx );
		response.sendRedirect("board_list_action.do");
	}

}
