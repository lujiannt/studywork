package com.service;

import java.util.List;

import com.entity.Page;
import com.entity.Post;
import com.entity.Salary;

public interface SalaryService {
	// 发放工资
	boolean addSalary(Salary s);

	// 查询工资报表
	List<Salary> findSalary(Page page);

	// 按照条件查询工资账单
	List<Salary> findSalaryByCondition(String condition);

	// 按照条件排序工资表
	List<Salary> findOrderSalaryByCondition(Page page, String condition);

	// 删除工资账单信息
	boolean delSalary(String[] dels);

	// 修改工资账单信息
	boolean updateSalary(Salary s);

}
