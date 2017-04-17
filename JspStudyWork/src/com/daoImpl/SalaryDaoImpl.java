package com.daoImpl;

import java.util.List;

import com.dao.SalaryDao;
import com.db.DButil;
import com.entity.Page;
import com.entity.Post;
import com.entity.Salary;

public class SalaryDaoImpl implements SalaryDao {
DButil db = new DButil();
	@Override
	public boolean addSalary(Salary s) {
		// TODO Auto-generated method stub
		return db.addSalary(s);
	}
	@Override
	public List<Salary> findSalary(Page page) {
		// TODO Auto-generated method stub
		return db.findSalary(page);
	}
	@Override
	public List<Salary> findSalaryByCondition(String condition) {
		// TODO Auto-generated method stub
		return db.findSalaryByCondition(condition);
	}
	@Override
	public List<Salary> findOrderSalaryByCondition(Page page, String condition) {
		// TODO Auto-generated method stub
		return db.findOrderSalaryByCondition(page,condition);
	}
	@Override
	public boolean delSalary(String[] dels) {
		// TODO Auto-generated method stub
		return db.delSalary(dels);
	}
	@Override
	public boolean updateSalary(Salary s) {
		// TODO Auto-generated method stub
		return db.updateSalary(s);
	}

}
