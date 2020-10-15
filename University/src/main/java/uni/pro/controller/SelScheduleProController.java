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

import com.google.gson.Gson;

import uni.main.model.Login_All_Dto;
import uni.pro.model.SelScheduleProDto;
import uni.pro.service.SelScheduleProService;

@Controller
public class SelScheduleProController {
	@Autowired
	SelScheduleProService sss;

	@RequestMapping("selScheduleMainPro.do")
	public String SelSchedule() throws Exception {
		return "prograde";
	}
	
	@RequestMapping(value = "subname.do", method = RequestMethod.POST)
	public void builNamelist(HttpSession session,HttpServletResponse resp) throws Exception {
		int prof_cd = ((Login_All_Dto) session.getAttribute("login")).getProf_cd();
		List<SelScheduleProDto> list = sss.builName(prof_cd);
		Gson json = new Gson(); 
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	}

	@RequestMapping(value = "stuname.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String subroomNameList(int sub_cd) throws Exception {
		List<SelScheduleProDto> list = sss.subroomName(sub_cd);
		Gson json = new Gson(); 		
		return json.toJson(list);
	}
	
	public void setSss(SelScheduleProService sss) {
		this.sss = sss;
	}
}