package com.dao;

import java.util.List;

import com.entity.Depart;
import com.entity.Page;

public interface DepartDao {

	int addDepart(Depart depart);

	List<Depart> findDepart(Page page);

	boolean updDepart(Depart depart);

	boolean delDepart(String[] dels);

	List<Depart> findDepartByCondition(String condition);

	List<Depart> findDepart2();

}
