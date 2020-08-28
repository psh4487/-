package uni.stu.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import uni.stu.model.GradeMDto;
import uni.stu.service.GradeMService;

@Controller
public class GradeMController {
	@Autowired
	GradeMService gs;
	
	@RequestMapping("gradeManaMain.do")
	public String score() throws Exception {
		return "gradeManaMain";
	}
	
	@RequestMapping(value = "gm_years.do", method = RequestMethod.POST)
	public void yearsList(HttpServletResponse resp)  throws Exception {
		List<GradeMDto> list = gs.yearsList();
		Gson json = new Gson(); 
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	}
	
	@RequestMapping(value = "gm_sem.do", method = RequestMethod.POST)
	public void semList(HttpServletResponse resp)  throws Exception {
		List<GradeMDto> list = gs.semList();
		Gson json = new Gson(); 
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	}
	
	@RequestMapping(value = "gm_listAll.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String scoreList(int stu_no, int gm_years, int gm_sem) throws Exception {
		List<GradeMDto> list = gs.gradeMSel(stu_no, gm_years, gm_sem);
		Gson json = new Gson(); 
		System.out.println(json.toJson(list));
		return json.toJson(list);
	}
	public void setGs(GradeMService gs) {
		this.gs = gs;
	}
}
