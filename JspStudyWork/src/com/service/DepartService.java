package com.service;

import java.util.List;

import com.entity.Depart;
import com.entity.Page;

public interface DepartService {
    //添加院系
	int addDepart(Depart depart);
    //查询所有院系
	List<Depart> findDepart(Page page);
	//修改院系
	boolean updDepart(Depart depart);
	//删除院系
	boolean delDepart(String[] dels);
	//按照条件查询院系
	List<Depart> findDepartByCondition(String condition);
	//添加班级时候select下拉框查询所有院系
	List<Depart> findDepart2();

}
