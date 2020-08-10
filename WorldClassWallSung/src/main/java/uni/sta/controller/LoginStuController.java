package uni.sta.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import uni.sta.model.StuDto;
import uni.sta.service.LoginStuService;

@Controller
public class LoginStuController {

	LoginStuService lss;

	@Autowired
	public void setLss(LoginStuService lss) {
		this.lss = lss;
	}

	// 로그인 폼을 띄우는 부분
	@RequestMapping(value = "loginstu.do")
	public String loginForm() throws Exception {
		return "loginformstu";
	}

	 //로그인 처리하는 부분
	  
	 @RequestMapping(value="loginCheck",method=RequestMethod.POST) 
	 public String LoginStuDao(HttpSession session,StuDto dto){ 
		 String returnURL = "mainstu"; 
		 if( session.getAttribute("login") != null ){ // 기존에 login이란 세션 값이 존재한다면
			 session.removeAttribute("login"); // 기존값을 제거해 준다. }
		 }
			 // 로그인이 성공하면 UsersVO 객체를 반환함. 
	 StuDto dto1 = lss.LoginStu(dto);
	 
	 if ( dto1 != null ){ // 로그인 성공 
		 session.setAttribute("login", dto1); 
		 // 세션에login인이란 이름으로 UsersVO 객체를 저장해 놈. 
		 return returnURL;
	 // 로그인 성공시메인페이지로 이동하고 
	 }else { // 로그인에 실패한 경우 
		 returnURL = "loginformstu"; //로그인 폼으로 다시 가도록 함
	 }
	  return returnURL; // 위에서 설정한 returnURL 을 반환해서 이동시킴 }
	  }
	 // 로그아웃 하는 부분
	  
		/*
		 * @RequestMapping(value="/logoutstu") public String logout(HttpSession
		 * session){ session.invalidate(); // 세션 초기화 return "redirect:/loginstu"; //
		 * 로그아웃 후 로그인화면으로 이동 }
		 */
	 
} // end of controller
