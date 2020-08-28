package uni.pro.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.pro.model.SchedulProDto;


@Service
public class SchedulProService {
	@Autowired
	SchedulProDao dao;
public void setdao(SchedulProDao dao) {
	this.dao=dao;	
}
public List<SchedulProDto> proname(int prof_cd) {
	return dao.scheduleproList(prof_cd);
}

public List<SchedulProDto> schedulelist(int prof_cd) {
	return dao.sublist(prof_cd);
}
}
