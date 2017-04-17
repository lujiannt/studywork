package com.entity;

public class Checks {
	
 private int chid;
 private int pid;
 private String pname;
 private int uid;
 private String uname;
 private String uclass;
 private String depart; 
 private int kind;
 
 
 
public String getUclass() {
	return uclass;
}
public void setUclass(String uclass) {
	this.uclass = uclass;
}
public String getDepart() {
	return depart;
}
public void setDepart(String depart) {
	this.depart = depart;
}
public int getChid() {
	return chid;
}
public void setChid(int chid) {
	this.chid = chid;
}
public int getUid() {
	return uid;
}
public void setUid(int uid) {
	this.uid = uid;
}
public String getUname() {
	return uname;
}
public void setUname(String uname) {
	this.uname = uname;
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
public int getKind() {
	return kind;
}
public void setKind(int kind) {
	this.kind = kind;
	}

}
