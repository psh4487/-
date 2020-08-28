package uni.main.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import uni.main.model.Login_All_Dto;
import uni.main.service.LoginStuService;
import uni.sta.model.ProDto;
import uni.sta.model.StaffDto;
import uni.sta.model.StuDto;


@Controller
public class LoginStuController {

	LoginStuService lss;
	JavaMailSender mailSender;

	@Autowired
	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	@Autowired
	public void setLss(LoginStuService lss) {
		this.lss = lss;
	}

	// 로그인 폼을 띄우는 부분
	@RequestMapping(value = "loginstu.do")
	public String loginForm() throws Exception {

		return "stafflist/loginformstu";
	}

	// 로그인 처리하는 부분

	@RequestMapping(value = "loginCheck.do", method = RequestMethod.POST)
	public String LoginStuDao(HttpSession session, int all_cd, String all_pwd, Login_All_Dto alldto,
			HttpServletResponse response_equals) throws IOException {

		if (session.getAttribute("login") != null) {
			session.removeAttribute("login");
		}
  
		Map<String, Object> map = new HashMap<>();

		map.put("stu_no", alldto.getAll_cd());
		map.put("stu_pwd", alldto.getAll_pwd());

		map.put("prof_cd", alldto.getAll_cd());
		map.put("prof_pwd", alldto.getAll_pwd());

		map.put("staff_no", alldto.getAll_cd());
		map.put("staff_pwd", alldto.getAll_pwd());
		
		Login_All_Dto alldto_stu = lss.LoginStu(map, alldto);
		Login_All_Dto alldto_pro = lss.LoginPro(map,alldto);
		Login_All_Dto alldto_sta = lss.LoginSta(map,alldto);
		
		

		if (alldto_stu != null || alldto_pro != null || alldto_sta != null) {

			if (all_cd < 2020201 && all_cd > 2020100) {

				session.setAttribute("login", alldto_stu);
				
				return "layout1";

			}

			if (all_cd < 2020300 && all_cd > 2020200) {
				session.setAttribute("login", alldto_pro);
				

				return "layout2";

			}

			if (all_cd < 2020401 && all_cd > 2020300) {
				session.setAttribute("login", alldto_sta);	
				return "layout3";
			}

			if (all_cd == 2020300) {
				session.setAttribute("login", alldto_sta);
				return "layout4";
			}

		} else {
			response_equals.setContentType("text/html; charset=UTF-8");

			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('아이디 또는 비밀번호가 틀렸습니다.');</script>");
			out_equals.flush();
			return "stafflist/loginformstu";
		}
		return "stafflist/loginformstu";
	}

	////////////////////////////////////////////////////////////////////////

	// 비밀번호 찾기

	@RequestMapping(value = "find_pass_start_all.do")
	public String find_pass_start_pro_form() throws Exception {
		return "stafflist/findpass/find_pass_start_all";
	}

	@RequestMapping(value = "find_pass_all.do", method = RequestMethod.POST)
	public ModelAndView mailSending(HttpServletRequest request, int all_cd, String all_email, Login_All_Dto alldto,
			HttpServletResponse response_email) throws IOException {

		Map<String, Object> map = new HashMap<>();

		map.put("prof_cd", alldto.getAll_cd());
		map.put("prof_email", alldto.getAll_email());

		map.put("staff_no", alldto.getAll_cd());
		map.put("staff_email", alldto.getAll_email());

		map.put("stu_no", alldto.getAll_cd());
		map.put("stu_email", alldto.getAll_email());

		Login_All_Dto alldto_stu = lss.idmailcheck_stu(map, alldto);
		Login_All_Dto alldto_pro = lss.idmailcheck_pro(map, alldto);
		Login_All_Dto alldto_sta = lss.idmailcheck_sta(map, alldto);

		ModelAndView mv = new ModelAndView();

		if (alldto_stu != null || alldto_pro != null || alldto_sta != null) {

			Login_All_Dto email = new Login_All_Dto();

			Random r = new Random();
			int certiNum = r.nextInt(4589362) + 49311;
			/* String setfrom = "momomichael7@gmail.com"; */
			String receiver = request.getParameter("all_email");
			;

			String subject = "비밀번호 찾기 인증 이메일 입니다.";
			String content =

					System.getProperty("line.separator") +

							System.getProperty("line.separator") +

							"안녕하세요 비밀번호 찾기 인증 이메일입니다."

							+ System.getProperty("line.separator") +

							System.getProperty("line.separator") +

							"비밀번호 찾기 인증번호는 " + certiNum + "입니다. "

							+ System.getProperty("line.separator") +

							System.getProperty("line.separator") +

							"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다.";

			email.setReceiver(receiver);

			email.setSubject(subject);

			email.setContent(content);

			lss.mailSend(email);

			HttpSession session = request.getSession();

			session.setAttribute("certiNum", certiNum);
			session.setAttribute("all_email", all_email);
			session.setAttribute("all_cd", all_cd);

			mv.setViewName("stafflist/findpass/pass_email_all");
			return mv;
		} else {

			response_email.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_email.getWriter();
			out_equals.println("<script>alert('아이디 또는 이메일이 틀렸습니다.');</script>");
			out_equals.flush();

			mv.setViewName("stafflist/findpass/find_pass_start_all");
			return mv;

		}
	}

	@RequestMapping(value = "pass_injeung_all")
	public ModelAndView join_certification(HttpSession session, HttpServletRequest request, int inputCode,
			String prof_email, HttpServletResponse response_equals) throws IOException {

		ModelAndView mv = new ModelAndView();

		int generationCode = (int) session.getAttribute("certiNum");

		if (inputCode == generationCode) {

			// 인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 비밀번호 변경창으로 이동시킨다

			mv.setViewName("stafflist/findpass/pass_change_all");

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하였습니다. 비밀번호 변경창으로 이동합니다.');</script>");
			out_equals.flush();

			return mv;

		} else {
			mv.setViewName("stafflist/findpass/pass_email_all");

			response_equals.setContentType("text/html; charset=UTF-8");
			PrintWriter out_equals = response_equals.getWriter();
			out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
			out_equals.flush();

			return mv;

		}
	}

	// 변경할 비밀번호를 입력한 후에 확인 버튼을 누르면 넘어오는 컨트롤러
	@RequestMapping(value = "pass_change", method = RequestMethod.POST)
	public ModelAndView pass_change_sta(HttpServletRequest request, StuDto dto, ProDto dto1, StaffDto dto2,
			HttpServletResponse pass) throws Exception {

		HttpSession session = request.getSession();
		String all_email = (String) session.getAttribute("all_email");
		String all_pwd = request.getParameter("all_pwd");

		int all_cd = (int) session.getAttribute("all_cd");
		ModelAndView mv = new ModelAndView();

		if (all_cd < 2020201 && all_cd > 2020100) {

			dto.setStu_pwd(all_pwd);
			dto.setStu_email(all_email);

			Map<String, Object> map = new HashMap<>();

			map.put("stu_pwd", dto.getStu_pwd());
			map.put("stu_email", dto.getStu_email());

			lss.pass_change_stu(map, dto);
		}

		if (all_cd < 2020300 && all_cd > 2020200) {
			dto1.setProf_pwd(all_pwd);
			dto1.setProf_email(all_email);

			Map<String, Object> map = new HashMap<>();

			map.put("prof_pwd", dto1.getProf_pwd());
			map.put("prof_email", dto1.getProf_email());

			lss.pass_change_pro(map, dto1);

		}

		if (all_cd < 2020401 && all_cd >= 2020300) {
			dto2.setStaff_pwd(all_pwd);
			dto2.setStaff_email(all_email);

			Map<String, Object> map = new HashMap<>();

			map.put("staff_pwd", dto2.getStaff_pwd());
			map.put("staff_email", dto2.getStaff_email());

			lss.pass_change_sta(map, dto2);

		}

		mv.setViewName("stafflist/findpass/find_pass_result");
		session.invalidate();
		return mv;

	}

	@RequestMapping(value = "logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
        
		return "redirect:loginstu.do";
	}

} // end of controller
