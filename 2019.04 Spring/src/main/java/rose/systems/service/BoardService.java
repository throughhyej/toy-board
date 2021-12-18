package rose.systems.service;

import java.util.List;

import rose.systems.vo.BoardAttachVO;
import rose.systems.vo.BoardVO;
import rose.systems.vo.Criteria;
import rose.systems.vo.SearchCriteria;

public interface BoardService {
	
	public void register(BoardVO boardVO) throws Exception;
	public BoardVO get(int bno) throws Exception;
	public boolean modify(BoardVO boardVO) throws Exception;
	public boolean remove(int bno) throws Exception;
	public List<BoardVO> getList() throws Exception;
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	public int countBno(Criteria cri) throws Exception;
	public List<BoardVO> search(SearchCriteria cri) throws Exception;
	public int searchCount(SearchCriteria cri) throws Exception;
	
	public List<BoardAttachVO> getAttachList(int bno);
}