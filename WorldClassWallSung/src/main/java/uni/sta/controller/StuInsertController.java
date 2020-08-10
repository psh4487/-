package uni.sta.controller;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import uni.sta.model.StuDto;
import uni.sta.service.StuInsertService;

@Controller
public class StuInsertController {
	@Autowired
	StuInsertService stu;

	public void setStu(StuInsertService stu) {
		this.stu = stu;
	}
	
	@GetMapping 
	public String insertform() throws Exception { 
		return "stujoin"; 
		}
	
	
	@RequestMapping(value ="memberjoinpro", method = RequestMethod.POST) 
	public ModelAndView insertStu(StuDto dto) { 
		ModelAndView mav = new ModelAndView(); 
		stu.insertStu(dto); 
		mav.setViewName("stujoin"); 
		return mav; 
		}// end memberJoinPro()

	
	
	
	
	
	/*
	 * @GetMapping public String insertform() throws Exception { return "stujoin"; }
	 * 
	 * 
	 * @RequestMapping(method = RequestMethod.POST) public String
	 * submit(@ModelAttribute("command") StuDto dto) { stu.insertStu(dto); return
	 * "stujoin"; }
	 */
	
	/*
	 * ModelAndView insertStu(StuDto dto) { ModelAndView mav = new ModelAndView();
	 * stu.insertStu(dto); mav.setViewName("stujoin1"); return "stujoin"; }// end
	 * memberJoinPro()
	 */
	
	
}
