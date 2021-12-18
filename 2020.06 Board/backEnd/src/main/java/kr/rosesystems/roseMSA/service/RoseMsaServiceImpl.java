package kr.rosesystems.roseMSA.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.rosesystems.roseMSA.Dao.RoseMsaDao;
import kr.rosesystems.roseMSA.VO.RoseMsaVO;

@Service
public class RoseMsaServiceImpl implements RoseMsaService {

	@Autowired
	private RoseMsaDao roseMsaDao;
	
	@Override
	public int getLastBno() throws SQLException {
		int addBno = 0;
		try {
			addBno = roseMsaDao.getLastBno();
		}catch (NullPointerException e) {
			addBno = 0;
		}
		return addBno;
	}
	
	@Override
	public List<Map<String, Object>> getAllBoards() throws SQLException {
		List<Map<String, Object>> boardList = roseMsaDao.getList() ;
		return boardList;
	}

	@Override
	public Map<String, Object> getOneBoard(int b_no) throws SQLException {
		Map<String, Object> boardOne = roseMsaDao.getOne(b_no);
		return boardOne;
	}

	@Override
	public void writeBoard(RoseMsaVO VO) throws SQLException {
		roseMsaDao.writeBoard(VO);
		// return regedBoard;
	}

	@Override
	public void updateboard(RoseMsaVO VO) throws SQLException {
		roseMsaDao.updateBoard(VO);
		// return updatedBoard;
	}

	@Override
	public void deleteBoard(int bno) throws SQLException {
		roseMsaDao.deleteBoard(bno);
		
	}

}
