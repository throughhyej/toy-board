package kr.rosesystems.roseMSA.Dao;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import kr.rosesystems.roseMSA.VO.RoseMsaVO;

@Repository
public class RoseMsaDaoImpl implements RoseMsaDao {

	private JdbcTemplate jdbctmp;

	@Autowired
	public RoseMsaDaoImpl(JdbcTemplate jdbctmp) {
		this.jdbctmp = jdbctmp;
	}
	
	@Override
	public List<Map<String, Object>> getList() {
		String sql = "SELECT bno, title, content, date_format(regDate, '%Y-%m-%d') as regDate, writer "
				   + "FROM BOARD";
		return jdbctmp.queryForList(sql);
	}

	@Override
	public Map<String, Object> getOne(int bno) {
		String sql = "SELECT bno, title, content, regDate, writer "
				   + "FROM BOARD "
				   + "WHERE bno = " + bno;
		return jdbctmp.queryForMap(sql);
	}

	@Override
	public int getLastBno() throws SQLException {
		String sql = "SELECT MAX(bno) as bno "
				   + "FROM BOARD";
		return jdbctmp.queryForObject(sql, int.class);
	}
	
	@Override
	public void writeBoard(RoseMsaVO VO) {
		Date date = VO.getRegDate();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String sql = "INSERT INTO BOARD "
				   + "VALUES ('" + VO.getBno() + "','" + VO.getTitle()+ "','" + VO.getContent()
				   + "','" + String.valueOf(sdf.format(date)) + "','" + VO.getWriter() + "')";
		jdbctmp.update(sql);
	}

	@Override
	public void updateBoard(RoseMsaVO VO) throws SQLException {
		String sql = "UPDATE BOARD "
				   + "set title = '" + VO.getTitle() + "', "
				   + "content = '" + VO.getContent() + "', "
				   + "writer = '" + VO.getWriter()
				   + "' WHERE bno = " + VO.getBno();
		jdbctmp.update(sql);
		// return jdbctmp.queryForMap(sql, RoseMsaVO.class);
	}

	@Override
	public void deleteBoard(int bno) throws SQLException {
		String sql = "DELETE FROM BOARD "
				   + "WHERE bno = " + bno;
		jdbctmp.update(sql);
	}	
	
}
