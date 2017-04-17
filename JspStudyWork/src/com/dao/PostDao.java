package com.dao;

import java.util.List;

import com.entity.Checks;
import com.entity.News;
import com.entity.Page;
import com.entity.Post;

public interface PostDao {

	List<Post> findPost(Page page);

	List<Post> findPostByCondition(String condition);

	boolean addPost(Post p);

	boolean delPost(String[] dels);

	boolean updPost(Post p);

	List<Post> findPost2();

	boolean askPost(String[] dels);

	boolean ask(int pid, int uid);

	List<Checks> findchecks();

	List<News> findNews(String uid);

}
