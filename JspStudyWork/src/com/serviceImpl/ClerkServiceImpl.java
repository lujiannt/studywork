package com.serviceImpl;

import java.util.List;

import com.dao.ClerkDao;
import com.daoImpl.ClerkDaoImpl;
import com.entity.Checks;
import com.entity.Page;
import com.entity.Clerk;
import com.entity.Post;
import com.service.ClerkService;

public class ClerkServiceImpl implements ClerkService{
    ClerkDao userdao = new ClerkDaoImpl();
	@Override
	public String findUser(Clerk user) {
		// TODO Auto-generated method stub
		String flag = userdao.findUser(user);
		return flag;
	}
	@Override
	public boolean addClerk(Clerk u) {
		// TODO Auto-generated method stub
		return userdao.addClerk(u);
	}
	@Override
	public List<Clerk> findClerk(Page page) {
		// TODO Auto-generated method stub
		return userdao.findClerk(page);
	}
	@Override
	public List<Clerk> findClerkByCondition(String condition) {
		// TODO Auto-generated method stub
		return userdao.findClerkByCondition(condition);
	}
	@Override
	public boolean delClerk(String[] dels) {
		// TODO Auto-generated method stub
		return userdao.delClerk(dels);
	}
	@Override
	public boolean updClerk(Clerk c) {
		// TODO Auto-generated method stub
		return userdao.updClerk(c);
	}
	@Override
	public boolean updPwd(String uid, String pwd) {
		// TODO Auto-generated method stub
		return userdao.updPwd(uid,pwd);
	}
	@Override
	public List<Clerk> findMyInfo(String uid) {
		// TODO Auto-generated method stub
		return userdao.findMyInfo(uid);
	}
	@Override
	public Clerk findClerkById(int cid) {
		// TODO Auto-generated method stub
		return userdao.findClerkById(cid);
	}
	@Override
	public List<Post> findRightPosts(int kind) {
		// TODO Auto-generated method stub
		return userdao.findRightPosts(kind);
	}
	@Override
	public boolean checkClerkIsCheked(int uid) {
		// TODO Auto-generated method stub
		return userdao.checkClerkIsCheked(uid);
	}
	@Override
	public List<Clerk> findMyPost(String uid) {
		// TODO Auto-generated method stub
		return userdao.findMyPost(uid);
	}

}
