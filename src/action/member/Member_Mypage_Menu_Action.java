package action.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member_mypage_menu.do")
public class Member_Mypage_Menu_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 마이페이지 메뉴로 이동하기전에 할일 여기서 함
		
		RequestDispatcher disp = request.getRequestDispatcher("member/member_mypage_menu.jsp");
		disp.forward(request, response);
	}

}
