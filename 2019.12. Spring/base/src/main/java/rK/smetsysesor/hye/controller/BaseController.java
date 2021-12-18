package rK.smetsysesor.hye.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import rK.smetsysesor.hye.Service.BaseService;
import rK.smetsysesor.hye.VO.BaseBoardVO;
import rK.smetsysesor.hye.VO.PagingBase;
import rK.smetsysesor.hye.VO.PagingCalc;

@Controller
public class BaseController {
	
	@Autowired
	private BaseService baseService;	
	
	  // �� ���
	  /* @RequestMapping(value="/", method= RequestMethod.GET) 
	   * public String getList(Model model) { 
	  	* model.addAttribute("boardList", baseService.getList());
	  	* return "list"; 
	  }*/
	
	// �� ��� + �Խñ� 10�� ó��
	// public ArrayList<BaseBoardVO> listCriteria(BaseBoardVO baseBoardVO);
	@RequestMapping(value="/listCriteria", method= RequestMethod.GET) 
	public String list(PagingBase pagingBase, Model model) {
		model.addAttribute("boardList", baseService.listCriteria(pagingBase));
		return "list";
	}
	
	// �� ��� + ����¡ ó��
	// public ArrayList<BaseBoardVO> listPage(int page);
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String listPaging(PagingBase pagingBase, Model model) {
		model.addAttribute("boardList", baseService.listCriteria(pagingBase)); // �Խñ� 10�� ó��
		PagingCalc pagingCalc = new PagingCalc();
		pagingCalc.setPagingBase(pagingBase);
		
		int totalCount = baseService.countIdx(pagingBase);
		pagingCalc.setTotalCount(totalCount);
		
		model.addAttribute("pagingCalc", pagingCalc);
		return "list";
	}
	
	// �� �ۼ�
	@RequestMapping(value="/write", method= RequestMethod.GET)
	public void write() {}
	
	// �� �ۼ� ��
	@RequestMapping(value="/write", method= RequestMethod.POST)
	public String write(BaseBoardVO baseBoardVO, RedirectAttributes rttr) {
		baseService.write(baseBoardVO);
		// rttr.addFlashAttribute("result", baseBoardVO.getBoardInx());
		return "redirect:/";
	}
	
	@RequestMapping(value= {"/view", "/update"}, method=RequestMethod.GET)
	// public void view(@RequestParam("idx") int idx, Model model) {
	public void view(@RequestParam("idx") int idx, @ModelAttribute("pagingBase") PagingBase pagingBase, Model model) {
		// BaseBoardVO print = baseService.read(idx);
		// System.out.println(print.getContent());
		model.addAttribute("board1", baseService.view(idx));
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(@RequestParam("idx") int idx, RedirectAttributes rttr) {
		baseService.delete(idx);
		return "redirect:/";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(BaseBoardVO baseBoardVO) {
		baseService.update(baseBoardVO);
		return "redirect:/";
	}
}
