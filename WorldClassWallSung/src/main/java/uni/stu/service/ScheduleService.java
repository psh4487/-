package uni.stu.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.stu.model.ScheduleDto;

@Service
public class ScheduleService{
	@Autowired
	ScheduleDao sd;
	
	public ScheduleService() {}

	public List<ScheduleDto> scheduleList(int stu_no) {
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("stu_no", stu_no);
		return sd.scheduleList(m);
	}
	
	public ScheduleDto scheduleName(int stu_no) {
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("stu_no", stu_no);
		return sd.scheduleName(m);
	}
	
	public void setSd(ScheduleDao sd) {
		this.sd = sd;
	}
}
