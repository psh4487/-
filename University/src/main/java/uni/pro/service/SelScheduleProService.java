package uni.pro.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.pro.model.SelScheduleProDto;


@Service
public class SelScheduleProService{
	@Autowired
	SelScheduleProDao ssd;
	
	public SelScheduleProService() {}

	public List<SelScheduleProDto> builName(int prof_cd) {
		return ssd.builName(prof_cd);
	}
	
	public List<SelScheduleProDto> subroomName(int sub_cd) {
		return ssd.subroomName(sub_cd);
	}
	
	public void setSsd(SelScheduleProDao ssd) {
		this.ssd = ssd;
	}
}
