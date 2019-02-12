package action.product;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ProductDAO;
import vo.ProductVO;

@WebServlet("/product_regist_output.do")
public class Product_Regist_Output_Action extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String path = request.getServletContext().getRealPath("/productimages/");
		// System.out.println( "파일이 업로드 될 경로 : " + path );
		
		int max_size = 1024 * 1024 * 100;
		
		MultipartRequest mr =
				new MultipartRequest( request, // request 객체
									     path, // 저장될 경로
								     max_size, // 파일 최대 사이즈
								      "utf-8", // 인코딩 방식
			  new DefaultFileRenamePolicy() ); // 파일명 어떻게할것인지 정책
								     
		String p_image_s = "no_file";
		String p_image_1 = "no_file";
		String p_image_2 = "no_file";
		String p_image_3 = "no_file";
		String p_image_4 = "no_file";
		
		File f = mr.getFile("p_image_s");
		if ( f != null )
			p_image_s = f.getName();
		
		f = mr.getFile("p_image_1");
		if ( f != null )
			p_image_1 = f.getName();
		
		f = mr.getFile("p_image_2");
		if ( f != null )
			p_image_2 = f.getName();
		
		f = mr.getFile("p_image_3");
		if ( f != null )
			p_image_3 = f.getName();
		
		f = mr.getFile("p_image_4");
		if ( f != null )
			p_image_4 = f.getName();
		
		
		// 파일 외의 파라미터
		String p_register = (String)session.getAttribute("memberId");		// 회원아이디
		String 	p_company = mr.getParameter("p_company");					// 제조회사
		String 	   p_name = mr.getParameter("p_name");						// 모델명
		int 	 p_price  = Integer.parseInt(mr.getParameter("p_price"));   // 희망매입가
		String     p_text = mr.getParameter("p_text");						// 내용
		
		// VO에 저장
		ProductVO vo = new ProductVO();
		vo.setP_register(p_register);
		vo.setP_company (p_company);
		vo.setP_name (p_name);
		vo.setP_price (p_price);
		vo.setP_text (p_text);
		vo.setP_image_s (p_image_s);
		vo.setP_image_1 (p_image_1);
		vo.setP_image_2 (p_image_2);
		vo.setP_image_3 (p_image_3);
		vo.setP_image_4 (p_image_4);
		vo.setP_status("대기"); // 처음에 등록할 때 '대기' 상태로 등록함
		
		// DB에 insert
		ProductDAO.getInstance().insertProduct( vo );
		
		// 추가한 제품의 카테고리 리스트로 페이지 리다이렉트 (추가된것 목록에서 바로 확인 가능)
		response.sendRedirect("product_list_input.do");

	}

}
