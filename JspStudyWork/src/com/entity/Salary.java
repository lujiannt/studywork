package com.entity;

public class Salary {
	private int sid;
	private String uid;
	private String uname;
	private String account;
	private int salary;
    //预定工作时间  
	private String worktime1;
	//实际工作时间
	private String worktime2;
	private String post;
	private int s_oid;
	private String s_oname;

	
	
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getWorktime1() {
		return worktime1;
	}

	public void setWorktime1(String worktime1) {
		this.worktime1 = worktime1;
	}

	public String getWorktime2() {
		return worktime2;
	}

	public void setWorktime2(String worktime2) {
		this.worktime2 = worktime2;
	}


	public int getS_oid() {
		return s_oid;
	}

	public void setS_oid(int s_oid) {
		this.s_oid = s_oid;
	}

	public String getS_oname() {
		return s_oname;
	}

	public void setS_oname(String s_oname) {
		this.s_oname = s_oname;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}
    
	
}
