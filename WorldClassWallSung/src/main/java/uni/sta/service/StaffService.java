package uni.sta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.sta.model.StaffDto;

@Service
public class StaffService {
	@Autowired
	StaffDao dao;

	public void setDao(StaffDao dao) {
		this.dao = dao;
	}

	public List<StaffDto> selectDepts() {
		return dao.selectDepts();
	}

	public List<StaffDto> selectstaffList(String staff_dept) {
		return dao.selectstaffList(staff_dept);
	}
}
