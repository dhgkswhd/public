package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.BuyerVO;
import vo.QnABoardVO;
import vo.SellerVO;
import vo.LeavingVO;
import vo.ProductVO;

public class MasterDAO {
	private static MasterDAO single = null;
	SqlSessionFactory factory = null;
	
	public static MasterDAO getInstance() {
		if(single == null)
			single = new MasterDAO();
		return single;
	}
	
	public MasterDAO() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	/**=====================general_member select================*/
	public List<SellerVO> general_select(HashMap<String, String> map) {
		List<SellerVO> list = null;
		SqlSession sqlSession = factory.openSession();

		list = sqlSession.selectList( "master.general_select", map);
		
		sqlSession.close();
		
		return list;
	}
	/**=====================business_member select================*/	
	public List<BuyerVO> business_select(HashMap<String, String> map) {
		List<BuyerVO> list = null;
		SqlSession sqlSession = factory.openSession();

		list = sqlSession.selectList( "master.business_select", map);
		
		sqlSession.close();
		
		return list;
	}
	
	
	/**=====================phone_list select================*/
	public List<ProductVO> phone_select(HashMap<String, String> map) {
		List<ProductVO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList( "master.phone_select", map);	
		sqlSession.close();	
		return list;
	}

	
	/**=====================board_select================*/
	public List<QnABoardVO> board_list_select(HashMap<String, String> map) {
		List<QnABoardVO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList( "master.board_list_select", map);	
		sqlSession.close();	
		return list;
	}
	
	/**=====================leaving_select================*/
	public List<LeavingVO> leaving_select(HashMap<String, String> map) {
		List<LeavingVO> list = null;
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList( "master.leaving_select", map);	
		sqlSession.close();	
		return list;
	}

	
	
	/**=====================general_member delete================*/
	public void delete_general_member(int g_idx) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.delete("master.delete_general_member", g_idx);
		sqlSession.commit();
		sqlSession.close();
		
	}
	/**=====================general_member delete================*/
	public void delete_business_member(int b_idx) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.delete("master.delete_business_member", b_idx);
		sqlSession.commit();
		sqlSession.close();
		
		
	}
	
	/**=====================delete_phone================*/
	public void delete_phone(int p_idx) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.delete("master.delete_phone", p_idx);
		sqlSession.commit();
		sqlSession.close();	
	}
	/**=====================delete_board================*/
	public void delete_board(int fb_idx) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.delete("master.delete_board", fb_idx);
		sqlSession.commit();
		sqlSession.close();	
	}
	
	/**===========================페이징 count 찾는 쿼리들=============================*/
	public int selectCount_p() {
		SqlSession sqlSession = factory.openSession();
		int count = (int)sqlSession.selectOne("master.phone_count");	
		sqlSession.close();
		return count;
	}
	public int selectCount_fb() {
		SqlSession sqlSession = factory.openSession();
		int count = (int)sqlSession.selectOne("master.board_count");	
		sqlSession.close();
		return count;
	}

	public int selectCount_l() {
		SqlSession sqlSession = factory.openSession();
		int count = (int)sqlSession.selectOne("master.leaving_count");	
		sqlSession.close();
		return count;
	}

	public int selectCount_g() {
		SqlSession sqlSession = factory.openSession();
		int count = (int)sqlSession.selectOne("master.general_count");	
		sqlSession.close();
		return count;
	}

	public int selectCount_b() {
		SqlSession sqlSession = factory.openSession();
		int count = (int)sqlSession.selectOne("master.business_count");	
		sqlSession.close();
		return count;
	}

	


	

}
