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
import com.entity.Class1;
import com.entity.Depart;
import com.entity.Page;
import com.service.ClassService;
import com.serviceImpl.ClassServiceImpl;

public class ClassServlet extends HttpServlet {
	ClassService classservice = new ClassServiceImpl();
	DButil db = new DButil();
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

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

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if ("addClass".equals(method)) {
			addClass(request, response);
		} else if ("findClass".equals(method)) {
			findClass(request, response);
		} else if ("findClassByCondition".equals(method)) {
			findClassByCondition(request, response);
		} else if ("delClass".equals(method)) {
			delClass(request, response);
		} else if ("updClass".equals(method)) {
			updClass(request, response);
		}

	}

	// 修改班级
	private void updClass(HttpServletRequest request,
			HttpServletResponse response) {
		String cname = request.getParameter("cname");
		String cidStr = request.getParameter("cid");
		String c_dname = request.getParameter("c_dname");
		String class_didStr = request.getParameter("class_did");
		int cid = -1;
		int class_did = -1;
		if (cidStr != null) {
			cid = Integer.parseInt(cidStr);
		}
		if (class_didStr != null) {
			class_did = Integer.parseInt(class_didStr);
		}
		Class1 class1 = new Class1();
		class1.setCid(cid);
		class1.setC_dname(c_dname);
		class1.setCname(cname);
		class1.setClass_did(class_did);

		boolean flag = classservice.updClass(class1);
		try {
			if (flag) {
				response.sendRedirect("../class/updsuccess.jsp");
			} else {
				response.sendRedirect("../class/updfail.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 删除班级
	private void delClass(HttpServletRequest request,
			HttpServletResponse response) {
		String del = request.getParameter("dels");
		String[] dels = del.split(",");

		boolean flag = classservice.delClass(dels);
		try {
			if (flag) {
				response.sendRedirect("../class/delsuccess.jsp");
			} else {
				response.sendRedirect("../class/delfail.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 按照条件查询班级
	private void findClassByCondition(HttpServletRequest request,
			HttpServletResponse response) {
		String condition = request.getParameter("condition");
		List<Class1> list = new ArrayList<Class1>();

		list = classservice.findClassByCondition(condition);
		request.setAttribute("list", list);
	}

	// 查询班级
	private void findClass(HttpServletRequest request,
			HttpServletResponse response) {

		List<Class1> list = new ArrayList<Class1>();
		// 查询总页数
		String pageIndexStr = request.getParameter("pageIndex");
		int pageIndex = Integer.parseInt(pageIndexStr);
		Page page = new Page();
		int num = db.checkTotalClassPages();
		page.setDatas(num);
		page.setPageIndex(pageIndex);
		page.setCount();

		list = classservice.findClass(page);

		request.setAttribute("list", list);
		request.setAttribute("page", page);

	}

	// 添加班级
	private void addClass(HttpServletRequest request,
			HttpServletResponse response) {
		String cname = request.getParameter("cname");
		String class_did = request.getParameter("class_did");
		Class1 cla = new Class1();
		cla.setCname(cname);
		cla.setClass_did(Integer.parseInt(class_did));

		boolean flag = classservice.addClass(cla);
		try {
			if (flag) {
				response.sendRedirect("../class/addsuccess.jsp");
			} else {
				response.sendRedirect("../class/addfail.jsp");

			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
