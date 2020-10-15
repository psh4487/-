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
import uni.pro.model.ReportDto;
import uni.pro.model.TestDto;
import uni.pro.service.TestService;


@Controller
public class TestController {

	@Autowired
	TestService test;

	public void setTest(TestService test) {
		this.test = test;
	}

	@RequestMapping(value = "test.do")
	public String emp(TestDto data) throws Exception {
		test.updateTest(data);
		return "prograde";
	}
	
	@RequestMapping(value = "testScore.do", method = RequestMethod.POST)
	@ResponseBody
	public void subList(HttpServletResponse resp, HttpSession session) throws Exception {
		int prof_cd = ((Login_All_Dto) session.getAttribute("login")).getProf_cd();
		List<TestDto> list = test.selData(prof_cd);
		Gson json = new Gson();
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	}
	
	
}