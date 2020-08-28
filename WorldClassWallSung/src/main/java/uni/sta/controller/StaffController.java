package uni.sta.controller;

import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.Gson;
import uni.sta.model.StaffDto;
import uni.sta.service.StaffService;
@Controller
public class StaffController {
	@Autowired
	StaffService staff;
	
	public void setStaff(StaffService staff) {
		this.staff = staff;
	}
	
	@RequestMapping(value = "staffInfo.do")
	public String staff() throws Exception {
		return "staffInfo";
	}
	
	@RequestMapping(value = "Go3.do")
	public String staGo1() throws Exception {
		return "layout3";
	}
	@RequestMapping(value = "Go4.do")
	public String staGo2() throws Exception {
		return "layout4";
	}
	
	@RequestMapping(value = "depts.do", method = RequestMethod.POST)
	@ResponseBody
	public void deptList(HttpServletResponse resp) throws Exception {
		List<StaffDto> list = staff.selectDepts();
		Gson json = new Gson(); 
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	
	}
	
	@RequestMapping(value = "staffList.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String staffList(String staff_dept) throws Exception {
		List<StaffDto> list = staff.selectstaffList(staff_dept);
		Gson json = new Gson(); 		
		return json.toJson(list);
	}

	




}
