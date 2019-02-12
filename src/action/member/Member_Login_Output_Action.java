package action.member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.BuyerDAO;
import dao.SellerDAO;
import vo.BuyerVO;
import vo.SellerVO;

@WebServlet("/member_login_output.do")
public class Member_Login_Output_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String type = request.getParameter("membertype");
		
		Map<String, String> inputData = new HashMap<>();
		inputData.put("id", id);
		inputData.put("pwd", pwd);
	
		String msg = ""; // ajax 콜백함수로 내보내서 보여줄 메세지
		
		// 접속한 시간 구하기
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("MM월 dd일 ");
		SimpleDateFormat time = new SimpleDateFormat("a hh:mm");
		
		
		if ( type.equals("일반") ) {
			SellerVO vo = SellerDAO.getInstance().getUserData( inputData );
			
			if ( vo == null ) {
				msg = "no";
			} else {
				/** 관리자로 로그인 할 경우 수행될 코드 */
				if ( vo.getSeller_idx() == 0 ) {
					session.setAttribute("memberType", "관리자");
					session.setAttribute("memberId", "master");
					
					String resultStr = "[ {'msg' : 'master'}, {'type' : '관리자'} ]";
					response.setContentType("text/plain; charset=utf-8");
					response.getWriter().println( resultStr );
					return;
				}
				
				msg = "yes";
				
				session.setAttribute("memberVO", vo); // set 회원정보 전체
				session.setAttribute("memberId", vo.getSeller_id()); // set 아이디
				session.setAttribute("memberPwd", vo.getSeller_pwd()); // set 비밀번호
				session.setAttribute("memberIdx", vo.getSeller_idx()); // 회원번호
				session.setAttribute("memberWallet", vo.getSeller_wallet()); // 보유한 돈
				session.setAttribute("memberType", type); // set 회원타입
				session.setAttribute("loginTime", date.format(today) + time.format(today)); // 접속한시간
			}
		}
		else if ( type.equals("사업자") ) {
			BuyerVO vo = BuyerDAO.getInstance().getUserData( inputData );
			
			if ( vo == null ) {
				msg = "no";
			} else {
				msg = "yes";
				
				session.setAttribute("memberVO", vo); // set회원정보
				session.setAttribute("memberId", vo.getBuyer_id()); // set아이디
				session.setAttribute("memberPwd", vo.getBuyer_pwd()); // set 비밀번호
				session.setAttribute("memberIdx", vo.getBuyer_idx()); // 회원번호
				session.setAttribute("memberWallet", vo.getBuyer_wallet()); // 보유한 돈
				session.setAttribute("memberType", type); // set회원타입
				session.setAttribute("loginTime", date.format(today) + time.format(today));
			}
		}
		
		String resultStr = String.format
				( "[ {'msg' : '%s'}, {'type' : '%s'}, {'id' : '%s'} ]",
						msg, type, session.getAttribute("memberId") );
		response.setContentType("text/plain; charset=utf-8");
		response.getWriter().println( resultStr );
	}

}
