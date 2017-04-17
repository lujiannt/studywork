package com.serviceImpl;

import java.util.List;

import com.dao.PostDao;
import com.daoImpl.PostDaoImpl;
import com.entity.Checks;
import com.entity.News;
import com.entity.Page;
import com.entity.Post;
import com.service.PostService;

public class PostServiceImpl implements PostService{
PostDao pd = new PostDaoImpl();
	@Override
	public List<Post> findPost(Page page) {
		// TODO Auto-generated method stub
		return pd.findPost(page);
	}
	@Override
	public List<Post> findPostByCondition(String condition) {
		// TODO Auto-generated method stub
		return pd.findPostByCondition(condition);
	}
	@Override
	public boolean addPost(Post p) {
		// TODO Auto-generated method stub
		return pd.addPost(p);
	}
	@Override
	public boolean delPost(String[] dels) {
		// TODO Auto-generated method stub
		return pd.delPost(dels);
	}
	@Override
	public boolean updPost(Post p) {
		// TODO Auto-generated method stub
		return pd.updPost(p);
	}
	@Override
	public List<Post> findPost2() {
		// TODO Auto-generated method stub
		return pd.findPost2();
	}
	@Override
	public boolean askPost(String[] dels) {
		// TODO Auto-generated method stub
		return pd.askPost(dels);
	}
	@Override
	public boolean ask(int pid, int uid) {
		// TODO Auto-generated method stub
		return pd.ask(pid,uid);
	}
	@Override
	public List<Checks> findchecks() {
		// TODO Auto-generated method stub
		return pd.findchecks();
	}
	@Override
	public List<News> findNews(String uid) {
		// TODO Auto-generated method stub
		return pd.findNews(uid);
	}

}
