package uni.stu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import uni.main.model.Login_All_Dto;
import uni.stu.service.StuInfoService;
import uni.stu.service.StuPassUpService;

@Controller
public class StuPassUpController {

	@Autowired
	StuPassUpService sps;
	StuInfoService ss;

	public void setSps(StuPassUpService sps) {
		this.sps = sps;
	}

	@RequestMapping("passUpForm.do") // 모델데이터searchTypeList 추가
	public String upInfoForm(HttpSession session, HttpServletResponse response_equals) throws IOException {
		int mem_no = ((Login_All_Dto) session.getAttribute("login")).getMem_no();
		if (mem_no == 1) {
			return "passUpStuForm";
		}

		if (mem_no == 2) {

			return "passUpProForm";
		}

		if (mem_no == 3) {
			int staff_no = ((Login_All_Dto) session.getAttribute("login")).getStaff_no();
			if (staff_no != 2020300) {
				
				return "passUpStaForm";
			} else {
				return "passUpManForm";
			}
		}

		response_equals.setContentType("text/html; charset=UTF-8");
		PrintWriter out_equals = response_equals.getWriter();
		out_equals.println("<script>alert('로그인 후 이용해주세요.');</script>");
		out_equals.flush();
		return "stafflist/loginformstu";

	}

	@RequestMapping("pwdUpDateStu.do")
	public String SelInfo(HttpSession session, Model m, Login_All_Dto dto, String chk_stu_pwd, String new_stu_pwd,
			String new_stu_pwd1, HttpServletResponse response_equals, HttpServletRequest request) throws IOException {
		int stu_no = ((Login_All_Dto) session.getAttribute("login")).getStu_no();
		Map<String, Object> map = new HashMap<>();

		if (chk_stu_pwd == "" || new_stu_pwd == "" || new_stu_pwd1 == "") {

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('비밀번호를 입력해주세요.');</script>");
			out_equals.flush();
			return "passUpStuForm";
		}

		if (!new_stu_pwd.equals(new_stu_pwd1)) {
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('새 비밀번호와 비밀번호 확인이 일치하지않습니다.');</script>");
			out_equals.flush();
			return "passUpStuForm";
		}

		String stu_pwd = sps.pwd_check_stu(stu_no);

		if (!chk_stu_pwd.equals(stu_pwd)) {

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('기존 비밀번호를 정확히 입력해주세요.');</script>");
			out_equals.flush();
			return "passUpStuForm";
		} else {
			map.put("stu_no", stu_no);
			map.put("stu_pwd", new_stu_pwd);
			sps.pwdUpdateStu(map, dto);

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('비밀번호가 변경되었습니다.');</script>");
			out_equals.flush();
			return "passUpStuForm";
		}
	}

	@RequestMapping("pwdUpDateSta.do")
	public String SelInfoSta(HttpSession session, Model m, Login_All_Dto dto, String chk_sta_pwd, String new_sta_pwd,
			String new_sta_pwd1, HttpServletResponse response_equals, HttpServletRequest request) throws IOException {
		int staff_no = ((Login_All_Dto) session.getAttribute("login")).getStaff_no();
		Map<String, Object> map = new HashMap<>();
  
		if (chk_sta_pwd == "" || new_sta_pwd == "" || new_sta_pwd1 == "") {
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('비밀번호를 입력해주세요.');</script>");
			out_equals.flush();
			return "passUpStaForm";
		}

		if (!new_sta_pwd.equals(new_sta_pwd1)) {
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('새 비밀번호와 비밀번호 확인이 일치하지않습니다.');</script>");
			out_equals.flush();
			return "passUpStaForm";
		}
		String staff_pwd = sps.pwd_check_sta(staff_no);
		if (!chk_sta_pwd.equals(staff_pwd)) {
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('기존 비밀번호를 정확히 입력해주세요.');</script>");
			out_equals.flush();
			return "passUpStaForm";
		} else {
			map.put("staff_no", staff_no);
			map.put("staff_pwd", new_sta_pwd);
			sps.pwdUpdateSta(map, dto);
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('비밀번호가 변경되었습니다.');</script>");
			out_equals.flush();

			return "passUpStaForm";
		}

	}

	@RequestMapping("pwdUpDatePro.do")
	public String SelInfoPro(HttpSession session, Model m, Login_All_Dto dto, String chk_pro_pwd, String new_pro_pwd,
			String new_pro_pwd1, HttpServletResponse response_equals, HttpServletRequest request) throws IOException {
		int prof_cd = ((Login_All_Dto) session.getAttribute("login")).getProf_cd();
		Map<String, Object> map = new HashMap<>();
		if (chk_pro_pwd == "" || new_pro_pwd == "" || new_pro_pwd1 == "") {
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('비밀번호를 입력해주세요.');</script>");
			out_equals.flush();
			return "passUpProForm";
		}

		if (!new_pro_pwd.equals(new_pro_pwd1)) {
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('새 비밀번호와 비밀번호 확인이 일치하지않습니다.');</script>");
			out_equals.flush();
			return "passUpProForm";
		}
		String prof_pwd = sps.pwd_check_pro(prof_cd);
		System.out.println(prof_pwd);
		if (!chk_pro_pwd.equals(prof_pwd)) {
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('기존 비밀번호를 정확히 입력해주세요.');</script>");
			out_equals.flush();
			return "passUpProForm";
		} else {
			map.put("prof_cd", prof_cd);
			map.put("prof_pwd", new_pro_pwd);
			sps.pwdUpdatePro(map, dto);

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('비밀번호가 변경되었습니다.');</script>");
			out_equals.flush();
			return "passUpProForm";
		}

	}
	
	@RequestMapping("pwdUpDateMan.do")
	public String SelInfoMan(HttpSession session, Model m, Login_All_Dto dto, String chk_sta_pwd, String new_sta_pwd,
			String new_sta_pwd1, HttpServletResponse response_equals, HttpServletRequest request) throws IOException {
		int staff_no = ((Login_All_Dto) session.getAttribute("login")).getStaff_no();
		Map<String, Object> map = new HashMap<>();
  
		if (chk_sta_pwd == "" || new_sta_pwd == "" || new_sta_pwd1 == "") {
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('비밀번호를 입력해주세요.');</script>");
			out_equals.flush();
			return "passUpStaForm";
		}

		if (!new_sta_pwd.equals(new_sta_pwd1)) {
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('새 비밀번호와 비밀번호 확인이 일치하지않습니다.');</script>");
			out_equals.flush();
			return "passUpStaForm";
		}
		String staff_pwd = sps.pwd_check_sta(staff_no);
		if (!chk_sta_pwd.equals(staff_pwd)) {
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('기존 비밀번호를 정확히 입력해주세요.');</script>");
			out_equals.flush();
			return "passUpStaForm";
		} else {
			map.put("staff_no", staff_no);
			map.put("staff_pwd", new_sta_pwd);
			sps.pwdUpdateSta(map, dto);
			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('비밀번호가 변경되었습니다.');</script>");
			out_equals.flush();

			return "passUpStaForm";
		}

	}

}