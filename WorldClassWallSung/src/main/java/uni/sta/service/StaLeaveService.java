package uni.sta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.sta.model.StaLeaveDto;

@Service
public class StaLeaveService {

	@Autowired
	StaLeaveDao dao;

	public void setDao(StaLeaveDao dao) {
		this.dao = dao;
	}
	
	public List<StaLeaveDto> selectLeaveList(){
		return dao.selectLeaveList();
	}
	
	
}
