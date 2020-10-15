package uni.sta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.sta.model.ProDto;
import uni.sta.model.StaffDto;
import uni.sta.model.StuDeptDto;
import uni.sta.model.StuDto;

@Service
public class StuInsertService {
	@Autowired
	StuInsertDao dao;

	public void setDao(StuInsertDao dao) {
		this.dao = dao;
	}

	public void insertStu(StuDto dto) {
		dao.insertStu(dto);
	}

	public void insertSta(StaffDto dto) {
		dao.insertSta(dto);
	}

	public void insertPro(ProDto dto) {
		dao.insertPro(dto);
	}

	public List<StuDeptDto> selectStuDeptList() {
		return dao.selectStuDeptList();
	}

}
