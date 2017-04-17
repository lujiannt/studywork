package com.entity;

public class Depart {
	private int id;//主键
	private String dno;//院系编号
	private String dname;
	private String dleader;
	private String dphone;
	private int dkind_id;//院系类别
    private String  dkind_name;//院系类别名
	
    
    
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDkind_name() {
		return dkind_name;
	}

	public void setDkind_name(String dkind_name) {
		this.dkind_name = dkind_name;
	}

	public String getDno() {
		return dno;
	}

	public void setDno(String dno) {
		this.dno = dno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}
    

	public String getDphone() {
		return dphone;
	}

	public void setDphone(String dphone) {
		this.dphone = dphone;
	}

	public String getDleader() {
		return dleader;
	}

	public void setDleader(String dleader) {
		this.dleader = dleader;
	}

	public int getDkind_id() {
		return dkind_id;
	}

	public void setDkind_id(int dkind_id) {
		this.dkind_id = dkind_id;
	}

}
