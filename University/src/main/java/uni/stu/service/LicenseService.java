package uni.stu.service;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import uni.stu.model.LicenseDto;


@Service
public class LicenseService {
	LicenseDao dao;
	
	@Autowired
	public void setDao(LicenseDao dao) {
		this.dao = dao;
	}
	public List<LicenseDto> licenseList(int stu_no){
		List<LicenseDto> list = null;
		list = dao.list(stu_no);
		return list;
	}
	public int delete(int li_no,int stu_no) {
		LicenseDto dto = new LicenseDto();
		dto.setLi_no(li_no);
		dto.setStu_no(stu_no);
		return dao.delete(dto);
	}
	public int insert(String li_nm,String li_path, String li_date,int stu_no, MultipartFile file) {
		LicenseDto dto = new LicenseDto();
		dto.setLi_nm(li_nm);
		dto.setLi_path(li_path);
		dto.setLi_date(li_date);
		dto.setStu_no(stu_no);
		dto.setLi_file(file.getOriginalFilename());
		
		return dao.insert(dto);
	}
}
