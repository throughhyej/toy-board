package kr.rosesystems.roseMSA.Dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.rosesystems.roseMSA.VO.RoseMsaVO;

public interface RoseMsaDao {
	 public int getLastBno() throws SQLException;
	 public List<Map<String, Object>> getList() throws SQLException;
	 public Map<String, Object> getOne(int bno) throws SQLException;
	 public void writeBoard(RoseMsaVO VO) throws SQLException;
	 public void updateBoard(RoseMsaVO VO) throws SQLException;
	 public void deleteBoard(int bno) throws SQLException;
}
