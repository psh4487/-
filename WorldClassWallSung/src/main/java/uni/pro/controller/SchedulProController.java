package uni.pro.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import uni.main.model.Login_All_Dto;
import uni.pro.model.SchedulProDto;
import uni.pro.service.SchedulProService;

@Controller
public class SchedulProController {

	@Autowired
	SchedulProService service;


	@RequestMapping(value = "SchedulProInfo.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String scheduleList(Model m, HttpSession session)  throws Exception {
		int prof_cd = ((Login_All_Dto)session.getAttribute("login")).getProf_cd();
		List<SchedulProDto> proname = service.proname(prof_cd);
		List<SchedulProDto> pdto = service.schedulelist(prof_cd);
		m.addAttribute("proname", proname);
		m.addAttribute("list", pdto);
		return "SchedulProInfo";
	}

	public void setService(SchedulProService service) {
		this.service = service;
	}
	
}
