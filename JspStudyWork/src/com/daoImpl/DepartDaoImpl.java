package com.daoImpl;

import java.util.List;

import com.dao.DepartDao;
import com.db.DButil;
import com.entity.Depart;
import com.entity.Page;

public class DepartDaoImpl implements DepartDao{
DButil db = new DButil();
	@Override
	public int addDepart(Depart depart) {
		// TODO Auto-generated method stub
		int a =0;
	    a=db.addDepart(depart);
		return a;
	}
	@Override
	public List<Depart> findDepart(Page page) {
		// TODO Auto-generated method stub
		return db.finDepart(page);
	}
	@Override
	public boolean updDepart(Depart depart) {
		// TODO Auto-generated method stub
		return  db.updDepart(depart);
	}
	@Override
	public boolean delDepart(String[] dels) {
		// TODO Auto-generated method stub
		return db.delDepart(dels);
	}
	@Override
	public List<Depart> findDepartByCondition(String condition) {
		// TODO Auto-generated method stub
		return db.findDepartByCondition(condition);
	}
	@Override
	public List<Depart> findDepart2() {
		// TODO Auto-generated method stub
		return db.findDepart2();
	}

}
