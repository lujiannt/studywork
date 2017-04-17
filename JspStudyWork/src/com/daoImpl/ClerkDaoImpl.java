package com.daoImpl;

import java.util.List;

import com.dao.ClerkDao;
import com.db.DButil;
import com.entity.Checks;
import com.entity.Page;
import com.entity.Clerk;
import com.entity.Post;

public class ClerkDaoImpl implements ClerkDao{
    DButil db = new DButil();
	@Override
	public String findUser(Clerk user) {
        String flag = db.findUser(user); 
		return flag;
	}
	@Override
	public boolean addClerk(Clerk u) {
		// TODO Auto-generated method stub
		return db.addClerk(u);
	}
	@Override
	public List<Clerk> findClerk(Page page) {
		// TODO Auto-generated method stub
		return db.findClerk(page);
	}
	@Override
	public List<Clerk> findClerkByCondition(String condition) {
		// TODO Auto-generated method stub
		return db.findClerkByCondition(condition);
	}
	@Override
	public boolean delClerk(String[] dels) {
		// TODO Auto-generated method stub
		return db.delClerk(dels);
	}
	@Override
	public boolean updClerk(Clerk c) {
		// TODO Auto-generated method stub
		return db.updClerk(c);
	}
	@Override
	public boolean updPwd(String uid, String pwd) {
		// TODO Auto-generated method stub
		return db.updPwd(uid,pwd);
	}
	@Override
	public List<Clerk> findMyInfo(String uid) {
		// TODO Auto-generated method stub
		return db.findMyInfo(uid);
	}
	@Override
	public Clerk findClerkById(int cid) {
		// TODO Auto-generated method stub
		return db.findClerkById(cid);
	}
	@Override
	public List<Post> findRightPosts(int kind) {
		// TODO Auto-generated method stub
		return db.findRightPosts(kind);
	}
	@Override
	public boolean checkClerkIsCheked(int uid) {
		// TODO Auto-generated method stub
		return db.checkClerkIsCheked(uid);
	}
	@Override
	public List<Clerk> findMyPost(String uid) {
		// TODO Auto-generated method stub
		return db.findMyPost(uid);
	}

}
