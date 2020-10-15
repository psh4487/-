package uni.stu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

import uni.stu.model.ApplyDownDto;
import uni.stu.model.ApplyDto;
import uni.stu.model.MajorDto;

@Service
public class MajorService {
	MajorDao dao;
	ApplyDto dto;
	
	@Autowired
	public void setDao(MajorDao dao) {
		this.dao = dao;
	}
	public List<Map<String,Object>> cultureList(String isu){		
		return dao.cultureList(isu);
	}
	public MajorDto selectDept() {
		return dao.selectDept();
	}
	public int insert(int sub_cd,int stu_no) { 
		ApplyDto dto = new ApplyDto();
		dto.setSub_cd(sub_cd);
		dto.setStu_no(stu_no);
		return dao.insert(dto);
	}
	public List<ApplyDto> selectApply(int stu_no){
		List<ApplyDto> list = null;
		list = dao.applyList(stu_no);
		return list;
	}
	public int delete(int sub_cd,int stu_no) {
		ApplyDto dto = new ApplyDto();
		dto.setSub_cd(sub_cd);
		dto.setStu_no(stu_no);
		return dao.delete(dto);
	}
	public int update(int sub_cd,int stu_no) {
		ApplyDto dto = new ApplyDto();
		dto.setSub_cd(sub_cd);
		dto.setStu_no(stu_no);
		return dao.update(dto);
		
	}
	public int update1(int sub_cd,int stu_no) {
		ApplyDto dto = new ApplyDto();
		dto.setSub_cd(sub_cd);
		dto.setStu_no(stu_no);
		return dao.update1(dto);
	}
	public int score(int stu_no) {
		return dao.score(stu_no);
	}
	
	
}
