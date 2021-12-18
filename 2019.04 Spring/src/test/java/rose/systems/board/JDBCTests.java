package rose.systems.board;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

	static {
		try {
			Class.forName("com.mysql.jdbc.jdbc2.optional.MysqlDataSource");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testConnection() {

		try (Connection con = DriverManager.getConnection("jdbc:mysql://www.rosesystems.kr:13306", "root",
				"fhwm3400!")) {

			log.info(con);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}

}