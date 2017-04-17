package com.dao;

import java.util.List;

import com.entity.Class1;
import com.entity.Page;

public interface ClassDao {

	boolean addClass(Class1 cla);

	List<Class1> findClass(Page page);

	List<Class1> findClassByCondition(String condition);

	boolean delClass(String[] dels);

	boolean updClass(Class1 class1);

	List<Class1> findClassByDeId(int id);

}
