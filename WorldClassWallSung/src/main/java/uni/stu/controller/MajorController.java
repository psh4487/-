package uni.stu.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;


import com.google.gson.Gson;

import uni.main.model.Login_All_Dto;
import uni.stu.model.ApplyDto;
import uni.stu.model.MajorDto;
import uni.stu.service.MajorService;

@Controller
public class MajorController implements ApplicationContextAware {
	
	MajorService service;
	private WebApplicationContext context = null;
	
	@Override
    public void setApplicationContext(ApplicationContext arg0)
            throws BeansException { 
        this.context = (WebApplicationContext)arg0;         
    }
	
	@Autowired
	public void setService(MajorService service) {
		this.service = service;
	}
	@RequestMapping("majorMain.do")
	public String list() {
		return "major";
	}
	
	@RequestMapping(value="culture.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String empList(String isu) throws Exception{
		List<Map<String,Object>> list = service.cultureList(isu);		
		Gson json = new Gson();
		return json.toJson(list);
	}
	
	@RequestMapping(value="applyinsert.do")
	public String applyList(@ModelAttribute("ApplyDto")ApplyDto applyDto,Model model,HttpSession session) throws Exception{
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		List<ApplyDto> list = service.selectApply(stu_no);
		int score = service.score(stu_no);		
		model.addAttribute("score", score);
		model.addAttribute("list", list);
		return "major";
	}
	
	@RequestMapping(value = "/major", produces = "text/plain;charset=UTF-8")
	public void deptList(HttpServletResponse resp)throws Exception{		
		MajorDto list = service.selectDept();
		Gson json = new Gson();
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	}
	
	@RequestMapping(value="apply.do")
	public String insert(int sub_cd,HttpSession session,Model model)throws Exception{
		try {
			int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
			service.insert(sub_cd,stu_no);
			service.update(sub_cd,stu_no);
			List<ApplyDto> list = service.selectApply(stu_no);
			int score = service.score(stu_no);		
			model.addAttribute("list", list);
			model.addAttribute("score", score);
			return "major";			
		}catch (Exception e) {
			e.printStackTrace();
		}
			return "stu/major/error";			
		}
	
	@RequestMapping("deleteApply.do")
	public String delete(int sub_cd,HttpSession session,Model model) {		
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		service.delete(sub_cd,stu_no);
		service.update1(sub_cd,stu_no);
		List<ApplyDto> list = service.selectApply(stu_no);
		int score = service.score(stu_no);		
		model.addAttribute("list", list);
		model.addAttribute("score", score);
		return "major";	
	}
	
	@GetMapping(value = "downApply.do")
	public ModelAndView fileDownload(String sub_path) throws Exception{		
		Map<String, Object> down = new HashMap<String, Object>();
		down.put("report_path", sub_path);
		down.put("report_file", sub_path.substring(10,sub_path.length()));	
		return new ModelAndView("fileDownloadUtil", "down", down);
		}
	

}
