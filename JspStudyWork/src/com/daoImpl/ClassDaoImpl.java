package com.daoImpl;

import java.util.List;

import com.dao.ClassDao;
import com.db.DButil;
import com.entity.Class1;
import com.entity.Page;

public class ClassDaoImpl implements ClassDao{
DButil db = new DButil();
	@Override
	public boolean addClass(Class1 cla) {
		// TODO Auto-generated method stub
		return db.addClass(cla);
	}
	@Override
	public List<Class1> findClass(Page page) {
		// TODO Auto-generated method stub
		return db.findClass(page);
	}
	@Override
	public List<Class1> findClassByCondition(String condition) {
		// TODO Auto-generated method stub
		return db.findClassByCondition(condition);
	}
	@Override
	public boolean delClass(String[] dels) {
		// TODO Auto-generated method stub
		return db.delClass(dels);
	}
	@Override
	public boolean updClass(Class1 class1) {
		// TODO Auto-generated method stub
		return db.updClass(class1);
	}
	@Override
	public List<Class1> findClassByDeId(int id) {
		// TODO Auto-generated method stub
		return db.findClassByDeId(id);
	}

}
