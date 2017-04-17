package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.db.DButil;
import com.entity.Depart;
import com.entity.Page;
import com.service.DepartService;
import com.serviceImpl.DepartServiceImpl;

public class DepartServlet extends HttpServlet {
	DepartService departservice = new DepartServiceImpl();
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

		response.setContentType("text/html");
		response.setContentType("utf-8");
		request.setCharacterEncoding("utf-8");
		String method = request.getParameter("method");
		if ("addDepart".equals(method)) {
			addDepart(request, response);
		} else if ("findDepart".equals(method)) {
			findDepart(request, response);
		} else if ("updDepart".equals(method)) {
			updDepart(request, response);
		} else if ("delDepart".equals(method)) {
			delDepart(request, response);
		} else if ("findDepartByCondition".equals(method)) {
			findDepartByCondition(request, response);
		} else if("findDepart2".equals(method)) {
			findDepart2(request, response);
		}

	}

	// 删除院系
	private void delDepart(HttpServletRequest request,
			HttpServletResponse response) {
		String del = request.getParameter("dels");
		String[] dels = del.split(",");
		boolean flag = departservice.delDepart(dels);
		try {
			if (flag) {
				response.sendRedirect("../depart/delsuccess.jsp");
			} else {
				response.sendRedirect("../depart/delfail.jsp");

			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 修改院系
	private boolean updDepart(HttpServletRequest request,
			HttpServletResponse response) {
		boolean flag = false;
		Depart depart = new Depart();
		String dno = request.getParameter("dno");
		String dname = request.getParameter("dname");
		String dphone = request.getParameter("dphone");
		String dleader = request.getParameter("dleader");
		String dkind_idStr = request.getParameter("dkind_id");
		depart.setDno(dno);
		depart.setDname(dname);
		depart.setDleader(dleader);
		depart.setDphone(dphone);
		depart.setDkind_id(Integer.parseInt(dkind_idStr));
		flag = departservice.updDepart(depart);
		try {
			if (flag == true) {
				response.sendRedirect("../depart/updsuccess.jsp");
			} else {
				response.sendRedirect("../depart/updfail.jsp");

			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return flag;
	}

	// 添加班级时查询所有院系
	private void findDepart2(HttpServletRequest request,
			HttpServletResponse response) {
		List<Depart> list = new ArrayList<Depart>();

		list = departservice.findDepart2();
		request.setAttribute("findDepart2list", list);

	}
	
	// 查询院系
	private void findDepart(HttpServletRequest request,
			HttpServletResponse response) {
		List<Depart> list = new ArrayList<Depart>();
		String pageIndexStr = request.getParameter("pageIndex");
		int pageIndex = Integer.parseInt(pageIndexStr);
		Page page = new Page();
		// 查询总页数
		int num = db.checkTotalPages();
		page.setDatas(num);
		page.setPageIndex(pageIndex);
		page.setCount();
		
		list = departservice.findDepart(page);
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		
	}

	// 根据条件查询院系
	private void findDepartByCondition(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		// String condition = new
		// String(request.getParameter("condition").getBytes("ISO-8859-1"),"UTF-8");
		String condition = request.getParameter("condition");
		List<Depart> list = new ArrayList<Depart>();

		list = departservice.findDepartByCondition(condition);
		request.setAttribute("list", list);

	}

	// 添加院系
	private void addDepart(HttpServletRequest request,
			HttpServletResponse response) {
		int a = -1;
		Depart depart = new Depart();
		String dno = request.getParameter("dno");
		String dname = request.getParameter("dname");
		String dphone = request.getParameter("dphone");
		String dleader = request.getParameter("dleader");
		String dkind_idStr = request.getParameter("dkind_id");
		depart.setDno(dno);
		depart.setDkind_id(Integer.parseInt(dkind_idStr));
		depart.setDleader(dleader);
		depart.setDname(dname);
		depart.setDphone(dphone);
		a = departservice.addDepart(depart);
		try {
			if (a > 0) {
				response.sendRedirect("../depart/addsuccess.jsp");

			} else {
				response.sendRedirect("../depart/addfail.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
