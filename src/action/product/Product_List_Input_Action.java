package action.product;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.ProductDAO;
import util.Paging;
import vo.ProductVO;

@WebServlet("/product_list_input.do")
public class Product_List_Input_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**---------------------------- 메인화면으로 이동하기 전 action ----------------------------*/
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String company = request.getParameter("company");
		
		// 파라미터 없이 호출되면, 기본카테고리를 '전체'로 지정
		if ( company == null || company.isEmpty() ) {
			company = "all";
		}
		
		// 페이징 코드 추가
		// > 목록을 가져오기 전에 몇 페이지인지, 한 페이지에 보여질 항목의 수, 전체 페이지 목록
		String page = request.getParameter("page"); // ~.korea?page=2
		int currentPage = 1; // 현재 페이지 번호 (파라미터가 없을것도 가정) 없으면 기본 1페이지
		
		if ( page != null && page.equals("") == false ) {
			currentPage = Integer.parseInt( page );
		}
		
		int pageSize = 5; // 한 화면에 보여줄 항목 개수
		int totalSize = ProductDAO.getInstance().selectCount(); // 전체 게시물 개수
		
		// 별도로 만들어둔 Paging 객체를 생성한다.
		Paging paging = new Paging(pageSize, totalSize, currentPage);
		// 생성자에서 3개의 값을 가지고 calc() 메서드를 수행하여 모든 멤버변수의 값이 만들어졌다.
		
		// startNo, endNo 를 가지고 쿼리문을 수행해야하는데, 파라미터가 여러개라 HashMap 사용
		HashMap<String, String> map = new HashMap<>();
		map.put("startNo", paging.getStartNo() + ""); // int를 문자열로 만듬
		map.put("endNo", paging.getEndNo() + "");
		map.put("p_company", company);
		
		// map을 파라미터로 전달받는 메서드로 오버로딩
		List<ProductVO> list = ProductDAO.getInstance().select( map );
		
		// list에는 필요한 개수만큼의 목록이 만들어진다 (10개면 10개, 20개면 20개)
		// jsp에서 페이지의 정보를 알 수 있으니, 페이지관련 태그를 추가할 수 있다.
		request.setAttribute("paging", paging);
		
		// 페이징 처리를 하지 않은 목록 조회 쿼리
		// List<PhoneVO> list = PhoneDAO.getInstance().select( company );
		
		request.setAttribute("list", list);
		
		// 전체 게시물 개수
		request.setAttribute("countAll", totalSize);
		
		RequestDispatcher disp = request.getRequestDispatcher("shop/product_list.jsp");
		disp.forward(request, response);
	}
	

}











