package uni.pro.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import uni.main.model.Login_All_Dto;
import uni.pro.model.BachelorDto;
import uni.pro.model.ProSubjectDto;

import uni.pro.service.LecturService;


@Controller
public class LecturController {
	
	@Autowired
	LecturService ls;
	BachelorDto bdto;
	ProSubjectDto SjDto;
	
	@RequestMapping("codenum.do")
	public ModelAndView code() {	
		ModelAndView mav = new ModelAndView();
		 mav.addObject("sub_cd",ls.code());
		 mav.setViewName("pro/lecture/lecture");
		 return mav;
	}


	@RequestMapping("main.do")
	public ModelAndView submain(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int prof_cd = ((Login_All_Dto)session.getAttribute("login")).getProf_cd();
		List<ProSubjectDto> list = ls.select(prof_cd);
		mav.addObject("sublist", list);
		mav.setViewName("lecturemain");
		return mav;
	}
	
	@RequestMapping("lectureroom.do")
	public String lectureroom(Model model) {
		List<ProSubjectDto> list = ls.lectureroom();
		model.addAttribute("roomlist",list);
		return "pro/lecture/lectureroom";
	}
	
	  @RequestMapping(value="subjecttb.do",method = RequestMethod.POST)
	   public String subjecttb(@RequestParam String check,ProSubjectDto subdto,MultipartFile upFile){
	      String report_path = "d:/upload/";
	      String name = subdto.getSub_nm()+"_"+"∞≠¿« ∞Ë»πº≠";
	      int i = upFile.getOriginalFilename().lastIndexOf(".");
	      String filename = name+"."+upFile.getOriginalFilename().substring(i+1);
	      String[] array = check.split(",");
	       subdto.setLec_1(Integer.parseInt(array[0]));
	       subdto.setLec_2(Integer.parseInt(array[1]));
	       subdto.setLec_3(Integer.parseInt(array[2]));   
	       subdto.setSub_path(report_path+filename);	    
	      File f = new File(report_path+filename);
	      try {
	         upFile.transferTo(f);         
	      } catch(IllegalStateException e) {
	         e.printStackTrace();
	      } catch(IOException e) {
	         e.printStackTrace();
	      } 
	       ls.subjecttbsave(subdto);
	      return "redirect:main.do";
	   }

	   @RequestMapping(value = "appLineAddForm_select_one.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	   public void deptList(HttpServletResponse resp) {
	      List<ProSubjectDto> list = ls.appDomt_domt_employee_add_listselect();
	      Gson json = new Gson(); 
	      resp.setContentType("text/html;charset=utf-8");
	      PrintWriter out;
	      try {
	         out = resp.getWriter();
	         out.print(json.toJson(list));	                 
	      } catch (IOException e) { 
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } 
	   }
	      
	   @RequestMapping(value = "appLineAddForm_select_two.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	   public @ResponseBody String nameList(String Subroom_nm){
	      List<Map<String,Object>> list = ls.appDomt_domt_employee_add_listselect_two(Subroom_nm);
	      Gson json = new Gson();  
	      return json.toJson(list);
	   }

}



