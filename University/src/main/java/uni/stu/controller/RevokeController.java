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
	
	@RequestMapping(value = "revokeMain.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String revokeList(Model m,HttpSession session)  throws Exception {
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		List<RevokeDto> list = rs.revokeList(stu_no);
		m.addAttribute("revklist", list);
		return "revokeMain";
	}
	
	@RequestMapping(value = "revokeDelete.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String revokeDelete(Model m, int sub_cd, int stu_no)  throws Exception {
		int list = rs.revokeDelete(stu_no, sub_cd);
		m.addAttribute("sub_cd", list);
		return "redirect:revokeMain.do";
	}
	
	public void setRs(RevokeService rs) {
		this.rs = rs;
	}
}