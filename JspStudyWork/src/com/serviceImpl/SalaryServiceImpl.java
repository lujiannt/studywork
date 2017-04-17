package com.serviceImpl;

import java.util.List;

import com.dao.SalaryDao;
import com.daoImpl.SalaryDaoImpl;
import com.entity.Page;
import com.entity.Post;
import com.entity.Salary;
import com.service.SalaryService;

public class SalaryServiceImpl implements SalaryService {
SalaryDao sd = new SalaryDaoImpl();
	@Override
	public boolean addSalary(Salary s) {
		// TODO Auto-generated method stub
		return sd.addSalary(s);
	}
	@Override
	public List<Salary> findSalary(Page page) {
		// TODO Auto-generated method stub
		return sd.findSalary(page);
	}
	@Override
	public List<Salary> findSalaryByCondition(String condition) {
		// TODO Auto-generated method stub
		return sd.findSalaryByCondition(condition);
	}
	@Override
	public List<Salary> findOrderSalaryByCondition(Page page, String condition) {
		// TODO Auto-generated method stub
		return sd.findOrderSalaryByCondition(page,condition);
	}
	@Override
	public boolean delSalary(String[] dels) {
		// TODO Auto-generated method stub
		return sd.delSalary(dels);
	}
	@Override
	public boolean updateSalary(Salary s) {
		// TODO Auto-generated method stub
		return sd.updateSalary(s);
	}

}
