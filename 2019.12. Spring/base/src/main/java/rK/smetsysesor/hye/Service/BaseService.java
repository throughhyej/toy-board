package rK.smetsysesor.hye.Service;

import java.util.ArrayList;

import rK.smetsysesor.hye.VO.BaseBoardVO;
import rK.smetsysesor.hye.VO.PagingBase;

public interface BaseService {
	public ArrayList<BaseBoardVO> getList();
	public void write(BaseBoardVO baseBoardVO);
	public BaseBoardVO view(int idx);
	public void delete(int idx);
	public boolean update(BaseBoardVO baseBoardVO);
	
	public ArrayList<BaseBoardVO> listPage(int page);
	public ArrayList<BaseBoardVO> listCriteria(PagingBase pagingBase);
	public int countIdx(PagingBase pagingBase);
}
