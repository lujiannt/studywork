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
import com.entity.Office;
import com.entity.Page;
import com.service.OfficeService;
import com.serviceImpl.OfficeServiceImpl;

public class OfficeServlet extends HttpServlet {
	DButil db = new DButil();
	OfficeService officeservice = new OfficeServiceImpl();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
		if ("findOffices".equals(method)) {
			findOffices(request, response);
		} else if ("findOfficeByCondition".equals(method)) {
			findOfficeByCondition(request, response);
		} else if("addOffice".equals(method)) {
			addOffice(request, response);
		} else if("delOffice".equals(method)) {
			delOffice(request, response);
		} else if("updOffice".equals(method)) {
			updOffice(request, response);
		}  else if("findOffice2".equals(method)) {
			findOffice2(request, response);
		}
	}
	//添加岗位时 查询所有科室
	private void findOffice2(HttpServletRequest request,
			HttpServletResponse response) {
		List<Office> list = new ArrayList<Office>();

		list = officeservice.findOffice2();
		request.setAttribute("findOffice2list", list);
		
	}

	//修改科室
	private void updOffice(HttpServletRequest request,
			HttpServletResponse response) {
		String oidStr = request.getParameter("oid");
		String oname = request.getParameter("oname");
	    String oleadername = request.getParameter("oleadername"); 
		String ophone = request.getParameter("ophone");
		String o_didStr = request.getParameter("o_did");
		int oid = -1;
		int o_did = -1;
		if (oidStr != null) {
			oid = Integer.parseInt(oidStr);
		}
		if (o_didStr != null) {
			o_did = Integer.parseInt(o_didStr);
		}
		Office o = new Office();
		o.setOid(oid);
		o.setOname(oname);
		o.setOleadername(oleadername);
		o.setOphone(ophone);
		o.setO_did(o_did);

		boolean flag = officeservice.updOffice(o);
		try {
			if (flag) {
				response.sendRedirect("../office/updsuccess.jsp");
			} else {
				response.sendRedirect("../office/updfail.jsp");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

//删除科室
private void delOffice(HttpServletRequest request,
			HttpServletResponse response) {
	String del = request.getParameter("dels");
	String[] dels = del.split(",");

	boolean flag = officeservice.delOffice(dels);
	try {
		if (flag) {
			response.sendRedirect("../office/delsuccess.jsp");
		} else {
			response.sendRedirect("../office/delfail.jsp");
		}
	} catch (IOException e) {
		e.printStackTrace();
	}
	}

	//添加科室
	private void addOffice(HttpServletRequest request,
			HttpServletResponse response) {
		int  o_did=0;
		String oname = request.getParameter("oname");
		String oleadername = request.getParameter("oleadername");
		String ophone = request.getParameter("ophone");
		String o_didStr = request.getParameter("o_did");
		Office o = new Office();
        o.setOleadername(oleadername);
        o.setOname(oname);
        if(o_didStr!=null) {
        	o_did = Integer.parseInt(o_didStr);
        }
        o.setOphone(ophone);
        o.setO_did(o_did);
		boolean flag = officeservice.addOffice(o);
		try {
			if (flag) {
				response.sendRedirect("../office/addsuccess.jsp");
			} else {
				response.sendRedirect("../office/addfail.jsp");

			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 按照条件查询科室
	private void findOfficeByCondition(HttpServletRequest request,
			HttpServletResponse response) {
		String condition = request.getParameter("condition");
		List<Office> list = new ArrayList<Office>();

		list = officeservice.findOfficeByCondition(condition);
		request.setAttribute("list", list);
	}

	// 查询所有科室
	private void findOffices(HttpServletRequest request,
			HttpServletResponse response) {

		List<Office> list = new ArrayList<Office>();
		String pageIndexStr = request.getParameter("pageIndex");
		int pageIndex = Integer.parseInt(pageIndexStr);
		Page page = new Page();
		// 查询总页数
		int num = db.checkTotalOfficePages();
		page.setDatas(num);
		page.setPageIndex(pageIndex);
		page.setCount();

		list = officeservice.findOffice(page);
		request.setAttribute("list", list);
		request.setAttribute("page", page);

	}

}
