package com.serviceImpl;

import java.util.List;

import com.dao.OfficeDao;
import com.daoImpl.OfficeDaoImpl;
import com.entity.Depart;
import com.entity.Office;
import com.entity.Page;
import com.service.OfficeService;

public class OfficeServiceImpl implements OfficeService{
OfficeDao od = new   OfficeDaoImpl();
	@Override
	public List<Office> findOffice(Page page) {
		// TODO Auto-generated method stub
		return od.findOffice(page);
	}
	@Override
	public List<Office> findOfficeByCondition(String condition) {
		// TODO Auto-generated method stub
		return od.findOfficeByCondition(condition);
	}
	@Override
	public boolean addOffice(Office o) {
		// TODO Auto-generated method stub
		return od.addOffice(o);
	}
	@Override
	public boolean delOffice(String[] dels) {
		// TODO Auto-generated method stub
		return od.delOffice(dels);
	}
	@Override
	public boolean updOffice(Office o) {
		// TODO Auto-generated method stub
		return od.updOffice(o);
	}
	@Override
	public List<Office> findOffice2() {
		// TODO Auto-generated method stub
		return od.findOffice2();
	}

}
