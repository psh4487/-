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

import uni.main.model.Login_All_Dto;
import uni.pro.model.EstimationProDto;
import uni.pro.service.EstimationProService;

@Controller
public class EstimationProController {
	
	@Autowired
	EstimationProService service;

	public void setService(EstimationProService service) {
		this.service = service;
	}

	@RequestMapping(value = "EstimationinfoPro.do")
	public String sub() throws Exception {
		return "EstimationinfoPro";
	}

	@RequestMapping(value = "Estimationsub.do", method = RequestMethod.POST)
	@ResponseBody
	public void subList(HttpServletResponse resp,HttpSession session) throws Exception {
		int prof_cd = ((Login_All_Dto) session.getAttribute("login")).getProf_cd();
		List<EstimationProDto> list = service.sublist(prof_cd);
		Gson json = new Gson();
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	}

	@RequestMapping(value = "estall.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String esttall(String sub_cd) throws Exception {
		List<EstimationProDto> list = service.estall(sub_cd);
		Gson json = new Gson();
		return json.toJson(list);
	}
	
	   @RequestMapping(value ="Estimationform.do", produces ="text/plain;charset=UTF-8")
	   @ResponseBody
	   public ModelAndView viewest(int stu_no,String sub_cd) {
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("pro/estimation/Estimationform");
	      mav.addObject("list",service.viewest(stu_no,sub_cd));    
	      return mav;
	   }
	   @RequestMapping(value ="estok.do") 
		public String updatestateok(int stu_no) { 
			service.esteok(stu_no);
			return "redirect:EstimationinfoPro.do";
			}
	   
	   @RequestMapping(value ="Estimationvalueform.do", produces ="text/plain;charset=UTF-8")
	   @ResponseBody
	   public ModelAndView view(String sub_cd) {
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("pro/estimation/Estimationvalueform");
	      mav.addObject("list",service.view(sub_cd));	     
	      return  mav;
	   }
}
