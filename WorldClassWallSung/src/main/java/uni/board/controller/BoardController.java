package uni.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import uni.board.service.*;
import uni.main.model.Login_All_Dto;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import uni.board.model.*;


@Controller
public class BoardController {
	BoardService service;
	@Autowired
	public void setService(BoardService service) {
		this.service = service;
	}

	//�� ����Ʈ ���, ����¡, �˻�
	@RequestMapping("boardMain.do") 
	public String form(@ModelAttribute("boardDto")BoardDto boardDto, Model model,@ModelAttribute("scri")SearchCriteria scri,HttpSession session) {
		List<BoardDto> list = service.list(scri); 
	  	model.addAttribute("list", list);
	  	List<BoardDto> listNotice = service.listNotice();
	  	PageMaker pageMaker = new PageMaker();
	  	pageMaker.setCri(scri);
	  	pageMaker.setTotalCount(service.listCount(scri));
	  	model.addAttribute("pageMaker",pageMaker);
	  	int count = service.selectCount();
	  	model.addAttribute("count",count);
	  	model.addAttribute("notice",listNotice);
	  
	  	int mem = ((Login_All_Dto)session.getAttribute("login")).getMem_no();
		if(mem == 2) {
			return "board2";
		}else if(mem == 3) {
			return "board3";			
		}else if(mem == 3) {
			return "board4";			
		}	  	
	  	return "board1"; 	  	
	  }
	
	//�� �ۼ�
	@RequestMapping("writeboardForm.do")
	public String writeForm(Model model,@ModelAttribute("scri")SearchCriteria scri) {
		List<BoardDto> list = service.list(scri);
		model.addAttribute("list", list);
		return "board/board/writeForm";
	}
	//�� �ۼ� ��
	@RequestMapping("writeboardPro.do")
	public String writePro(BoardDto dto) {
		service.insert(dto);
		return "redirect: boardMain.do";
		
	}
	//�� ��ȸ
	@RequestMapping("selectboardForm.do")
	public String selectTitle(@RequestParam("no")int no,Model model) {
		
		BoardDto dto = service.selectTitle(no);
		  model.addAttribute("no", dto);
		  service.addHit(no);
		return "board/board/titleForm";
		
	}
	//�� ���� ��
	@RequestMapping("updateboardForm.do")
	public String updateTitleForm(@RequestParam("no")int no,Model model) {
		
		BoardDto dto = service.selectTitle(no);
		model.addAttribute("no", dto);
		
		return "board/board/updateForm";
	}
	//�� ����
	@RequestMapping("updateboardPro.do")
	public String updateTitlePro(BoardDto dto, RedirectAttributes redirect) {
		
		redirect.addAttribute("no",dto.getNo());
		
		service.updateTitle(dto);
		return "redirect:/selectboardForm.do";
	}
	//�� ����
	@RequestMapping("deleteboard.do")
	public String deleteBoard(@RequestParam("no")int no) {
	
		
		service.deleteTitle(no);
		return "redirect:/boardMain.do";
	}
	

}