package rose.systems.mapper;

import java.util.List;

import rose.systems.vo.BoardAttachVO;;

public interface BoardAttachMapper {
	public void insert(BoardAttachVO vo);
	public boolean delete(String uuid);
	public List<BoardAttachVO> findByBno(int bno);
	public void deleteAll(int bno);
	public List<BoardAttachVO> getOldFiles();
}