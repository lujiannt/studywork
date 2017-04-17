package com.serviceImpl;

import java.util.List;

import com.dao.DepartDao;
import com.daoImpl.DepartDaoImpl;
import com.entity.Depart;
import com.entity.Page;
import com.service.DepartService;

public class DepartServiceImpl implements DepartService{
    DepartDao dd = new DepartDaoImpl();
	@Override
	public int addDepart(Depart depart) {
		// TODO Auto-generated method stub
		int a=0;
		a = dd.addDepart(depart);
		return a;
	}
	@Override
	public List<Depart> findDepart(Page page) {
		// TODO Auto-generated method stub
		return dd.findDepart(page);
	}
	@Override
	public boolean updDepart(Depart depart) {
		// TODO Auto-generated method stub
		return dd.updDepart(depart);
	}
	@Override
	public boolean delDepart(String[] dels) {
		// TODO Auto-generated method stub
		return dd.delDepart(dels);
	}
	@Override
	public List<Depart> findDepartByCondition(String condition) {
		// TODO Auto-generated method stub
		return dd.findDepartByCondition(condition);
	}
	@Override
	public List<Depart> findDepart2() {
		// TODO Auto-generated method stub
		return dd.findDepart2();
	}

}
