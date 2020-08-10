package uni.sta.service;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;
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
}
