package uni.stu.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mysql.cj.ParseInfo;

import uni.stu.model.LeaveDto;
import uni.stu.service.LeaveService;

@Controller
public class LeaveController {
	@Autowired
	LeaveService ls;

	private void referenceData(Model m) {
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.MONTH, 6);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String year = sdf.format(cal.getTime());
		String[] years = { year };
		String[] sem = { "1학기" };
		String[] chan = { "일반휴학", "군휴학", "복학" };
		m.addAttribute("leave_year", years);
		m.addAttribute("leave_sem", sem);
		m.addAttribute("leave_change", chan);
	}
	
	@RequestMapping(value = "leaveSave.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String leaveInsert(HttpServletRequest request) throws Exception {
		String leave_year = request.getParameter("leave_year");
		String leave_sem = request.getParameter("leave_sem");
		String leave_change = request.getParameter("leave_change");
		String stu_no = request.getParameter("stu_no");
		int stu_no_int = Integer.parseInt(stu_no);
		ls.leaveInsert(leave_year, leave_sem, leave_change, stu_no_int);
		return "redirect:leaveMain.do";
	}

	@RequestMapping(value = "leaveMain.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String leaveList(Model m) throws Exception {
		List<LeaveDto> list = ls.leaveList();
		m.addAttribute("allData", list);
		referenceData(m);
		return "leaveMain";
	}

	public void setLs(LeaveService ls) {
		this.ls = ls;
	}
}
