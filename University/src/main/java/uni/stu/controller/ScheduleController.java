package uni.stu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import uni.main.model.Login_All_Dto;
import uni.stu.model.ScheduleDto;
import uni.stu.service.ScheduleService;

@Controller
public class ScheduleController {
	@Autowired
	ScheduleService ss;

	@RequestMapping(value = "scheduleMain.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String scheduleList(Model m, ScheduleDto sdto, HttpSession session)  throws Exception {
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		List<ScheduleDto> list = ss.scheduleList(stu_no); 
		sdto = ss.scheduleName(stu_no); 
		m.addAttribute("schedulelist", list);
		m.addAttribute("schedulename", sdto);
		return "scheduleMain";
	}

	public void setSs(ScheduleService ss) {
		this.ss = ss;
	}
}