package com.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class DataConnection {
   private static DataConnection conn=null;
   private Properties property = new Properties();
   
   private DataConnection() {
	   InputStream is = this.getClass().getResourceAsStream("/DataConnection.properties");
	   try {
		property.load(is);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
   }
   
   public static DataConnection getInstance() {
	   if(conn==null) {
		   conn=new DataConnection();
	   }
	   return conn;
   }
   
   public String getValue(String key) {
	   return property.getProperty(key);
   }
}
