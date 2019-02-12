package action.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member_leaving.do")
public class Member_Leaving_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 탈퇴페이지 이동하기전에 할일 여기서함
		
		RequestDispatcher disp = request.getRequestDispatcher("member/member_leaving.jsp");
		disp.forward(request, response);
	}

}
