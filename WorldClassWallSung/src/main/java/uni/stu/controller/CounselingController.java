package uni.stu.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

import uni.main.model.Login_All_Dto;
import uni.stu.model.CounselingDto;
import uni.stu.service.CounselingService;

@Controller
public class CounselingController {
	@Autowired
	CounselingService cs;
	
	@RequestMapping("counselingMain.do")
	public String historyList(Model m, CounselingDto cdto,HttpSession session) throws Exception {
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		List<CounselingDto> list = cs.historyList(stu_no); // 여기를 수정하면 됩니다.
		m.addAttribute("historyList", list);
		return "counselingMain";
	}
	
	@RequestMapping(value = "subroomList.do", method = RequestMethod.POST)
	public void subroomList(HttpServletResponse resp,HttpSession session) throws Exception {
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		List<CounselingDto> list = cs.subroomList(stu_no); // 여기를 수정하면 됩니다.
		Gson json = new Gson(); 
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	}
	
	@RequestMapping(value = "counselingApply.do", method = RequestMethod.GET)
	public String counselingApply(HttpSession session,int sub_cd, String cs_date, String cs_nm, String cs_con) throws Exception {
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		cs.counselingApply(sub_cd, stu_no, cs_date, cs_nm, cs_con); // 여기를 수정하면 됩니다.
		return "redirect:counselingMain.do";
	}
}
