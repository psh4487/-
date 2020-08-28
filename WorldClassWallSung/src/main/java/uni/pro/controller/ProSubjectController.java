package uni.pro.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import uni.main.model.Login_All_Dto;
import uni.pro.model.BachelorDto;
import uni.pro.model.Class_cancel_Dto;
import uni.pro.model.Class_cancel_Dto_main;
import uni.pro.model.ProSubjectDto;

import uni.pro.service.ProSubjectService;

@Controller
public class ProSubjectController {

	@Autowired
	ProSubjectService Ss;
	BachelorDto bdto;
	RequestParam RequestParam;
	ProSubjectDto SjDto;

	@RequestMapping("calendar.do")
	public ModelAndView subject(HttpSession session) {
		int prof_cd = ((Login_All_Dto) session.getAttribute("login")).getProf_cd();
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", Ss.sublist(prof_cd));
		mav.setViewName("pro/subject/noclass");
		return mav;
	}

	@RequestMapping(value = "noclass.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String noclass(String sub_nm) {	
		ProSubjectDto list = Ss.noclass(sub_nm);
		Gson json = new Gson();		
		return json.toJson(list);
	}

	@RequestMapping("subjectmaingo.do")
	public ModelAndView submain(HttpSession session) {
		int prof_cd = ((Login_All_Dto) session.getAttribute("login")).getProf_cd();
		ModelAndView mav = new ModelAndView();
		List<ProSubjectDto> list = Ss.submain(prof_cd);
		List<Class_cancel_Dto_main> list1 = Ss.class_cancel_main(prof_cd);
		mav.addObject("sublist", list);
		mav.addObject("sublist1",list1);
		mav.setViewName("subjectmain");
		return mav;
	}
	
	@RequestMapping("insert.do")
	public String class_cancel(Class_cancel_Dto Dto) {
		Ss.class_cancel(Dto);
		return "redirect:subjectmaingo.do";
	}
	
	public void setBs(ProSubjectService Ss) {
		this.Ss = Ss;
	}
}
