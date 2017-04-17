package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DButil;
import com.entity.Checks;
import com.entity.News;
import com.entity.Office;
import com.entity.Page;
import com.entity.Post;
import com.service.PostService;
import com.serviceImpl.PostServiceImpl;

public class PostServlet extends HttpServlet {
	PostService postservice = new PostServiceImpl();
	DButil db = new DButil();

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String method = request.getParameter("method");
		if ("findPost".equals(method)) {
			findPost(request, response);
		} else if ("findPostByCondition".equals(method)) {
			findPostByCondition(request, response);
		} else if ("addPost".equals(method)) {
			addPost(request, response);
		} else if ("delPost".equals(method)) {
			delPost(request, response);
		} else if ("updPost".equals(method)) {
			updPost(request, response);
		} else if("findPost2".equals(method)) {
			findPost2(request, response);
		} else if("askPost".equals(method)) {
			askPost(request, response);
		} else if("ask".equals(method)) {
			ask(request, response);
		} else if("showChecks".equals(method)) {
			showChecks(request, response);
		} else if("showNews".equals(method)) {
			showNews(request, response);
		}
	}
	
	//显示消息
	private void showNews(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String uid = request.getParameter("uid");
		List<News> list = new ArrayList<News>();

		list = postservice.findNews(uid);
		request.setAttribute("list", list);
	}

	//查询申请信息
	private void showChecks(HttpServletRequest request,
			HttpServletResponse response) {
		List<Checks> list = new ArrayList<Checks>();

		list = postservice.findchecks();
		request.setAttribute("list", list);
		
	}

	//学生发出申请岗位
	private void ask(HttpServletRequest request, HttpServletResponse response) {
		
		int uid = Integer.parseInt(request.getParameter("uid"));
		String del = request.getParameter("dels");
		String[] dels = del.split(",");
		int pid = Integer.parseInt(dels[0]);
		
		boolean flag = postservice.ask(pid,uid);
		
		try {
			if (flag) {
				response.sendRedirect("../post/allowsuccess.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	//管理员同意学生申请岗位
    private void askPost(HttpServletRequest request,
			HttpServletResponse response) {

		String del = request.getParameter("dels");
		System.out.println(del);
		String[] dels = del.split(",");
		
		boolean flag = postservice.askPost(dels);
		
		try {
			if (flag) {
				response.sendRedirect("../post/asksuccess.jsp");
			} else {
				response.sendRedirect("../post/askfail.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//添加职工的时候查询所有岗位
	private void findPost2(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		List<Post> list = new ArrayList<Post>();

		list = postservice.findPost2();
		request.setAttribute("findPost2list", list);
	}

	// 修改岗位
	private void updPost(HttpServletRequest request,
			HttpServletResponse response) {
		String pidStr = request.getParameter("pid");
		String pname = request.getParameter("pname");
		String pleadername = request.getParameter("pleadername");
		String pleaderphone = request.getParameter("pleaderphone");
		String pcountStr = request.getParameter("pcount");
		String pcount2Str = request.getParameter("pcount2");
		String p_oidStr = request.getParameter("p_oid");
		int pid = -1;
		int p_oid = -1;
		int pcount = 0;
		int pcount2 = 0;
		if (pidStr != null) {
			pid = Integer.parseInt(pidStr);
		}
		if (p_oidStr != null) {
			p_oid = Integer.parseInt(p_oidStr);
		}
		if (pcountStr != null) {
			pcount = Integer.parseInt(pcountStr);
		}
		if (pcount2Str != null) {
			pcount2 = Integer.parseInt(pcount2Str);
		}
		Post p = new Post();
		p.setPid(pid);
		p.setPname(pname);
		p.setPleadername(pleadername);
		p.setPleaderphone(pleaderphone);
		p.setPcount(pcount);
		p.setPcount2(pcount2);
		p.setP_oid(p_oid);
		boolean flag = postservice.updPost(p);
		try {
			if (flag) {
				response.sendRedirect("../post/updsuccess.jsp");
			} else {
				response.sendRedirect("../post/updfail.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 删除岗位
	private void delPost(HttpServletRequest request,
			HttpServletResponse response) {

		String del = request.getParameter("dels");
		String[] dels = del.split(",");

		boolean flag = postservice.delPost(dels);
		try {
			if (flag) {
				response.sendRedirect("../post/delsuccess.jsp");
			} else {
				response.sendRedirect("../post/delfail.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	// 添加岗位
	private void addPost(HttpServletRequest request,
			HttpServletResponse response) {
		int p_oid = 0;
		int pcount = 0;
		int pcount2 = 0;
		
		String pname = request.getParameter("pname");
		String pleadername = request.getParameter("pleadername");
		String pleaderphone = request.getParameter("pleaderphone");
		String pcountStr = request.getParameter("pcount");
		String pcount2Str = request.getParameter("pcount2");
		String p_oidStr = request.getParameter("p_oid");
		int kind = Integer.parseInt(request.getParameter("kind"));
		
		Post p = new Post();
		if (p_oidStr != null) {
			p_oid = Integer.parseInt(p_oidStr);
		}
		if (pcountStr != null) {
			pcount = Integer.parseInt(pcountStr);
		}
		if (pcount2Str != null) {
			pcount2 = Integer.parseInt(pcount2Str);
		}
		p.setPname(pname);
		p.setPleadername(pleadername);
		p.setPleaderphone(pleaderphone);
		p.setPcount(pcount);
		p.setPcount2(pcount2);
		p.setP_oid(p_oid);
		p.setKind(kind);
		boolean flag = postservice.addPost(p);
		try {
			if (flag) {
				response.sendRedirect("../post/addsuccess.jsp");
			} else {
				response.sendRedirect("../post/addfail.jsp");

			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 按条件查询岗位
	private void findPostByCondition(HttpServletRequest request,
			HttpServletResponse response) {
		String condition = request.getParameter("condition");
		List<Post> list = new ArrayList<Post>();
		list = postservice.findPostByCondition(condition);
		request.setAttribute("list", list);
	}

	// 查找所有岗位
	private void findPost(HttpServletRequest request,
			HttpServletResponse response) {

		List<Post> list = new ArrayList<Post>();
		String pageIndexStr = request.getParameter("pageIndex");
		int pageIndex = Integer.parseInt(pageIndexStr);
		Page page = new Page();
		// 查询总页数
		int num = db.checkTotalPostPages();
		page.setDatas(num);
		page.setPageIndex(pageIndex);
		page.setCount();

		list = postservice.findPost(page);
		request.setAttribute("list", list);
		request.setAttribute("page", page);

	}

}
