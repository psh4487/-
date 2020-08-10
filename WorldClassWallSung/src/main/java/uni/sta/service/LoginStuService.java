package uni.sta.service;

import javax.inject.Qualifier;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;
import uni.sta.model.StuDto;

@Service
public class LoginStuService {
	
	LoginStuDao dao;

	@Autowired
	public void setDao(LoginStuDao dao) {
		this.dao = dao;
	}
	
	public StuDto LoginStu(StuDto dto) { 
		return dao.LoginStu(dto);
	}
	
}
	
	

