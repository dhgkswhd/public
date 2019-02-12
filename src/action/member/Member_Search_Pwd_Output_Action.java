package action.member;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BuyerDAO;
import dao.SellerDAO;

@WebServlet("/member_search_pwd_output.do")
public class Member_Search_Pwd_Output_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id"); 					// 파라미터 아이디
		String phonenumber = request.getParameter("phoneNumber"); 	// 파라미터 휴대폰번호
		String membertype = request.getParameter("membertype"); 	// 파라미터 회원타입
		
		String resultPwd = ""; // 비밀번호 찾아온 결과 (없으면 null)
		
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("phonenumber", phonenumber); // 맵에 담아서 보냄
		
		if ( membertype.equals("일반") ) {
			resultPwd = SellerDAO.getInstance().searchUserPwd( map );
		}
		
		else if ( membertype.equals("사업자") ) {
			resultPwd = BuyerDAO.getInstance().searchUserPwd( map );
		}
		
		request.setAttribute("resultPwd", resultPwd);

		RequestDispatcher disp = request.getRequestDispatcher("member/member_search_pwd_result.jsp");
		disp.forward(request, response);
		
	}

}
