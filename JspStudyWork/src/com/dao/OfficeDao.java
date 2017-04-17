package com.dao;

import java.util.List;

import com.entity.Office;
import com.entity.Page;

public interface OfficeDao {

	List<Office> findOffice(Page page);

	List<Office> findOfficeByCondition(String condition);

	boolean addOffice(Office o);

	boolean delOffice(String[] dels);

	boolean updOffice(Office o);

	List<Office> findOffice2();

}
