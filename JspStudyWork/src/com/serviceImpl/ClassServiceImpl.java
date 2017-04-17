package com.serviceImpl;

import java.util.List;

import com.dao.ClassDao;
import com.daoImpl.ClassDaoImpl;
import com.entity.Class1;
import com.entity.Page;
import com.service.ClassService;

public class ClassServiceImpl implements ClassService{
ClassDao cd = new ClassDaoImpl();
	@Override
	public boolean addClass(Class1 cla) {
		// TODO Auto-generated method stub
		return cd.addClass(cla);
	}
	@Override
	public List<Class1> findClass(Page page) {
		// TODO Auto-generated method stub
		return cd.findClass(page);
	}
	@Override
	public List<Class1> findClassByCondition(String condition) {
		// TODO Auto-generated method stub
		return cd.findClassByCondition(condition);
	}
	@Override
	public boolean delClass(String[] dels) {
		// TODO Auto-generated method stub
		return cd.delClass(dels);
	}
	@Override
	public boolean updClass(Class1 class1) {
		// TODO Auto-generated method stub
		return cd.updClass(class1);
	}
	@Override
	public List<Class1> findClassByDeId(int id) {
		// TODO Auto-generated method stub
		return cd.findClassByDeId(id);
	}

}
