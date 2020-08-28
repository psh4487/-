package uni.sta.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import lombok.Setter;
import uni.sta.model.SubjectDto;
import uni.sta.service.RestService;

@Controller("StaRest")
public class StaRestController {

	@Setter
	@Autowired
	RestService rs;
	
	@RequestMapping(value="StaRest1.do")
	public String go1() {
		return "StaRest"; 
	}
	
	@RequestMapping(value = "StaRest2.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public ModelAndView go2(String sub_nm) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",rs.reasonList(sub_nm));	
		mav.setViewName("/sta/StaRest2");		
		return mav; 
	}
	
	@RequestMapping(value="viewlist.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String viewList(String name) {
		List<SubjectDto> p_list = rs.viewList();
		Gson json = new Gson();	
		return json.toJson(p_list); 
	}
	@RequestMapping(value="accept.do", produces = "text/plain;charset=UTF-8")
	public String accept(String sub_cd) {	
		rs.accept(sub_cd);
		return "sta/StaRest"; 
	}
	
	@RequestMapping(value="naccept.do", produces = "text/plain;charset=UTF-8")
	public String naccept(String sub_cd) {		
		rs.naccept(sub_cd);
		return "sta/StaRest"; 
	}
}
