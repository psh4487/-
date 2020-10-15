package uni.stu.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import uni.main.model.Login_All_Dto;
import uni.stu.model.LicenseDto;
import uni.stu.model.ServiceDto;
import uni.stu.service.LicenseService;
import uni.stu.service.ServiceService;

@Controller
public class LicenseController {
	LicenseService service;
	ServiceService service1;
	@Autowired
	public void setService1(ServiceService service1) {
		this.service1 = service1;
	}
	@Autowired
	public void setService(LicenseService service) {
		this.service = service;
	}
	@RequestMapping("/licenseList")
	public String list() {
		return "stu/license/list";
	}
	
	@RequestMapping("licenseMain.do")
	public String form(@ModelAttribute("LicenseDto")LicenseDto licenseDto, Model model,HttpSession session)throws Exception{
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		List<LicenseDto> list = service.licenseList(stu_no);
		List<ServiceDto> list1 = service1.serviceList(stu_no);
		model.addAttribute("list", list);
		model.addAttribute("service", list1);
		return "license";
	}
	@GetMapping("deleteLicense.do")//자격증 삭제
	public String delete(@RequestParam("li_no")int li_no,HttpSession session) {
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		service.delete(li_no,stu_no);
		return "redirect:licenseMain.do";
	}
	@GetMapping("deleteSer.do")//봉사활동 삭제
	public String deleteSer(@RequestParam("ser_no")int ser_no,HttpSession session) {
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		service1.delete(ser_no,stu_no);
		return "redirect:licenseMain.do";
	}
	@RequestMapping("insertLicenseForm.do")//자격증 폼
	public String insertForm() {
		return "stu/license/insertForm";
	}
	@RequestMapping("insertServiceForm.do")//봉사활동 폼
	public String insertServiceForm() {
		return "stu/license/insertServiceForm";
	}
	@RequestMapping("insertLicense.do")//자격증 추가
	public String insert(HttpServletRequest request,@RequestParam("li_path")MultipartFile file,HttpSession session) {
		try{
			upload(request, file,session);
		
			return "redirect:licenseMain.do";
		} catch(Exception e) {
			return "stu/major/error2";
		}
	}
	@RequestMapping("insertService.do")//봉사활동 추가
	public String insertService(HttpServletRequest request,@RequestParam("ser_path")MultipartFile file,HttpSession session) {
		try{
			uploadService(request, file,session);		
			return "redirect:licenseMain.do";
		} catch(Exception e) {
			return "stu/major/error2";
		}
	}
	
	public void upload(HttpServletRequest request, MultipartFile file,HttpSession session) {//자격증 추가
		String name = request.getParameter("li_nm");
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		
		String date = request.getParameter("li_date");
		String path = "d:/upload/";
		int i = file.getOriginalFilename().lastIndexOf(".");
		String file_nm = name +"_"+stu_no +"."+file.getOriginalFilename().substring(i+1); 
		
		File f = new File(path+file_nm);
		try {
			file.transferTo(f);
			
		} catch(IllegalStateException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}
		service.insert(name,f.getPath(), date,stu_no, file);
	}
	public void uploadService(HttpServletRequest request, MultipartFile file,HttpSession session) {//봉사활동 추가
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		
		String start = request.getParameter("ser_date");
		
		String finish = request.getParameter("fin_date");
		
		int time = Integer.parseInt(request.getParameter("ser_time"));
		
		String con = request.getParameter("ser_con");
		int i = file.getOriginalFilename().lastIndexOf(".");		
		String name = con +"_"+stu_no+"."+file.getOriginalFilename().substring(i+1);
		
		String path = "d:/upload/";		
		
		File f = new File(path+name);
		try {
			file.transferTo(f);
			
		} catch(IllegalStateException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}
		service1.insert(start, finish ,con, time, f.getPath(),stu_no, file);
	}
	
	  
	 
}
