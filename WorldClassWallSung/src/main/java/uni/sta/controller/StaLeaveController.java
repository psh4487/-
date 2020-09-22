package uni.sta.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import uni.main.model.Login_All_Dto;
import uni.sta.model.StaLeaveDto;
import uni.sta.service.StaLeaveService;


@Controller
public class StaLeaveController {
	@Autowired
	StaLeaveService sls;

	public void setSls(StaLeaveService sls) {
		this.sls = sls;
	}
	

	@GetMapping("StaLeave.do")
	public String selectLeaveList(Model m,HttpSession session) {
	    List<StaLeaveDto> list = sls.selectLeaveList(); 
		m.addAttribute("selectLeaveList", list);		
		int staff_no = ((Login_All_Dto)session.getAttribute("login")).getStaff_no();
		if(staff_no == 2020300) {
		return "StaLeave1";
		}
		return "StaLeave";
	}
	

	@RequestMapping(value ="StaLeavechaUpdate.do") 
	public String updateStaLeave(int no) { 
		sls.updateStaLeave(no);
		return "redirect:StaLeave.do";
		}
	
	@RequestMapping(value ="StaLeavechaNo.do") 
	public String StaLeavechaNo(int no) { 
		sls.StaLeavechaNo(no);
		return "redirect:StaLeave.do";
		}

	
	
	
}
