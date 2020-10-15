package uni.stu.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import uni.main.model.Login_All_Dto;
import uni.stu.model.SubjectDto;
import uni.stu.service.SubjectService;

@Controller
public class SubjectController {
	SubjectService service;
	
	@Autowired
	public void setService(SubjectService service) {
		this.service = service;
	}
	
	@RequestMapping("subjectmain.do")
	public String form(@ModelAttribute("subjectDto")SubjectDto subjectDto, Model model,HttpSession session)throws Exception{
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		List<SubjectDto> list = service.subjectList(stu_no);
		int count = service.count(stu_no);
		int count1 = service.count1(stu_no);
		int count2 = service.count2(stu_no);
		model.addAttribute("list", list);
		model.addAttribute("count", count);
		model.addAttribute("count1", count1);
		model.addAttribute("count2", count2);
		return "subject";
	}

	@RequestMapping("scoreMain.do")
	public String score() throws Exception {
		return "scoreMain";
	}
	
	@RequestMapping(value = "sj_years.do", method = RequestMethod.POST)
	public void yearsList(HttpServletResponse resp) throws Exception {
		List<SubjectDto> list = service.yearScore();
		Gson json = new Gson(); 
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	}
	
	@RequestMapping(value = "sj_sem.do", method = RequestMethod.POST)
	public void semList(HttpServletResponse resp) throws Exception {
		List<SubjectDto> list = service.semScore();
		Gson json = new Gson();
		resp.setContentType("text/html;charset=utf-8"); 
		PrintWriter out = resp.getWriter();		
		out.print(json.toJson(list));
	}
	
	@RequestMapping(value = "sj_listAll.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String scoreList(int stu_no, int years, int sem) throws Exception {
		List<SubjectDto> list = service.listScore(stu_no, years, sem);
		Gson json = new Gson(); 	
		return json.toJson(list);
	}
	
}
