package uni.board.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import uni.board.model.DeptNm;
import uni.board.model.PageMaker;
import uni.board.model.QnaDto;
import uni.board.model.SearchCriteria;
import uni.board.model.SubjectBoardDto;
import uni.board.service.SubjectBoardService;
import uni.main.model.Login_All_Dto;

@Controller
public class SubjectBoardController {
	SubjectBoardService service;
	@Autowired
	public void setService(SubjectBoardService service) {
		this.service = service;
	}
	@RequestMapping("subjectBoardMain.do")
	public String form(@ModelAttribute("subjectBoardDto")SubjectBoardDto subjectBoardDto,Model model,@ModelAttribute("scri")SearchCriteria scri,HttpSession session) {
		List<SubjectBoardDto> list = service.list(scri);
		model.addAttribute("list", list);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		model.addAttribute("pageMaker",pageMaker);
		int mem = ((Login_All_Dto)session.getAttribute("login")).getMem_no();
	  	if(mem == 2) {
	  		return "subjectBoard2";
	  	}else if(mem==3) {
	  		return "subjectBoard3";
	  	}else if(mem==4) {
	  		return "subjectBoard4";
	  	}		
		return "subjectBoard1";
	}
	//글 작성 폼
	@RequestMapping("writeSubjectBoardForm.do")
	public String writeForm(Model model, @ModelAttribute("scri")SearchCriteria scri,HttpSession session,HttpServletRequest request) {
		int mem = ((Login_All_Dto)session.getAttribute("login")).getMem_no();
		List<SubjectBoardDto> list = service.list(scri);
		model.addAttribute("list",list);
		List<DeptNm> list1 = service.deptnm();
		if(mem == 2) {
		int prof_cd = Integer.parseInt(request.getParameter("prof_cd")); 
		
		System.out.println(service.dept_nm(prof_cd));
		String i = service.dept_nm(prof_cd);
		model.addAttribute("prof_dept_nm", i);
		}
		model.addAttribute("dept_nm",list1);
		
		if(mem == 2) {
			return "subjectBoardwriteForm2";
		}else if(mem==3) {
			return "subjectBoardwriteForm3";
		}
		return "subjectBoardwriteForm4";
	}
	//글 작성
	@RequestMapping("writeSubjectBoardPro.do")
	public String writePro(SubjectBoardDto dto, Model model) {
		service.insert(dto);
		return "redirect:subjectBoardMain.do";
	}
	//글 조회
	@RequestMapping("selectSubjectBoardForm.do")
	public String selectTitle(@RequestParam("no")int no, Model model,HttpSession session) {
		SubjectBoardDto dto = service.selectTitle(no);
		model.addAttribute("no",dto);
		service.addHit(no);
		int mem = ((Login_All_Dto)session.getAttribute("login")).getMem_no();
		if(mem == 1) {
			return "selectSubjectForm1";
		}
		else if(mem == 2) {
			return "selectSubjectForm2";
		}
		else if(mem ==3) {
			return "selectSubjectForm3";
		}
		return "selectSubjectForm4";
			
		
	}
	//글 삭제
	@RequestMapping("deleteSubjectBoard.do")
	public String deleteBoard(@RequestParam("no")int no) {
		service.deleteTitle(no);
		return "redirect:subjectBoardMain.do";
	}
	//글 수정 폼
	@RequestMapping("updateSubjectboardForm.do")
	public String updateTitleForm(@RequestParam("no")int no, Model model,HttpSession session) {
		SubjectBoardDto dto = service.selectTitle(no);
		model.addAttribute("no", dto);
		int mem = ((Login_All_Dto)session.getAttribute("login")).getMem_no();
		if(mem==2) {
			return "subjectBoardupdateForm2";
		}else if(mem==3) {
			return "subjectBoardupdateForm3";
		}
		return "subjectBoardupdateForm4";
	}
	//글 수정
	@RequestMapping("updateSubjectBoardPro.do")
	public String updateTitlePro(SubjectBoardDto dto,RedirectAttributes redirect) {
		redirect.addAttribute("no", dto.getNo());
		service.updateTitle(dto);
		return "redirect:/selectSubjectBoardForm.do";
	}
	
}
