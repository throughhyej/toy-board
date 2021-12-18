package rose.systems.board;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import rose.systems.service.BoardService;
import rose.systems.vo.BoardAttachVO;
import rose.systems.vo.BoardVO;
import rose.systems.vo.PageMaker;
import rose.systems.vo.SearchCriteria;

@Controller
public class RoseController {
	
	@Inject
	private BoardService service;

	@GetMapping("/board_write")
	public void register() {}
	
	@PostMapping("/board_write")
	public String register(BoardVO board, RedirectAttributes rttr) throws Exception { // 글쓰기
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/";
	}

	@GetMapping({"/board_view", "/board_modify"})
	public void get(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception { // 글 하나 보기
		model.addAttribute("boardVO", service.get(bno));
	}
	  
	@PostMapping("/board_modify") 
	public String modify(BoardVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
	    service.modify(board);
	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());
	    return "redirect:/";
	  }
	  
	  @RequestMapping(value = "/remove", method = RequestMethod.POST)
	  public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		service.remove(bno);
		deleteFiles(attachList);
	    rttr.addAttribute("page", cri.getPage());
	    rttr.addAttribute("perPageNum", cri.getPerPageNum());
	    rttr.addAttribute("searchType", cri.getSearchType());
	    rttr.addAttribute("keyword", cri.getKeyword());
	    return "redirect:/";
	  }
	  
	  private void deleteFiles(List<BoardAttachVO> attachList) {
		    if(attachList == null || attachList.size() == 0) {
		      return;
		    }
		    attachList.forEach(attach -> {
		      try {        
		        Path file  = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());
		        Files.deleteIfExists(file);
				/*
				 * if(Files.probeContentType(file).startsWith("image")) { Path thumbNail =
				 * Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"
				 * + attach.getFileName()); Files.delete(thumbNail); }
				 */
		      }catch(Exception e) {
		        System.out.println("delete file error" + e.getMessage());
		      }//end catch
		    });//end foreachd
		  }
	  
	  @RequestMapping(value = "/", method = RequestMethod.GET)
	  public String listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
	  	model.addAttribute("list", service.search(cri));
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);
	    pageMaker.setTotalCount(service.searchCount(cri));
	    model.addAttribute("pageMaker", pageMaker);
	    return "/board";
	  }
	  
	  @GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<BoardAttachVO>> getAttachList(int bno) {
			return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
		}
	
}
