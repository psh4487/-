package uni.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import uni.board.model.PageMaker;
import uni.board.model.QnaDto;
import uni.board.model.QnaReplyDto;
import uni.board.model.SearchCriteria;
import uni.board.service.QnaReplyService;
import uni.board.service.QnaService;
import uni.main.model.Login_All_Dto;

@Controller
public class QnaController {
	QnaService service;
	QnaReplyService reservice;
	@Autowired
	public void setReservice(QnaReplyService reservice) {
		this.reservice = reservice;
	}
	@Autowired
	public void setService(QnaService service) {
		this.service = service;
	}
	//글 리스트 출력, 페이징, 검색
	@RequestMapping("qnaMain.do")
	public String form(@ModelAttribute("qnaDto")QnaDto qnaDto, Model model, @ModelAttribute("scri")SearchCriteria scri,HttpSession session) {
		List<QnaDto> list = service.list(scri);
		model.addAttribute("list", list);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		model.addAttribute("pageMaker", pageMaker);
		int mem = ((Login_All_Dto)session.getAttribute("login")).getMem_no();
	  	if(mem == 2) {
	  		return "qnaBoard2"; 
	  	}else if(mem==3) {
	  		return "qnaBoard3";
	  	}else if(mem==4) {
	  		return "qnaBoard4";
	  	}
		return "qnaBoard1";
	}
	//글 작성 폼
	@RequestMapping("writeQnaForm.do")
	public String writeForm(Model model,@ModelAttribute("scri")SearchCriteria scri,HttpSession session) {
		List<QnaDto> list = service.list(scri);
		model.addAttribute("list", list);
	 	
		int mem = ((Login_All_Dto)session.getAttribute("login")).getMem_no();
	  	if(mem == 2) {
	  	  	return "qnaBoardwriteForm2"; 
	  	}
		return "qnaBoardwriteForm1";
	}
	//글 작성
	@RequestMapping("writeQnaPro.do")
	public String writePro(QnaDto dto) {
		service.insert(dto);
		return "redirect:qnaMain.do";
	}
	//글 조회, 댓글  삭제, 출력
	@RequestMapping("selectQnaForm.do")
	public String selectTitle(@RequestParam("no")int no, Model model,HttpSession session) {
		QnaDto dto = service.selectTitle(no);
		model.addAttribute("no", dto);
		service.addHit(no);
		List<QnaReplyDto> replyList = reservice.reList(no);
		int mem = ((Login_All_Dto)session.getAttribute("login")).getMem_no();
		model.addAttribute("replyList",replyList);
		if(mem == 2) {
			return "selectQnaForm2";
		}
		if(mem==3) {
			return "selectQnaForm3";	
		}else if(mem==4) {
			return "selectQnaForm4";
		}
		return "selectQnaForm1";
		
	}
	//댓글 입력
	@RequestMapping("insertReply.do")
	public String insertReply(QnaReplyDto dto, RedirectAttributes redirect) {
		//QnaDto dto = new QnaDto();
		redirect.addAttribute("no", dto.getNo());
		System.out.println(dto.toString());
		reservice.insertReply(dto);
		
		return "redirect:selectQnaForm.do";
	}
	//글 삭제
	@RequestMapping("deleteQna.do")
	public String deleteBoard(@RequestParam("no")int no) {
		service.deleteTitle(no);
		return "redirect:qnaMain.do";
	}
	//글 수정 폼
	@RequestMapping("updateQnaForm.do")
	public String updateTitleForm(@RequestParam("no")int no,Model model,HttpSession session) {
		QnaDto dto = service.selectTitle(no);
		model.addAttribute("no", dto);
		int mem = ((Login_All_Dto)session.getAttribute("login")).getMem_no();
	  	if(mem == 2) {
	  	  	return "qnaBoardupdateForm2"; 
	  	}
		return "qnaBoardupdateForm1";
	}
	//글 수정
	@RequestMapping("updateQnaPro.do")
	public String updateTitlePro(QnaDto dto, RedirectAttributes redirect) {
		redirect.addAttribute("no", dto.getNo());
		service.updateTitle(dto);
		return "redirect:selectQnaForm.do";
	}
	//댓글 삭제
	@RequestMapping("deleteReply.do")
	public String deleteReplyPro(@RequestParam("rno")int rno,RedirectAttributes redirect, QnaDto dto) {
		reservice.deleteReply(rno);
		System.out.println(rno);
		System.out.println(dto.getNo());
		redirect.addAttribute("no",dto.getNo());
		return "redirect:selectQnaForm.do";
	}
}
