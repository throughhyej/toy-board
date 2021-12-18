package kr.rosesystems.roseMSA.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.rosesystems.roseMSA.VO.RoseMsaVO;

public interface RoseMsaService {
	public int getLastBno() throws SQLException;
	public List<Map<String, Object>> getAllBoards() throws SQLException ;
	public Map<String, Object> getOneBoard(int bno) throws SQLException ;
	public void writeBoard(RoseMsaVO VO) throws SQLException;
	public void updateboard(RoseMsaVO VO) throws SQLException;
	public void deleteBoard(int bno) throws SQLException;
}
