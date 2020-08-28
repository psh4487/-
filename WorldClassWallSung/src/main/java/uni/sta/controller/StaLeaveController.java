package uni.sta.controller;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import uni.sta.model.StaLeaveDto;
import uni.sta.model.StaffDto;
import uni.sta.model.StuDto;
import uni.sta.service.StaLeaveService;
@Controller
public class StaLeaveController {
	@Autowired
	StaLeaveService sls;

	public void setSls(StaLeaveService sls) {
		this.sls = sls;
	}
	

	@GetMapping("StaLeave.do")
	public String selectLeaveList(Model m) {
	    List<StaLeaveDto> list = sls.selectLeaveList(); 
		m.addAttribute("selectLeaveList", list);		
		return "StaLeave";
	}
	

	@RequestMapping(value ="StaLeavechaUpdate.go") 
	public String updateStaLeave(int no) { 
		sls.updateStaLeave(no);
		return "redirect:StaLeave.do";
		}
	
	@RequestMapping(value ="StaLeavechaNo.go") 
	public String StaLeavechaNo(int no) { 
		sls.StaLeavechaNo(no);
		return "redirect:StaLeave.do";
		}

	/*
	 * @RequestMapping(value = "leaveList", method = RequestMethod.POST, produces =
	 * "text/plain;charset=UTF-8")
	 * 
	 * @ResponseBody public String selectLeaveList() throws Exception {
	 * List<StaLeaveDto> list = sls.selectLeaveList(); Gson json = new Gson();
	 * return json.toJson(list); }
	 */
	
	
}
