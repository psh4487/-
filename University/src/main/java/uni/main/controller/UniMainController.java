package uni.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UniMainController {
	
	@RequestMapping(value="layout1.do", method = RequestMethod.GET)
	public String layout1(Model model) {
		return "layout1";
	}
	@RequestMapping(value="layout2.do", method = RequestMethod.GET)
	public String layout2(Model model) {
		return "layout2";
	}
	@RequestMapping(value="layout3.do", method = RequestMethod.GET)
	public String layout3(Model model) {
		return "layout3";
	}
	@RequestMapping(value="layout4.do", method = RequestMethod.GET)
	public String layout4(Model model) {
		return "layout4";
	}
	@RequestMapping(value="mainSta.do", method = RequestMethod.GET)
	public String mainSta(Model model) {
		return "mainSta";
	}
}