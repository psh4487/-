package uni.pro.service;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.pro.model.ReportDto;

public class ReportDao extends SqlSessionDaoSupport {

	public List <ReportDto>sublist(int prof_cd){
		return getSqlSession().selectList("report.sublist",prof_cd);
	}//苞格格废
	
	public List<ReportDto> reportall(String sub_cd){
		return  getSqlSession().selectList("report.reportall",sub_cd);		
	}//苞力格废

	public List<ReportDto> viewreport(ReportDto dto) {
		return getSqlSession().selectList("report.viewreport",dto);
	}// 惑技格废
	
	public List<ReportDto> downreport(ReportDto dto) throws Exception {  
	    return getSqlSession().selectList("report.down",dto);
	}
	
	public int reporteok(int  stu_no){
		return getSqlSession().update("report.ok", stu_no);
	}
	  
}
