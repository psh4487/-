package uni.sta.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import lombok.Setter;
import uni.sta.model.SubjectDto;
import uni.sta.service.RestSubService;

@Controller("StaSub")
public class StaSubController {

	@Setter
	@Autowired
	RestSubService rss;
	

	@RequestMapping(value = "StaSub1.do")
	public String go1() {
		return "StaSubMain"; 
	}
	
	@RequestMapping(value="sublist.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String viewList(String name) {
		List<SubjectDto> p_list = rss.viewSub();
		Gson json = new Gson();	
		return json.toJson(p_list); 
	}	
	
	@RequestMapping(value = "StaSubSub.do", produces = "text/plain;charset=UTF-8")
	public ModelAndView go2(String sub_nm) {
		ModelAndView mav = new ModelAndView();
		List<SubjectDto> list = rss.viewSubOne(sub_nm);		
		mav.addObject("list", list);	
		mav.setViewName("StaSubMain");		
		return mav; 
	}
	
	@RequestMapping(value="acceptSub.do", produces = "text/plain;charset=UTF-8")
	public String accept(String sub_cd) {	
		rss.accept(sub_cd);
		return "StaSubMain"; 
	}
	
	@RequestMapping(value="nacceptSub.do", produces = "text/plain;charset=UTF-8")
	public String naccept(String sub_cd) {		
		rss.naccept(sub_cd);
		return "StaSubMain"; 
	}
	
	@RequestMapping(value = "manageRoom.do", method = RequestMethod.POST)
	public void searchBd(HttpServletResponse resp) throws Exception {
		List<SubjectDto> list = rss.searchBd();
		Gson json = new Gson(); 
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	}
	
	@RequestMapping(value = "room.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String searchRm(String buil_no) throws Exception {
		List<Map<String,Object>> list = rss.searchRm(buil_no);
		Gson json = new Gson(); 		
		return json.toJson(list);
	}
	
	@RequestMapping(value = "room2.do", produces = "text/plain;charset=UTF-8")
	public ModelAndView searchTime(String subroom_nm) {
		ModelAndView mav = new ModelAndView();
		List<SubjectDto> list = rss.selectRm(subroom_nm);		
		mav.addObject("list", list);	
		mav.setViewName("sta/StaSubRoom");
		return mav; 
	}
}
