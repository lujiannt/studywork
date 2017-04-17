package com.dao;

import java.util.List;

import com.entity.Page;
import com.entity.Post;
import com.entity.Salary;

public interface SalaryDao {

	boolean addSalary(Salary s);

	List<Salary> findSalary(Page page);

	List<Salary> findSalaryByCondition(String condition);

	List<Salary> findOrderSalaryByCondition(Page page, String condition);

	boolean delSalary(String[] dels);

	boolean updateSalary(Salary s);

}
