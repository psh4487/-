package uni.stu.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import uni.main.model.Login_All_Dto;
import uni.sta.model.StuDto;
import uni.stu.model.InReportDto;
import uni.stu.service.InReportService;

@Controller
public class InReportController {
	InReportService service;
	
	@Autowired
	public void setService(InReportService service) {
		this.service = service;
	}
	@RequestMapping("insertReport.do")
	public String form(@ModelAttribute("InReportDto")InReportDto inReportDto, Model model,HttpSession session)throws Exception {
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		List<InReportDto> list = service.sublist();
		List<InReportDto> list1 = service.reportList(stu_no);
		model.addAttribute("list", list);
		model.addAttribute("reportlist", list1);
		return "insertreport";
		
	}
	@RequestMapping("insertReport_tb.do")
		public String insertReport(HttpServletRequest request, @RequestParam("report_path")MultipartFile file, HttpSession session) {
		try {			
		int stu_no = ((Login_All_Dto)session.getAttribute("login")).getStu_no();
		uploadService(request, file,stu_no);
		return "redirect:insertReport.do";
		}catch(DuplicateKeyException e) {
			return "stu/major/error1";
		}
	}
	public void uploadService(HttpServletRequest request, MultipartFile file,int stu_no) {
		String sub_cd = request.getParameter("sub_cd");	
		String report_path = "d:/upload/";
		int i = file.getOriginalFilename().lastIndexOf(".");
		String report_file = sub_cd+"_"+stu_no+"."+file.getOriginalFilename().substring(i+1);
		String report_nm = request.getParameter("report_nm");
		
		File f = new File(report_path+report_file);
		try {
			file.transferTo(f);			
		} catch(IllegalStateException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		} 
		service.insert(stu_no,sub_cd, file, f.getPath(),report_nm);
	}
}
