package rose.systems.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import rose.systems.vo.BoardVO;
import rose.systems.vo.Criteria;
import rose.systems.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

		@Autowired
		private SqlSession session;
		private static String namespace = "rose.systems.mapper.BoardMapper";
		
		@Override
		public void insert(BoardVO vo) throws Exception {
			session.insert(namespace + ".insert", vo);
		}

		@Override
		public BoardVO read(Integer bno) throws Exception {
			return session.selectOne(namespace + ".read", bno);
		}

		@Override
		public int update(BoardVO vo) throws Exception {
		    session.update(namespace + ".update", vo);
		    return 1;
		}

		@Override
		public int delete(Integer bno) throws Exception {
		    session.delete(namespace + ".delete", bno);
		    return 1;
		}

		@Override
		public List<BoardVO> getList() throws Exception {
		    return session.selectList(namespace + ".getList");
		}
		
		@Override
		public void updateViewCount(Integer bno) throws Exception {
			session.update(namespace + ".updateViewCount", bno);
		}

		// 페이징
		@Override
		public List<BoardVO> listPage(int page) throws Exception {
			if (page <= 0) {
			    page = 1;
			}
			page = (page - 1) * 10;
		    return session.selectList(namespace + ".listPage", page);
		}

		@Override
		public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		    return session.selectList(namespace + ".listCriteria", cri);
		}

		@Override
		public int countBno(Criteria cri) throws Exception {
		    return session.selectOne(namespace + ".countBno", cri);
		}

		
		@Override
		public List<BoardVO> search(SearchCriteria cri) throws Exception {
			return session.selectList(namespace + ".search", cri);
		}

		@Override
		public int searchCount(SearchCriteria cri) throws Exception {
			return session.selectOne(namespace + ".searchCount", cri);
		}

}
