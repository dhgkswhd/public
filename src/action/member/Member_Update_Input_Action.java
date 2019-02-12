package action.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member_update_input.do")
public class Member_Update_Input_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원정보 수정페이지로 이동하기전에 할일 있으면 여기서 함
		
		RequestDispatcher disp = request.getRequestDispatcher("member/member_update.jsp");
		disp.forward(request, response);
	}

}
