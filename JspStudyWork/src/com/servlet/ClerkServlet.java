package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.db.DButil;
import com.entity.Checks;
import com.entity.Page;
import com.entity.Post;
import com.entity.Clerk;
import com.service.ClerkService;
import com.serviceImpl.ClerkServiceImpl;
import com.sun.org.apache.regexp.internal.recompile;

public class ClerkServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ClerkService userservice = new ClerkServiceImpl();
    DButil db = new DButil();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		String method = request.getParameter("method");
		if ("login".equals(method)) {
			findUser(request, response);
		} else if ("addClerk".equals(method)) {
			addClerk(request, response);
		} else if("findClerk".equals(method)) {
			findClerk(request, response);
		} else if("findClerkByCondition".equals(method)) {
			findClerkByCondition(request, response);
		} else if("delClerk".equals(method)) {
			delClerk(request, response);
		} else if("updClerk".equals(method)) {
			updClerk(request, response);
		} else if("register".equals(method)) {
			register(request, response);
		} else if("updPwd".equals(method)) {
			updPwd(request, response);
		} else if("findMyInfo".equals(method)) {
			findMyInfo(request, response);
		} else if("checkClerkIsCheked".equals(method)) {
			checkClerkIsCheked(request, response);
		} else if("findMyPost".endsWith(method)) {
			findMyPost(request, response);
		}
	}
	
	
	//查询我的岗位
	private void findMyPost(HttpServletRequest request,
			HttpServletResponse response) {
		String uid = request.getParameter("uid"); 
		List<Clerk> list = new ArrayList<Clerk>();

		list = userservice.findMyPost(uid);
		request.setAttribute("list", list);
	}

	//查询当前登录学生是否有岗位
	private void checkClerkIsCheked(HttpServletRequest request,
			HttpServletResponse response) {
		String uidStr = request.getParameter("uid");
		int uid = -1;
		if(uidStr!=null && uidStr!="") {
			uid = Integer.parseInt(uidStr);
		}
		boolean flag = userservice.checkClerkIsCheked(uid);
		String check = "no";
		if(flag) {
			check =  "yes";
		}
		request.setAttribute("check", check);
		
	}

	//查询个人信息
	private void findMyInfo(HttpServletRequest request,
			HttpServletResponse response) {
		String uid = request.getParameter("uid"); 
		List<Clerk> list = new ArrayList<Clerk>();

		list = userservice.findMyInfo(uid);
		request.setAttribute("list", list);
	}

	//修改密码
	private void updPwd(HttpServletRequest request, HttpServletResponse response) {
		String pwd = request.getParameter("newPwd2");
		String uid = request.getParameter("uid");
		
		System.out.println(pwd);
		boolean flag = userservice.updPwd(uid,pwd);
		
		try {
			if (flag) {
				response.sendRedirect("../student/updsuccess.jsp");

			} else {
				response.sendRedirect("../student/updfail.jsp");

			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	//学生注册账号
	private void register(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		String uid = request.getParameter("uid");
		String uname = new String(request.getParameter("uname").getBytes("ISO-8859-1"),"utf-8") ;
		String pwd = request.getParameter("pwd");
		String sex = new String(request.getParameter("sex").getBytes("ISO-8859-1"),"utf-8");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String depart = request.getParameter("class_did");
		String uclass = request.getParameter("uclass");
		String kindStr = request.getParameter("kind");
		String worktime = request.getParameter("worktime");
		String account = request.getParameter("account");
		String checkstatusStr = request.getParameter("checkstatus");
		String competence = request.getParameter("competence");
		
		int kind = Integer.parseInt(kindStr);
		int checkstatus = Integer.parseInt(checkstatusStr);
		
		
		Clerk c = new Clerk();
		c.setUid(uid);
		c.setUname(uname);
		c.setPwd(pwd);
		c.setSex(sex);
		c.setPhone(phone);
		c.setEmail(email);
		c.setDepart(depart);
		c.setUclass(uclass);
		c.setKind(kind);
		c.setWorktime(worktime);
		c.setAccount(account);
		c.setCheckstatus(checkstatus);
		c.setCompetence(competence);
		
		boolean flag = userservice.addClerk(c);
		try {
			if (flag) {
				response.sendRedirect("../registersuccess.jsp");

			} else {
				response.sendRedirect("../registerfail.jsp");

			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	//修改职工信息
	private void updClerk(HttpServletRequest request,
			HttpServletResponse response) {
		String idStr = request.getParameter("id");
		String uid = request.getParameter("uid");
		String uname = request.getParameter("uname");
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String depart = request.getParameter("depart");
		String uclass = request.getParameter("uclass");
		String upost = request.getParameter("upost");
		String worktime = request.getParameter("worktime");
		String kindStr = request.getParameter("kind");
		String account = request.getParameter("account");
		int id = 0;
		int kind = 0;
		if (idStr != null) {
			id = Integer.parseInt(idStr);
		}
		if (kindStr != null) {
			kind = Integer.parseInt(kindStr);
		}

		Clerk c = new Clerk();
		c.setId(id);
		c.setUid(uid);
		c.setUname(uname);
		c.setSex(sex);
		c.setPhone(phone);
		c.setEmail(email);
		c.setDepart(depart);
		c.setUclass(uclass);
		c.setUpost(upost);
		c.setWorktime(worktime);
		c.setKind(kind);
		c.setAccount(account);
		boolean flag = userservice.updClerk(c);
		try {
			if (flag) {
				response.sendRedirect("../clerk/updsuccess.jsp");

			} else {
				response.sendRedirect("../clerk/updfail.jsp");

			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//删除职工
	private void delClerk(HttpServletRequest request,
			HttpServletResponse response) {

		String del = request.getParameter("dels");
		String[] dels = del.split(",");

		boolean flag = userservice.delClerk(dels);
		try {
			if (flag) {
				response.sendRedirect("../clerk/delsuccess.jsp");
			} else {
				response.sendRedirect("../clerk/delfail.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 根据条件查询勤工俭学学生信息
	private void findClerkByCondition(HttpServletRequest request,
			HttpServletResponse response) {
		String condition = request.getParameter("condition");
		List<Clerk> list = new ArrayList<Clerk>();
		list = userservice.findClerkByCondition(condition);
		request.setAttribute("list", list);
	}

	//查询所有勤工俭学人员
	private void findClerk(HttpServletRequest request,
			HttpServletResponse response) {
		List<Clerk> list = new ArrayList<Clerk>();
		String pageIndexStr = request.getParameter("pageIndex");
		int pageIndex = Integer.parseInt(pageIndexStr);
		Page page = new Page();
		// 查询总页数
		int num = db.checkTotalClerkPages();
		page.setDatas(num);
		page.setPageIndex(pageIndex);
		page.setCount();

		list = userservice.findClerk(page);
		request.setAttribute("list", list);
		request.setAttribute("page", page);

	}

	// 添加勤工学生
	private void addClerk(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String idStr = request.getParameter("id");
		String uid = request.getParameter("uid");
		String uname = request.getParameter("uname");
		String sex = request.getParameter("sex");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String depart = request.getParameter("depart");
		String uclass = request.getParameter("uclass");
		String upost = request.getParameter("upost");
		String worktime = request.getParameter("worktime");
		String kindStr = request.getParameter("kind");
		String account = request.getParameter("account");
		int id = 0;
		int kind = 0;
		if (idStr != null) {
			id = Integer.parseInt(idStr);
		}
		if (kindStr != null) {
			kind = Integer.parseInt(kindStr);
		}

		Clerk c = new Clerk();
		c.setId(id);
		c.setUid(uid);
		c.setUname(uname);
		c.setSex(sex);
		c.setPhone(phone);
		c.setEmail(email);
		c.setDepart(depart);
		c.setUclass(uclass);
		c.setUpost(upost);
		c.setWorktime(worktime);
		c.setKind(kind);
		c.setAccount(account);
		c.setCheckstatus(1);
		c.setPwd("123");
		boolean flag = userservice.addClerk(c);
		try {
			if (flag) {
				response.sendRedirect("../clerk/addsuccess.jsp");

			} else {
				response.sendRedirect("../clerk/addfail.jsp");

			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 用户登录
	private String findUser(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		String flag = "";
		//重构字符串，防止中文乱码
		String uidStr =new String(request.getParameter("uid").getBytes("ISO-8859-1"),"utf-8") ;
		String pwd = request.getParameter("pwd");
		String competence = request.getParameter("competence");
		if (uidStr != null && pwd != null) {
			Clerk user = new Clerk();
			user.setUname(uidStr);
			user.setPwd(pwd);
			user.setCompetence(competence);
			flag = userservice.findUser(user);
			user.setUid(flag);
			try {
				HttpSession session = request.getSession();
				if (flag.equals("")) {
					session.setAttribute("msg", "账户名、密码或身份错误");
					response.sendRedirect("../login.jsp");
				} else {
					session.setAttribute("msg", "");
					session.setAttribute("loginUser", user);
					if(competence.equals("1")) {
						response.sendRedirect("../newPage/index.jsp");
					}else {
						response.sendRedirect("../student/index.jsp");
					}
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}

}
