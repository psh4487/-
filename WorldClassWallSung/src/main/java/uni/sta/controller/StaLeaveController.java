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

import com.google.gson.Gson;
import uni.sta.model.StaLeaveDto;
import uni.sta.model.StaffDto;
import uni.sta.service.StaLeaveService;
@Controller
public class StaLeaveController {
	@Autowired
	StaLeaveService sls;

	public void setSls(StaLeaveService sls) {
		this.sls = sls;
	}
	
	@RequestMapping(value = "StaLeave")
	public String staff() throws Exception {
		return "StaLeave";
	}

	@GetMapping("StaLeave")
	public String selectLeaveList(Model m) {
	    List<StaLeaveDto> list = sls.selectLeaveList(); //요청페이지 번호와 현재 페이지에서 보내줄양 
		m.addAttribute("selectLeaveList", list);
		
		return "StaLeave";
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
