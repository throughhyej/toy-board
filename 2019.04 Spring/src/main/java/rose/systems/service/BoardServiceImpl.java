package rose.systems.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import rose.systems.dao.BoardDAO;
import rose.systems.mapper.BoardAttachMapper;
import rose.systems.vo.BoardAttachVO;
import rose.systems.vo.BoardVO;
import rose.systems.vo.Criteria;
import rose.systems.vo.SearchCriteria;

@Service("service")
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO dao;
	
	@Setter(onMethod_ = @Autowired)
	private BoardAttachMapper attachMapper;

	
	@Override
	public void register(BoardVO boardVO) throws Exception {
		dao.insert(boardVO);
		if (boardVO.getAttachList() == null || boardVO.getAttachList().size() <= 0) {
			return;
		}
		boardVO.getAttachList().forEach(attach -> {
			attach.setBno(boardVO.getBno());
			attachMapper.insert(attach);
		});
	}

	@Override
	public BoardVO get(int bno) throws Exception {
		dao.updateViewCount(bno);
		return dao.read(bno);
	}
	

	@Override
	public List<BoardVO> getList() throws Exception { 
		  return dao.getList(); 
	  }
	 

	@Override
	public boolean modify(BoardVO boardVO) throws Exception {
		attachMapper.deleteAll(boardVO.getBno());
		boolean modifyResult = dao.update(boardVO) == 1;
		
		if (modifyResult && boardVO.getAttachList() != null && boardVO.getAttachList().size() > 0) {
			boardVO.getAttachList().forEach(attach -> {
				attach.setBno(boardVO.getBno());
				attachMapper.insert(attach);
			});
		}
		
		return modifyResult;
	}

	@Override
	public boolean remove(int bno) throws Exception {
		attachMapper.deleteAll(bno);
		return dao.delete(bno) == 1;
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}

	@Override
	public int countBno(Criteria cri) throws Exception {
		return dao.countBno(cri);
	}

	
	@Override
	public List<BoardVO> search(SearchCriteria cri) throws Exception {
		return dao.search(cri);
	}

	@Override
	public int searchCount(SearchCriteria cri) throws Exception {
		return dao.searchCount(cri);
	}
	
	@Override
	public List<BoardAttachVO> getAttachList(int bno) {
		return attachMapper.findByBno(bno);
	}
	
}
