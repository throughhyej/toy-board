package rose.systems.board;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PagingTest {
	
	/*
	 * @Setter(onMethod_ = @Autowired) private BoardMapper mapper;
	 * 
	 * @Test public void test() { Criteria cri = new Criteria();
	 * 
	 * List<BoardVO> list = mapper.getListWithPaging(cri); list.forEach(board ->
	 * log.info(board.getBno())); }
	 */

}
