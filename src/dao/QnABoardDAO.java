package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.QnABoardVO;

public class QnABoardDAO {
private static QnABoardDAO single = null;
	
	public static QnABoardDAO getInstance() {
		if(single == null)
			single = new QnABoardDAO();
		return single;
	}
	
	SqlSessionFactory factory = null;
	
	public QnABoardDAO() {
		factory = MyBatisConnector.getInstance().getSqlSessionFactory();
	}
	
	/**------------------------ 게시물 등록 ------------------------*/
	public void insert_Board( QnABoardVO board ) {
		
		SqlSession sqlSession = factory.openSession();
		sqlSession.insert( "free_board.free_board_insert", board );
		sqlSession.commit();
		sqlSession.close();
		
	}
	
	/**------------------------ 전체 게시물 불러오기 ------------------------*/
	public List<QnABoardVO> select_AllBoard() {
		List<QnABoardVO> list = null;
		
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList( "free_board.free_board_listAll" );
		sqlSession.close();
		
		return list;
	}
	
	/**------------------------ 게시물 검색 ------------------------*/
	 public List<QnABoardVO> select_Search_Board ( Map<String, String> map ) {
		List<QnABoardVO> list = null;
		
		SqlSession sqlSession = factory.openSession();
		list = sqlSession.selectList( "free_board.free_board_list", map );
		sqlSession.close();
		
		return list;
	}
	
	/**------------------------ 게시물 상세보기 + 조회수 증가------------------------*/
	public QnABoardVO select_One ( int fb_idx ) {
		
		QnABoardVO vo = null;
		SqlSession sqlSession = factory.openSession();
		// 게시물 상세
		vo = sqlSession.selectOne( "free_board.free_board_one", fb_idx );
		// 상세보기하면 조회수 증가
		sqlSession.update( "free_board.free_board_viewnum", fb_idx );
		sqlSession.commit();
		sqlSession.close();
		
		return vo;
	}

	/**------------------------ 게시물 삭제 ------------------------*/
	public void delete_Board ( int fb_idx ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.delete("free_board.free_board_delete", fb_idx);
		sqlSession.commit();
		sqlSession.close();
		
	}
	
	/**------------------------ 게시물 수정 ------------------------*/
	public void update_Board ( QnABoardVO vo ) {
		SqlSession sqlSession = factory.openSession();
		sqlSession.update("free_board.free_board_update", vo );
		sqlSession.commit();
		sqlSession.close();
		
	}
	
	/**------------------------ 게시물 갯수 구하기 ------------------------*/
	public int selectCount() {
		SqlSession sqlSession = factory.openSession();
		int count = (int)sqlSession.selectOne("free_board_count");
		sqlSession.close();
		return count;
	}

	// 오버로딩된 select 메서드
	public List<QnABoardVO> select(HashMap<String, String> map) {
		List<QnABoardVO> list = null;
		
		SqlSession sqlSession = factory.openSession();
		
		list = sqlSession.selectList("free_board_list_page", map);
		sqlSession.close();
		
		
		return list;
	}
}

