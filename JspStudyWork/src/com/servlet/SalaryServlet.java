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
import com.entity.Page;
import com.entity.Post;
import com.entity.Salary;
import com.service.SalaryService;
import com.serviceImpl.SalaryServiceImpl;

public class SalaryServlet extends HttpServlet {
	SalaryService ss = new SalaryServiceImpl();
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
		if ("addSalary".equals(method)) {
			addSalary(request, response);
		} else if ("findSalary".equals(method)) {
			findSalary(request, response);
		} else if("findSalaryByCondition".equals(method)) {
			findSalaryByCondition(request, response);
		} else if("findOrderSalaryByCondition".equals(method)) {
			findOrderSalaryByCondition(request, response);
		} else if("delSalary".equals(method)) {
			delSalary(request, response);
		} else if("updSalary".equals(method)) {
			updSalary(request, response);
		}
	}
	
	//修改工资账单
	private void updSalary(HttpServletRequest request,
			HttpServletResponse response) {
		String sidStr = request.getParameter("sid");
		String uid = request.getParameter("uid");
		String uname = request.getParameter("uname");
		String post = request.getParameter("post");
		String s_oidStr = request.getParameter("s_oid");
		String worktime1 = request.getParameter("worktime1");
		String worktime2 = request.getParameter("worktime2");
		String account = request.getParameter("account");
		String salaryStr = request.getParameter("salary");
		int salary = 0;
		int sid = 0;
		int s_oid = 0;
		if (salaryStr != null) {
			salary = Integer.parseInt(salaryStr);
		}
		if (sidStr != null) {
			sid = Integer.parseInt(sidStr);
		}
		if (s_oidStr != null) {
			s_oid = Integer.parseInt(s_oidStr);
		}
		Salary s = new Salary();
		s.setUid(uid);
		s.setUname(uname);
		s.setWorktime1(worktime1);
		s.setWorktime2(worktime2);
		s.setPost(post);
		s.setSalary(salary);
		s.setAccount(account);
		s.setS_oid(s_oid);
		s.setSid(sid);
		boolean flag = ss.updateSalary(s);
		try {
			if (flag) {
				response.sendRedirect("../salary/updatesuccess.jsp");
			} else {
				response.sendRedirect("../salary/updfail.jsp");

			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//账单的删除
	private void delSalary(HttpServletRequest request,
			HttpServletResponse response) {

		String del = request.getParameter("dels");
		String[] dels = del.split(",");
		boolean flag = ss.delSalary(dels);
		try {
			if (flag) {
				response.sendRedirect("../salary/delsuccess.jsp");
			} else {
				response.sendRedirect("../salary/delfail.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	//按照条件排序工资表
    private void findOrderSalaryByCondition(HttpServletRequest request,
			HttpServletResponse response) {
    	List<Salary> list = new ArrayList<Salary>();
		String pageIndexStr = request.getParameter("pageIndex");
		String condition = request.getParameter("condition");
		int pageIndex = Integer.parseInt(pageIndexStr);
		Page page = new Page();
		// 查询总条数
		int num = db.checkTotalSalaryPages();
		page.setDatas(num);
		page.setPageIndex(pageIndex);
		page.setCount();

		list = ss.findOrderSalaryByCondition(page,condition);
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		request.setAttribute("condition", condition);
	}

	//按照条件查询工资
	private void findSalaryByCondition(HttpServletRequest request,
			HttpServletResponse response) {
		String condition = request.getParameter("condition");
		List<Salary> list = new ArrayList<Salary>();
		list = ss.findSalaryByCondition(condition);
		request.setAttribute("list", list);		
	}

	// 查询工资报表
	private void findSalary(HttpServletRequest request,
			HttpServletResponse response) {

		List<Salary> list = new ArrayList<Salary>();
		String pageIndexStr = request.getParameter("pageIndex");
		int pageIndex = Integer.parseInt(pageIndexStr);
		Page page = new Page();
		// 查询总条数
		int num = db.checkTotalSalaryPages();
		page.setDatas(num);
		page.setPageIndex(pageIndex);
		page.setCount();

		list = ss.findSalary(page);
		request.setAttribute("list", list);
		request.setAttribute("page", page);
	}

	// 发放工资
	private void addSalary(HttpServletRequest request,
			HttpServletResponse response) {
		String uid = request.getParameter("uid");
		String uname = request.getParameter("uname");
		String worktime1 = request.getParameter("worktime1");
		String worktime2 = request.getParameter("worktime2");
		String post = request.getParameter("post");
		String salaryStr = request.getParameter("salary");
		String account = request.getParameter("account");
		int salary = 0;
		if (salaryStr != null) {
			salary = Integer.parseInt(salaryStr);
		}
		Salary s = new Salary();
		s.setUid(uid);
		s.setUname(uname);
		s.setWorktime1(worktime1);
		s.setWorktime2(worktime2);
		s.setPost(post);
		s.setSalary(salary);
		s.setAccount(account);
		boolean flag = ss.addSalary(s);
		try {
			if (flag) {
				response.sendRedirect("../salary/addsuccess.jsp");
			} else {
				response.sendRedirect("../salary/addfail.jsp");

			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
