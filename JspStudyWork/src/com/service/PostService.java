package com.service;

import java.util.List;

import com.entity.Checks;
import com.entity.News;
import com.entity.Page;
import com.entity.Post;

public interface PostService {
//查询岗位
	List<Post> findPost(Page page);
//按条件查询岗位
	List<Post> findPostByCondition(String condition);
	//添加岗位
	boolean addPost(Post p);
	//删除岗位
	boolean delPost(String[] dels);
	//修改岗位
	boolean updPost(Post p);
	//添加职工时查询所有岗位
	List<Post> findPost2();
	//审核学生申请岗位
	boolean askPost(String[] dels);
	//学生申请岗位
	boolean ask(int pid, int uid);
	//查询审核信息
	List<Checks> findchecks();
	//查询所有消息
	List<News> findNews(String uid);

}
