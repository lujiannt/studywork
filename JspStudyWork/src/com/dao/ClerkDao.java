package com.dao;

import java.util.List;

import com.entity.Checks;
import com.entity.Page;
import com.entity.Clerk;
import com.entity.Post;

public interface ClerkDao {
	String findUser(Clerk user);

	boolean addClerk(Clerk u);

	List<Clerk> findClerk(Page page);

	List<Clerk> findClerkByCondition(String condition);

	boolean delClerk(String[] dels);

	boolean updClerk(Clerk c);

	boolean updPwd(String uid, String pwd);

	List<Clerk> findMyInfo(String uid);

	Clerk findClerkById(int cid);

	List<Post> findRightPosts(int kind);

	boolean checkClerkIsCheked(int uid);

	List<Clerk> findMyPost(String uid);
}
