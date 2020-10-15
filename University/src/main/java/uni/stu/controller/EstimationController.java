package uni.stu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import uni.main.model.Login_All_Dto;
import uni.stu.model.EestimationDto;
import uni.stu.service.EstimationService;

@Controller
public class EstimationController {
	@Autowired
	EstimationService ecs;
	
	@RequestMapping("estimationMain.do")
	public String historyList(Model m,HttpSession session) throws Exception {
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		List<EestimationDto> list = ecs.subjectList(stu_no); // 이곳을 변경해줘야 합니다
		List<EestimationDto> list1 = ecs.dataCheck(stu_no); // 이곳을 변경해줘야 합니다
		m.addAttribute("estimation_subject_List", list);
		m.addAttribute("dataCheck", list1);
		return "estimationMain";
	}
	
	@RequestMapping(value = "estimationPro.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String selSchedulePro() throws Exception {
		return "stu/estimationPro";
	}
	
	@RequestMapping("joinEstimation.do")
	public String joinEstimation(int stu_no, int sub_cd, int no1, int no2, int no3, int no4, int no5, int no6, int no7, int no8, int no9, int no10, String prof_say) throws Exception {
		ecs.joinEstimation(stu_no, sub_cd, no1, no2, no3, no4, no5, no6, no7, no8, no9, no10, prof_say);
		return "redirect:estimationMain.do";
	}
}
