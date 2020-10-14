package uni.stu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import uni.main.model.Login_All_Dto;
import uni.stu.model.RevokeDto;
import uni.stu.service.RevokeService;

@Controller
public class RevokeController {
	@Autowired
	RevokeService rs;
	
	@RequestMapping(value = "revokeMain.do", method = RequestMethod.GET)
	public String revokeList(Model m,HttpSession session)  throws Exception {
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		// 학생 번호를 가져와서 학생이 듣고 있는 과목 list 저장
		List<RevokeDto> list = rs.revokeList(stu_no); 
		// "revklist"라는 이름으로 모델 저장
		m.addAttribute("revklist", list); 
		return "revokeMain";
	}
	
	@RequestMapping(value = "revokeDelete.do", method = RequestMethod.GET)
	public String revokeDelete(Model m, int sub_cd, int stu_no)  throws Exception {
		rs.revokeDelete(stu_no, sub_cd); // 학생번호와 과목 번호를 전달
		return "redirect:revokeMain.do";
	}
	
	public void setRs(RevokeService rs) {
		this.rs = rs;
	}
}