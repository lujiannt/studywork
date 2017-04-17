package com.service;

import java.util.List;

import com.entity.Checks;
import com.entity.Page;
import com.entity.Clerk;
import com.entity.Post;

public interface ClerkService {
	// 验证登录
	public String findUser(Clerk user);

	// 添加职工
	public boolean addClerk(Clerk u);

	// 查询所有职工
	public List<Clerk> findClerk(Page page);

	// 按照条件查询职工
	public List<Clerk> findClerkByCondition(String condition);

	//删除职工
	public boolean delClerk(String[] dels);

	//修改职工信息
	public boolean updClerk(Clerk c);

	//修改密码
	public boolean updPwd(String uid, String pwd);

	//查询个人信息
	public List<Clerk> findMyInfo(String uid);

	//根据id查询职工信息
	public Clerk findClerkById(int cid);

	//查询匹配职工的岗位
	public List<Post> findRightPosts(int kind);

	//查询当前登录学生是否有岗位
	public boolean checkClerkIsCheked(int uid);

	//查询我的岗位
	public List<Clerk> findMyPost(String uid);
}
