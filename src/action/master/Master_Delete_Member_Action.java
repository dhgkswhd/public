package action.master;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MasterDAO;


@WebServlet("/member_delete.do")
public class Master_Delete_Member_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int master = Integer.parseInt(request.getParameter("master"));
		if( master == 1 ) {
			int g_idx = Integer.parseInt(request.getParameter("g_idx"));
			MasterDAO.getInstance().delete_general_member( g_idx );
		}
		else if( master == 2 ) {
			int b_idx = Integer.parseInt(request.getParameter("b_idx"));
			MasterDAO.getInstance().delete_business_member( b_idx );
		}
		
		response.sendRedirect("phonelist.do");
		
	}

}
