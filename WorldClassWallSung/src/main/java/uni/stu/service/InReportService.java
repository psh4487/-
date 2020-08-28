package uni.stu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.*;
import uni.stu.model.InReportDto;

@Service
public class InReportService {
	InReportDao dao;
	
	@Autowired
	public void setDao(InReportDao dao) {
		this.dao = dao;
	}
	public List<InReportDto> sublist(){
		List<InReportDto> list = null;
		list = dao.list();
		return list;
	}
	public int insert(int stu_no,String sub_cd, MultipartFile file, String report_path, String report_nm) {
		InReportDto dto = new InReportDto();
		dto.setSub_cd(sub_cd);
		dto.setStu_no(stu_no);
		dto.setReport_file(file.getOriginalFilename());
		dto.setReport_path(report_path);
		dto.setReport_nm(report_nm);
		
		return dao.insertreport(dto);
	}
	public List<InReportDto> reportList(int stu_no){
		List<InReportDto> list = null;
		list = dao.list1(stu_no);
		return list;
	}
}
