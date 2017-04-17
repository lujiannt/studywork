package com.entity;

public class Post {
	private int pid;
	private String pname;
	private String pleadername;
	private String pleaderphone;
	private int pcount;//实际人数
	private int pcount2;//最大人数
	private int p_oid;//所属科室
	private String p_oname;//所属科室
	private int p_did;//所属院系
	private String p_dname;//所属院系
	private int kind;//所属类别
	
	
	public int getPcount2() {
		return pcount2;
	}

	public void setPcount2(int pcount2) {
		this.pcount2 = pcount2;
	}

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public int getPcount() {
		return pcount;
	}

	public void setPcount(int pcount) {
		this.pcount = pcount;
	}


	public int getP_oid() {
		return p_oid;
	}

	public void setP_oid(int p_oid) {
		this.p_oid = p_oid;
	}

	public String getP_oname() {
		return p_oname;
	}

	public void setP_oname(String p_oname) {
		this.p_oname = p_oname;
	}

	public String getP_dname() {
		return p_dname;
	}

	public void setP_dname(String p_dname) {
		this.p_dname = p_dname;
	}

	public String getPleadername() {
		return pleadername;
	}

	public void setPleadername(String pleadername) {
		this.pleadername = pleadername;
	}

	public String getPleaderphone() {
		return pleaderphone;
	}

	public void setPleaderphone(String pleaderphone) {
		this.pleaderphone = pleaderphone;
	}

	public int getP_did() {
		return p_did;
	}

	public void setP_did(int p_did) {
		this.p_did = p_did;
	}

    	
	
	

}
