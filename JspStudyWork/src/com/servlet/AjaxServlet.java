package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.entity.Class1;
import com.entity.Clerk;
import com.service.ClassService;
import com.service.ClerkService;
import com.service.DepartService;
import com.serviceImpl.ClassServiceImpl;
import com.serviceImpl.ClerkServiceImpl;
import com.serviceImpl.DepartServiceImpl;

public class AjaxServlet extends HttpServlet {

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

		String method = request.getParameter("method");
		if ("ajax".equals(method)) {
			findClassByDepart(request, response);
		} else if ("findClerkAjax".equals(method)) {
			findClerkAjax(request, response);
		}
	}

	// 发放工资时根据输入的学号，自动生成相关的姓名等信息
	private void findClerkAjax(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/text;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		String uid = request.getParameter("uid");
		ClerkService cs = new ClerkServiceImpl();
		List<Clerk> list = new ArrayList<Clerk>();
		list = cs.findClerkByCondition(uid);
		if(list.size()!=0) {
			
			Clerk c = list.get(0);
			String str = c.getUname()+","+c.getWorktime()+","+c.getUpost()+","+c.getAccount()+","+c.getC_oname()+","+c.getC_oid();
			pw.write(str);
			pw.flush();
			pw.close();
			
		}

	}

	// 联动菜单查询院系里面的班级
	private void findClassByDepart(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setContentType("text/text;charset=UTF-8");
		PrintWriter pw = response.getWriter();
		int id = 0;
		String idStr = request.getParameter("id");
		if (idStr != null) {
			id = Integer.parseInt(idStr);
		}
		ClassService cs = new ClassServiceImpl();
		List<Class1> list = new ArrayList<Class1>();
		list = cs.findClassByDeId(id);
		int size = list.size();
		String str = "";
		for (int i = 0; i < size; i++) {
			Class1 c = list.get(i);
			if (i == size - 1) {
				str = str + c.getCid() + "," + c.getCname();
			} else {
				str = str + c.getCid() + "," + c.getCname() + ";";
			}
		}
		pw.write(str);
		pw.flush();
		pw.close();
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
		System.out.println(222);

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
