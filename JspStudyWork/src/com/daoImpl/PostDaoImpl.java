package com.daoImpl;

import java.util.List;

import com.dao.PostDao;
import com.db.DButil;
import com.entity.Checks;
import com.entity.News;
import com.entity.Page;
import com.entity.Post;
public class PostDaoImpl implements PostDao{
DButil db = new DButil();
	@Override
	public List<Post> findPost(Page page) {
		// TODO Auto-generated method stub
		return db.findPost(page);
	}
	@Override
	public List<Post> findPostByCondition(String condition) {
		// TODO Auto-generated method stub
		return db.findPostByCondition(condition);
	}
	@Override
	public boolean addPost(Post p) {
		// TODO Auto-generated method stub
		return db.addPost(p);
	}
	@Override
	public boolean delPost(String[] dels) {
		// TODO Auto-generated method stub
		return db.delPost(dels);
	}
	@Override
	public boolean updPost(Post p) {
		// TODO Auto-generated method stub
		return db.updPost(p);
	}
	@Override
	public List<Post> findPost2() {
		// TODO Auto-generated method stub
		return db.findPost2();
	}
	@Override
	public boolean askPost(String[] dels) {
		// TODO Auto-generated method stub
		return db.askPost(dels);
	}
	@Override
	public boolean ask(int pid, int uid) {
		// TODO Auto-generated method stub
		return db.ask(pid,uid);
	}
	@Override
	public List<Checks> findchecks() {
		// TODO Auto-generated method stub
		return db.findchecks();
	}
	@Override
	public List<News> findNews(String uid) {
		// TODO Auto-generated method stub
		return db.findNews(uid);
	}

}
