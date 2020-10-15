package uni.stu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import uni.main.model.Login_All_Dto;
import uni.stu.service.StuInfoService;

@Controller
public class StuInfoController {
	@Autowired
	StuInfoService ss;

	public void setSs(StuInfoService ss) {
		this.ss = ss;
	}

	@RequestMapping("stuInfoSel.do")
	public String SelInfo(HttpSession session, Model m, HttpServletResponse response_equals) throws IOException {
		int mem_no = ((Login_All_Dto) session.getAttribute("login")).getMem_no();

		if (mem_no == 1) {

			int stu_no = ((Login_All_Dto) session.getAttribute("login")).getStu_no();

			m.addAttribute("login", ss.SelInfo(stu_no));

			return "stuInfo";
		}

		if (mem_no == 2) {

			int prof_cd = ((Login_All_Dto) session.getAttribute("login")).getProf_cd();

			m.addAttribute("login", ss.SelInfoPro(prof_cd));

			return "proInfo";
		}

		if (mem_no == 3) {
			int staff_no = ((Login_All_Dto) session.getAttribute("login")).getStaff_no();
			if (staff_no != 2020300) {
				m.addAttribute("login", ss.SelInfoSta(staff_no));

				return "staInfo";
			} else {
				return "manInfo";
			}
		}

		response_equals.setContentType("text/html; charset=UTF-8");
		PrintWriter out_equals = response_equals.getWriter();
		out_equals.println("<script>alert('�α��� �� �̿����ּ���.');</script>");
		out_equals.flush();
		return "stafflist/loginformstu";

	}

	@RequestMapping("stuInfoUpform.do") // �𵨵�����searchTypeList �߰�
	public String upInfoForm(HttpSession session,Model m, HttpServletResponse response_equals) throws IOException {
		int mem_no = ((Login_All_Dto) session.getAttribute("login")).getMem_no();

		if (mem_no == 1) {
			int stu_no = ((Login_All_Dto) session.getAttribute("login")).getStu_no();

			m.addAttribute("login", ss.SelInfo(stu_no));

			return "stuInfoUp";
		}

		if (mem_no == 2) {
			int prof_cd = ((Login_All_Dto) session.getAttribute("login")).getProf_cd();

			m.addAttribute("login", ss.SelInfoPro(prof_cd));

			return "proInfoUp";
		}

		if (mem_no == 3) {
			int staff_no = ((Login_All_Dto) session.getAttribute("login")).getStaff_no();
			if (staff_no != 2020300) {
				
				return "staInfoUp";
			} else {
				return "manInfoUp";
			}
		}

		response_equals.setContentType("text/html; charset=UTF-8");
		PrintWriter out_equals = response_equals.getWriter();
		out_equals.println("<script>alert('�α��� �� �̿����ּ���.');</script>");
		out_equals.flush();
		return "stafflist/loginformstu";

	}

	@RequestMapping(value = "stuInfoUpUp.do")
	public String upInfo(HttpSession session, Login_All_Dto dto, HttpServletResponse response_equals)
			throws IOException {

		int mem_no = ((Login_All_Dto) session.getAttribute("login")).getMem_no();

		if (mem_no == 1) {

			ss.upInfo(dto);

			return "redirect:stuInfoSel.do";
		}

		if (mem_no == 2) {

			ss.upInfoPro(dto);

			return "redirect:stuInfoSel.do";
		}

		if (mem_no == 3) {
			ss.upInfoSta(dto);

			return "redirect:stuInfoSel.do";
		}

		response_equals.setContentType("text/html; charset=UTF-8");
		PrintWriter out_equals = response_equals.getWriter();
		out_equals.println("<script>alert('�α��� �� �̿����ּ���.');</script>");
		out_equals.flush();
		return "stafflist/loginformstu";

	}

}