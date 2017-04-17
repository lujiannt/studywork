package com.daoImpl;

import java.util.List;

import com.dao.OfficeDao;
import com.db.DButil;
import com.entity.Office;
import com.entity.Page;

public class OfficeDaoImpl implements OfficeDao{
DButil db = new DButil();
	@Override
	public List<Office> findOffice(Page page) {
		// TODO Auto-generated method stub
		return db.findOffice(page);
	}
	@Override
	public List<Office> findOfficeByCondition(String condition) {
		// TODO Auto-generated method stub
		return db.findOfficeByCondition(condition);
	}
	@Override
	public boolean addOffice(Office o) {
		// TODO Auto-generated method stub
		return db.addOffice(o);
	}
	@Override
	public boolean delOffice(String[] dels) {
		// TODO Auto-generated method stub
		return db.delOffice(dels);
	}
	@Override
	public boolean updOffice(Office o) {
		// TODO Auto-generated method stub
		return  db.updOffice(o);
	}
	@Override
	public List<Office> findOffice2() {
		// TODO Auto-generated method stub
		return db.findOffice2();
	}

}
