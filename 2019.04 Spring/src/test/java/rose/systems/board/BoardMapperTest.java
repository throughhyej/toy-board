package rose.systems.board;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTest {

	/*
	 * @Setter(onMethod_ = @Autowired) private BoardMapper mapper;
	 * 
	 * @Test
	 * 
	 * @Ignore public void testGetList() { mapper.getList().forEach(board ->
	 * log.info(board)); }
	 * 
	 * @Test
	 * 
	 * @Ignore public void testInsert() { BoardVO boardVO = new BoardVO();
	 * boardVO.setTitle("공지사항 4"); boardVO.
	 * setContent("◈ 혁신도시 가족간 온라인 커뮤니티 구축을 위해 다음과 같이 혁신도시 소식지 10.9월호〔제39호〕를 발간하였습니다"
	 * ); boardVO.setWriter("관리자");
	 * 
	 * mapper.insert(boardVO); }
	 * 
	 * 
	 * @Test @Ignore public void testInsertSelectKey() { BoardVO boardVO = new
	 * BoardVO(); boardVO.setTitle("공지사항5"); boardVO.
	 * setContent("◈ 혁신도시 가족간 온라인 커뮤니티 구축을 위해 다음과 같이 혁신도시 소식지 10.9월호〔제39호〕를 발간하였습니다"
	 * ); boardVO.setWriter("관리자"); mapper.insertSelectKey(boardVO); }
	 * 
	 * 
	 * @Test
	 * 
	 * @Ignore public void testRead() { BoardVO boardVO = mapper.read(3); }
	 * 
	 * @Test
	 * 
	 * @Ignore public void testDelete() { log.info("DELETE COUNT : " +
	 * mapper.delete(4)); }
	 * 
	 * @Test
	 * 
	 * @Ignore public void testUpdate() { BoardVO boardVO = new BoardVO();
	 * boardVO.setBno(3); boardVO.setTitle("공지사항3"); boardVO.
	 * setContent("◈ 혁신도시 가족간 온라인 커뮤니티 구축을 위해 다음과 같이 혁신도시 소식지 \r\n 10.9월호〔제39호〕를 발간하였습니다"
	 * ); boardVO.setWriter("관리자");
	 * 
	 * int count = mapper.update(boardVO); log.info("UPDATE COUNT:" + count); }
	 */
}
