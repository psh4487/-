package uni.pro.controller;

import java.io.PrintWriter;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import uni.pro.model.CounselingProDto;
import uni.pro.service.CounselingProService;
import uni.main.model.Login_All_Dto;

@Controller
public class CounselingProController {
	
	@Autowired
	CounselingProService service;

	public void setService(CounselingProService service) {
		this.service = service;
	}

	@RequestMapping(value = "couInfo.do")
	public String sub() throws Exception {
		return "couInfo";
	}

	@RequestMapping(value = "sub.do", method = RequestMethod.POST)
	@ResponseBody
	public void subList(HttpServletResponse resp,HttpSession session) throws Exception {
		int prof_cd = ((Login_All_Dto) session.getAttribute("login")).getProf_cd();
		List<CounselingProDto> list = service.sublist(prof_cd);
		Gson json = new Gson();
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	}

	@RequestMapping(value = "couList.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String coulist(String sub_cd) throws Exception {
		List<CounselingProDto> list = service.conuall(sub_cd);
		Gson json = new Gson();
		return json.toJson(list);
	}

	@RequestMapping(value ="stucouform.do", produces ="text/plain;charset=UTF-8")
	@ResponseBody
	public ModelAndView stucou(int cs_no) {
	     ModelAndView mav = new ModelAndView();
	     mav.setViewName("pro/counseling/stucouform");
	     mav.addObject("list",service.viewstucou(cs_no)); 
	     return  mav;
	}
	
	@RequestMapping(value ="cs_stateok.do") 
	public String updatestateok(int  cs_no) { 
		service.stateok(cs_no);
		return "redirect:couInfo.do";
	}
	   
	@RequestMapping(value ="cs_statenot.do") 
	public String updatestatenot(int  cs_no) { 
		service.statenot(cs_no);
		return "redirect:couInfo.do";
	}
	   
	@RequestMapping(value ="deletecou.do") 
	public String deletecou(int  cs_no) { 
		service.delete(cs_no);
		return "redirect:couInfo.do";
	}

	   
}
