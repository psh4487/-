package uni.pro.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.pro.model.ReportDto;

@Service
public class ReportService {

@Autowired
	ReportDao dao;
public void setdao(ReportDao dao) {
	this.dao=dao;	
}
public List<ReportDto> sublist(int prof_cd){
	return  dao.sublist(prof_cd);
}

public List<ReportDto>reportall(String sub_cd){
		return dao.reportall(sub_cd);
}
public List<ReportDto> viewreport(int stu_no,String sub_cd) {
	ReportDto dto = new ReportDto();
	dto.setStu_no(stu_no);
	dto.setSub_cd(sub_cd);	
	List<ReportDto> list = dao.viewreport(dto); 	
	return list;
}
public List<Object> downreport(ReportDto dto) throws Exception {
    List<Object> reportFileList = new ArrayList<>();
    String report_file = null;
 // 설정한 Path에 파일 저장
    ReportDto report = new ReportDto();
    report.setReport_file(report_file);
    reportFileList.add(dao.downreport(dto));

    return reportFileList;
}
public  int reportok(int stu_no) {
return dao.reporteok(stu_no);
	


}
}

