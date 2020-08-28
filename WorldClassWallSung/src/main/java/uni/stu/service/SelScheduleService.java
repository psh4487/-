package uni.stu.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.stu.model.SelScheduleDto;

@Service
public class SelScheduleService{
	@Autowired
	SelScheduleDao ssd;
	
	public SelScheduleService() {}

	public List<SelScheduleDto> builName() {
		return ssd.builName();
	}
	
	public List<SelScheduleDto> subroomName(String buil_no) {
		Map<String, String> m = new HashMap<String, String>();
		m.put("buil_no", buil_no);
		return ssd.subroomName(m);
	}
	
	public List<SelScheduleDto> subroomList(String subroom_nm) {
		Map<String, String> m = new HashMap<String, String>();
		m.put("subroom_nm", subroom_nm);
		return ssd.subroomList(m);
	}
	
	public void setSsd(SelScheduleDao ssd) {
		this.ssd = ssd;
	}
}
