package uni.pro.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import uni.main.model.Login_All_Dto;
import uni.pro.model.ReportDto;

import uni.pro.service.ReportService;

@Controller
public class ReportController {

	@Autowired
	ReportService service;

	public void setService(ReportService service) {
		this.service = service;
	}

	@RequestMapping(value = "reportInfo.do")
	public String sub() throws Exception {
		return "reportInfo";
	}

	@RequestMapping(value = "reportsub.do", method = RequestMethod.POST)
	@ResponseBody
	public void subList(HttpServletResponse resp, HttpSession session) throws Exception {
		int prof_cd = ((Login_All_Dto) session.getAttribute("login")).getProf_cd();
		List<ReportDto> list = service.sublist(prof_cd);
		Gson json = new Gson();
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(json.toJson(list));
	}

	@RequestMapping(value = "reportall.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String reportall(String sub_cd) throws Exception {
		List<ReportDto> list = service.reportall(sub_cd);
		Gson json = new Gson();
		return json.toJson(list);
	}

	@RequestMapping(value = "reportform.do", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public ModelAndView reportList(int stu_no,String sub_cd) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pro/report/reportform");
		mav.addObject("list", service.viewreport(stu_no,sub_cd));
		return mav;
	}
	@RequestMapping("download.do")
	public ModelAndView fileDownload(@RequestParam("report_file") String report_file,
			@RequestParam("report_path") String report_path) throws Exception {
		/** 첨부파일 정보 조회 */
		Map<String, Object> down = new HashMap<String, Object>();
		down.put("report_file", report_file);
		down.put("report_path", report_path);
		return new ModelAndView("fileDownloadUtil", "down", down);
	}
	
	 @RequestMapping(value ="reportok.do") 
	public String updatestateok(int  stu_no) { 
		service.reportok(stu_no);
		return "redirect:reportInfo.do";
	}
}