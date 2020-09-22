package uni.stu.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import uni.stu.model.SelScheduleDto;
import uni.stu.service.SelScheduleService;

@Controller
public class SelScheduleController {
	@Autowired
	SelScheduleService sss;

	@RequestMapping("selScheduleMain.do")
	public String SelSchedule() throws Exception {
		return "selScheduleMain";
	}
	
	@RequestMapping(value = "builName.do", method = RequestMethod.POST)
	public void builNamelist(HttpServletResponse resp) throws Exception {
		List<SelScheduleDto> list = sss.builName();
		Gson json = new Gson(); 
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	}

	@RequestMapping(value = "subroomName.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String subroomNameList(String buil_no) throws Exception {
		List<SelScheduleDto> list = sss.subroomName(buil_no);
		Gson json = new Gson(); 		
		return json.toJson(list);
	}
	
	@RequestMapping(value = "selSchedulePro.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String selSchedulePro(Model m, String subroom_nm) throws Exception {
		List<SelScheduleDto> list = sss.subroomList(subroom_nm);
		m.addAttribute("selSchedulePro", list);		
		return "stu/selSchedulePro";
	}
	
	public void setSss(SelScheduleService sss) {
		this.sss = sss;
	}
}