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
	// 학생이 상담 신청한 내역을 출력
	@RequestMapping("counselingMain.do")
	public String historyList(Model m, CounselingDto cdto,HttpSession session) throws Exception {
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		List<CounselingDto> list = cs.historyList(stu_no);
		m.addAttribute("historyList", list);
		return "counselingMain";
	}
	// 학생이 듣고 있는 수업의 list를 출력
	@RequestMapping(value = "subroomList.do", method = RequestMethod.POST)
	public void subroomList(HttpServletResponse resp,HttpSession session) throws Exception {
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		List<CounselingDto> list = cs.subroomList(stu_no);
		Gson json = new Gson(); 
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list)); // list에 저장된 값을 json으로 처리
	}
	
	// 상담 신청을 클릭시 insert
	@RequestMapping(value = "counselingApply.do", method = RequestMethod.GET)
	public String counselingApply(HttpSession session, CounselingDto dto) throws Exception {
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		dto.setStu_no(stu_no);
		cs.counselingApply(dto);
		return "redirect:counselingMain.do";
	}
}
