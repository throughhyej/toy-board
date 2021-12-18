package rK.smetsysesor.hye.Service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import rK.smetsysesor.hye.VO.BaseBoardVO;
import rK.smetsysesor.hye.VO.PagingBase;
import rK.smetsysesor.hye.mapper.BaseMapper;

@Service("baseService")
public class BaseServiceImpl implements BaseService {
	
		@Autowired private BaseMapper baseMapper;

		@Override
		 // public ArrayList<BaseBoardVO> getList();
		 public ArrayList<BaseBoardVO> getList() {
		 	return baseMapper.getList();
		 }

	
		@Override
		// public void write(BaseBoardVO baseBoardVO);
		public void write(BaseBoardVO baseBoardVO) {
			baseMapper.write(baseBoardVO);
		}
		
		@Override
		// public BaseBoardVO view(int idx);
		public BaseBoardVO view(int idx) {
			return baseMapper.view(idx);
		}

		@Override
		// public void delete(int idx);
		public void delete(int idx) {
			baseMapper.delete(idx);
		}
		
		@Override
		// public boolean update(BaseBoardVO baseBoardVO);
		public boolean update(BaseBoardVO baseBoardVO) {
			return baseMapper.update(baseBoardVO) == 1;
		}

		@Override
		// public ArrayList<BaseBoardVO> listPage(int page);
		public ArrayList<BaseBoardVO> listPage(int page) {
			return baseMapper.listPage(page);
		}

		@Override
		// public ArrayList<BaseBoardVO> listCriteria(BaseBoardVO baseBoardVO);
		public ArrayList<BaseBoardVO> listCriteria(PagingBase pagingBase) {
			return baseMapper.listCriteria(pagingBase);
		}

		@Override
		// public int countBno(BaseBoardVO baseBoardVO);
		public int countIdx(PagingBase pagingBase) {
			return baseMapper.countIdx(pagingBase);
		}

}
