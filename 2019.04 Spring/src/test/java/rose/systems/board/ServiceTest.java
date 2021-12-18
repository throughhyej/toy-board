package rose.systems.board;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ServiceTest {
	/*
	 * @Setter(onMethod_ = @Autowired) private BoardService service;
	 * 
	 * @Test @Ignore public void test() { assertNotNull(service); }
	 * 
	 * @Test @Ignore public void testRegister() { BoardVO boardVO = new BoardVO();
	 * boardVO.setTitle("공지사항4"); boardVO.setContent("ddd");
	 * boardVO.setWriter("관리자");
	 * 
	 * service.register(boardVO); log.info("생성된 게시물의 번호:" + boardVO.getBno()); }
	 * 
	 * 
	 * 
	 * @Test @Ignore public void testGet() { log.info(service.get(2)); }
	 * 
	 * @Test @Ignore public void testDelete() { log.info("Remove Result :" +
	 * service.remove(8)); }
	 * 
	 * @Test @Ignore public void testUpdate() { BoardVO boardVO = service.get(5);
	 * if(boardVO == null) { return ; } boardVO.setTitle("공지사항5"); boardVO.
	 * setContent("◈ 혁신도시 가족간 온라인 커뮤니티 구축을 위해 다음과 같이 혁신도시 소식지 10.9월호〔제39호〕를 발간하였습니다"
	 * );
	 * 
	 * log.info("Modify Result : " + service.modify(boardVO)); }
	 */
}
