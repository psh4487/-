package uni.stu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import uni.stu.model.ServiceDto;

@Service
public class ServiceService {
	ServiceDao dao;
	@Autowired
	public void setDao(ServiceDao dao) {
		this.dao = dao;
	}
	public List<ServiceDto> serviceList(int stu_no){
		List<ServiceDto> list = null;
		list = dao.list(stu_no);
		return list;
	}
	public int delete(int ser_no,int stu_no) {
		ServiceDto dto = new ServiceDto();
		dto.setSer_no(ser_no);
		dto.setStu_no(stu_no);
		return dao.delete(dto);
	}
	public int insert(String ser_start, String ser_finish,String ser_con, int ser_time, String ser_path,int stu_no, MultipartFile file) {
		ServiceDto dto = new ServiceDto();
		dto.setSer_start(ser_start);
		dto.setSer_finish(ser_finish);
		dto.setSer_con(ser_con);
		dto.setSer_time(ser_time);
		dto.setSer_path(ser_path);
		dto.setStu_no(stu_no);
		dto.setSer_file(file.getOriginalFilename());
		return dao.insert(dto);
	}
	
	 
		
		
}
