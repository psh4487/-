package uni.pro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.pro.model.TestDto;


@Service
public class TestService {
	@Autowired
	TestDao dao;

	public void setDao(TestDao dao) {
		this.dao = dao;
	}
	
	public void updateTest(TestDto dto){
		dao.updateTest(dto);
	}
	public List<TestDto> selData(int prof_cd){
		return dao.selData(prof_cd);
	}
}