package com.test;

import com.db.DButil;

public class Test1 {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
        DButil db = new DButil();
        System.out.println(db.getConn());
        db.closeConn();
	}

}
