package uni.stu.service;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import uni.stu.model.InReportDto;
import java.util.*;
public class InReportDao extends SqlSessionDaoSupport{
	public List<InReportDto> list(){
		return getSqlSession().selectList("student.selectDept_tb");
	}
	public int insertreport(InReportDto dto) {
		return getSqlSession().insert("student.insertReport_tb", dto);
	}
	public List<InReportDto> list1(int stu_no){
		return getSqlSession().selectList("student.selectReport_tb",stu_no);
	}
}
