package com.service;

import java.util.List;

import com.entity.Class1;
import com.entity.Page;

public interface ClassService {
//添加班级
	boolean addClass(Class1 cla);
//查询班级
	List<Class1> findClass(Page page);
//按照条件查询班级	
	List<Class1> findClassByCondition(String condition);
//删除班级	
	boolean delClass(String[] dels);
//修改班级	
	boolean updClass(Class1 class1);
//查询该院系下面的班级	
	List<Class1> findClassByDeId(int id);
  
}
