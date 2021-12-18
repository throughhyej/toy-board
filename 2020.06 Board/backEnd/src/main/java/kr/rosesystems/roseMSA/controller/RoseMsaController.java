package kr.rosesystems.roseMSA.controller;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.rosesystems.roseMSA.VO.RoseMsaVO;
import kr.rosesystems.roseMSA.service.RoseMsaService;

@CrossOrigin // 사용 시, webpack.config.js proxy 설정 'target'외에 따로 설정 해줄 필요 없음
// @CrossOrigin(origins = {"http://localhost:9000, http://localhost/"}) // 사용 시, webpack.config.js proxy 설정 'changeOrigin: true' 해줘야 함 // 이렇게 배포시 에러남
@RestController
// @RequestMapping("/api") // 설정 파일에 정의해줌
public class RoseMsaController implements ErrorController {
	
	@Autowired
	private RoseMsaService service;
	
	@GetMapping(value= {"/", "/error"})
	public List<Map<String, Object>> getList() throws SQLException {
		List<Map<String, Object>> getList = service.getAllBoards();
		return getList;
	}
	
	@PostMapping(value="/submit")
	public void write(@RequestBody Map<String, String> params) throws SQLException {
		RoseMsaVO VO = new RoseMsaVO();
		VO.setBno(String.valueOf(service.getLastBno()+1));
		VO.setTitle(params.get("title"));
		VO.setContent(params.get("content"));
		VO.setRegdate(new Date());
		VO.setWriter(params.get("writer"));
		service.writeBoard(VO);
		// Map<String, Object> successBoard = service.writeBoard(VO);
		//return successBoard;
	}
	
	@GetMapping(value="/view/{bno}")
	public Map<String, Object> read(@PathVariable int bno) throws SQLException {
		Map<String, Object> board = service.getOneBoard(bno);
		return board;
	}
	
	@PutMapping(value="/edit/{bno}")
	public void update(@PathVariable int bno, @RequestBody Map<String, String> params) throws SQLException {
		RoseMsaVO VO = new RoseMsaVO();
		VO.setBno(String.valueOf(bno));
		VO.setTitle(params.get("title"));
		VO.setContent(params.get("content"));
		VO.setWriter(params.get("writer"));
		service.updateboard(VO);
		// return updatedBoard;
	}
	
	@DeleteMapping(value="/delete/{bno}")
	public void delete(@PathVariable int bno) throws SQLException {
		service.deleteBoard(bno);
	}

	@Override
    public String getErrorPath() {
        return "/error"; // router history mode 사용 시, url 변화로 인한 404 없애기 위해 추가된 fallback
    }
	
}
