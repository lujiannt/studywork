package com.service;

import java.util.List;

import com.entity.Depart;
import com.entity.Office;
import com.entity.Page;

public interface OfficeService {
//查询所有科室
	List<Office> findOffice(Page page);
//按照条件查询科室
	List<Office> findOfficeByCondition(String condition);
	//添加科室
	boolean addOffice(Office o);
	//删除科室
	boolean delOffice(String[] dels);
	//修改科室
	boolean updOffice(Office o);
	//添加岗位时查询所有科室
	List<Office> findOffice2();

}
