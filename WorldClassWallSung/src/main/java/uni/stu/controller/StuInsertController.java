package uni.stu.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import uni.sta.model.ProDto;
import uni.sta.model.StaLeaveDto;
import uni.sta.model.StaffDto;
import uni.sta.model.StuDeptDto;
import uni.sta.model.StuDto;
import uni.main.service.LoginStuService;
import uni.sta.service.StuInsertService;

@Controller
public class StuInsertController {
	@Autowired
	StuInsertService stu;
	@Autowired
	LoginStuService lss;

	public void setStu(StuInsertService stu) {
		this.stu = stu;
	}
	@ModelAttribute("selectStuDeptList") //모델데이터searchTypeList 추가 
	public List<StuDeptDto> selectStuDeptList() {
		List<StuDeptDto> list = stu.selectStuDeptList();
		return list;
	}
	
	@RequestMapping(value = "stuInfo.do")
	public String stuInfo() {			
		return "stuInfo";
	}
	@RequestMapping(value = "stuInfoUp.do")
	public String stuInfoUp() {			
		return "stuInfoUp";
	}
	
	@RequestMapping(value = "insertstu.do")
	public String insertform() throws Exception { 
		return "stujoin1"; 
		}
	
	@RequestMapping(value = "insertstuM.do")
	public String insertformM() throws Exception { 
		return "stujoin2"; 
	}
	
	@RequestMapping(value ="memberjoinstu.do") 
	public String insertStu(MultipartHttpServletRequest request) {
		StuDto dto = new StuDto();
		dto.setStu_name(request.getParameter("stu_name"));
		dto.setStu_birth(request.getParameter("stu_birth"));
		dto.setStu_gen(request.getParameter("stu_gen"));
		dto.setStu_coun(request.getParameter("stu_coun"));
		dto.setDept_nm(request.getParameter("dept_nm"));
		dto.setStu_year(Integer.parseInt(request.getParameter("stu_year")));
		dto.setStu_sem(request.getParameter("stu_sem"));
		dto.setStu_tel(request.getParameter("stu_tel"));
		dto.setStu_email(request.getParameter("stu_email"));
		dto.setStu_zip(request.getParameter("stu_zip"));
		dto.setStu_address(request.getParameter("stu_address"));
		
		
		//파일업로드
		MultipartFile mf=request.getFile("stu_path");
		String path=request.getRealPath("/resources/imgFile");
		String fileName=mf.getOriginalFilename();
		File uploadFile=new File(path+"//"+fileName);
		try {
			mf.transferTo(uploadFile);
		} catch(IllegalStateException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		dto.setStu_path(fileName);
		stu.insertStu(dto);
		
		return "stafflist/stujoin";
	}
	
	
	@GetMapping(value = "insertsta.do")
	public String insertform1() throws Exception { 
		return "stajoin"; 
		}
	
//	@RequestMapping(value ="memberjoinsta", method = RequestMethod.POST) 
//	public ModelAndView insertSta(StaffDto dto) { 
//		ModelAndView mav = new ModelAndView(); 
//		stu.insertSta(dto); 
//		mav.setViewName("stafflist/stajoin"); 
//		return mav; 
//		}// end memberJoinPro()
	
	@RequestMapping(value ="memberjoinsta") 
	public String insertSta(MultipartHttpServletRequest request) {
		StaffDto dto = new StaffDto();
		dto.setStaff_nm(request.getParameter("staff_nm"));
		dto.setStaff_birth(request.getParameter("staff_birth"));
		dto.setStaff_gen(request.getParameter("staff_gen"));
		dto.setStaff_coun(request.getParameter("staff_coun"));
		dto.setStaff_dept(request.getParameter("staff_dept"));
		dto.setStaff_tel(request.getParameter("staff_tel"));
		dto.setStaff_email(request.getParameter("staff_email"));
		dto.setStaff_zip(request.getParameter("staff_zip"));
		dto.setStaff_address(request.getParameter("staff_address"));
		
		
		
		//파일업로드
		MultipartFile mf=request.getFile("staff_path");
		String path=request.getRealPath("/resources/imgFileSta");
		String fileName=mf.getOriginalFilename();
		File uploadFile=new File(path+"//"+fileName);
		try {
			mf.transferTo(uploadFile);
		} catch(IllegalStateException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		dto.setStaff_path(fileName);
		stu.insertSta(dto);
		
		return "stafflist/stajoin";
	}
	
	
	
	
	
	
	@GetMapping(value = "insertpro.do")
	public String insertform2() throws Exception { 
		return "projoin1"; 
	}
	@GetMapping(value = "insertproM.do")
	public String insertform3() throws Exception { 
		return "projoin2"; 
	}
	
	
	@RequestMapping(value ="memberjoinpro") 
	public String insertPro(MultipartHttpServletRequest request) {
		ProDto dto = new ProDto();
		dto.setProf_nm(request.getParameter("prof_nm"));
		dto.setProf_birth(request.getParameter("prof_birth"));
		dto.setProf_gen(request.getParameter("prof_gen"));
		dto.setDept_nm(request.getParameter("dept_nm"));
		dto.setProf_coun(request.getParameter("prof_coun"));
		dto.setDept_cd(request.getParameter("dept_cd"));
		dto.setProf_tel(request.getParameter("prof_tel"));
		dto.setProf_email(request.getParameter("prof_email"));
		dto.setProf_zip(request.getParameter("prof_zip"));
		dto.setProf_address(request.getParameter("prof_address"));
		
		
		
		//파일업로드
		MultipartFile mf=request.getFile("prof_path");
		String path=request.getRealPath("/resources/imgFilePro");
		String fileName=mf.getOriginalFilename();
		File uploadFile=new File(path+"//"+fileName);
		try {
			mf.transferTo(uploadFile);
		} catch(IllegalStateException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		dto.setProf_path(fileName);
		stu.insertPro(dto);
		
		return "stafflist/projoin";
	}
	
//	@RequestMapping(value ="memberjoinpro", method = RequestMethod.POST) 
//	public ModelAndView insertPro(ProDto dto) { 
//		ModelAndView mav = new ModelAndView(); 
//		stu.insertPro(dto); 
//		mav.setViewName("stafflist/projoin"); 
//		return mav; 
//		}// end memberJoinPro()
	
	
}

