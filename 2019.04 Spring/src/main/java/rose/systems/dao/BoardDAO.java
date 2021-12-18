package rose.systems.dao;

import java.util.List;

import rose.systems.vo.BoardVO;
import rose.systems.vo.Criteria;
import rose.systems.vo.SearchCriteria;


public interface BoardDAO {
	public void insert(BoardVO vo) throws Exception;
	public BoardVO read(Integer bno) throws Exception;
	public int update(BoardVO vo) throws Exception;
	public int delete(Integer bno) throws Exception;
	public List<BoardVO> getList() throws Exception;
	public List<BoardVO> listPage(int page) throws Exception;
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	public int countBno(Criteria cri) throws Exception;
	public void updateViewCount(Integer bno) throws Exception;
	public List<BoardVO> search(SearchCriteria cri) throws Exception; 
	public int searchCount(SearchCriteria cri) throws Exception;
	
}
