package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.entity.Checks;
import com.entity.Class1;
import com.entity.Depart;
import com.entity.News;
import com.entity.Office;
import com.entity.Page;
import com.entity.Post;
import com.entity.Clerk;
import com.entity.Salary;
import com.util.DataConnection;

public class DButil {
	DataConnection dataconnection = DataConnection.getInstance();
	Connection conn = null;
	PreparedStatement ps = null;
	Statement stmt = null;
	Statement stmt1 = null;
	Statement stmt2 = null;
	ResultSet rs = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	ResultSet rs4 = null;
	ResultSet rs5 = null;
	ResultSet rs6 = null;

	// 获取数据库的连接
	public Connection getConn() {
		try {
			if (conn != null) {
				DButil db = new DButil();
				db.closeConn();
			}
			Class.forName(dataconnection.getValue("driverclass"));
			String url = dataconnection.getValue("url");
			String name = dataconnection.getValue("name");
			String password = dataconnection.getValue("password");
			conn = DriverManager.getConnection(url, name, password);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return conn;
	}

	// 关闭数据库
	public boolean closeConn() {
		boolean flag = false;
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (rs1 != null) {
				rs1.close();
				rs1 = null;
			}
			if (rs2 != null) {
				rs2.close();
				rs2 = null;
			}
			if (rs3 != null) {
				rs3.close();
				rs3 = null;
			}
			if (rs4 != null) {
				rs4.close();
				rs4 = null;
			}
			if (rs5 != null) {
				rs5.close();
				rs5 = null;
			}
			if (rs6 != null) {
				rs6.close();
				rs6 = null;
			}
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
			if (stmt1 != null) {
				stmt1.close();
				stmt1 = null;
			}
			if (stmt2 != null) {
				stmt2.close();
				stmt2 = null;
			}
			if (ps != null) {
				ps.close();
				ps = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

	// 登录验证
	public String findUser(Clerk user) {
		String flag = "";

		try {
			conn = this.getConn();
			String sql = "select competence,uid from student where uname='"
					+ user.getUname() + "' and pwd='" + user.getPwd() + "'";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			if (rs.next()) {
				String a = rs.getString(1);
				String b = user.getCompetence();
				if (a.equals(b)) {
					flag = rs.getString(2);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return flag;
	}

	// 添加院系
	public int addDepart(Depart depart) {
		int a = 0;
		try {
			conn = this.getConn();
			String sql = "insert into depart(dno,dname,dleader,dphone,dkind_id) values('"
					+ depart.getDno()
					+ "','"
					+ depart.getDname()
					+ "','"
					+ depart.getDleader()
					+ "','"
					+ depart.getDphone()
					+ "',"
					+ depart.getDkind_id() + ")";
			ps = conn.prepareStatement(sql);
			a = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return a;
	}

	// 查询所有院系
	public List<Depart> finDepart(Page page) {
		List<Depart> list = new ArrayList<Depart>();
		try {
			String sql = "select dno,dname,dleader,dphone,dkind_id from depart limit ?,?";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, (page.getPageIndex() - 1) * page.getPageSize());
			ps.setInt(2, page.getPageSize());
			rs = ps.executeQuery();
			while (rs.next()) {
				Depart d = new Depart();
				d.setDno(rs.getString(1));
				d.setDname(rs.getString(2));
				d.setDleader(rs.getString(3));
				d.setDphone(rs.getString(4));
				String sql1 = "select kind from kind where id=" + rs.getInt(5);
				stmt = conn.createStatement();
				rs1 = stmt.executeQuery(sql1);
				if (rs1.next()) {
					d.setDkind_name(rs1.getString(1));
				}
				list.add(d);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	// 修改院系信息
	public boolean updDepart(Depart depart) {
		boolean flag = false;
		try {
			conn = this.getConn();
			String sql = "update depart set dname='" + depart.getDname()
					+ "',dleader='" + depart.getDleader() + "',dphone='"
					+ depart.getDphone() + "',dkind_id=" + depart.getDkind_id()
					+ "  where dno='" + depart.getDno() + "' ";
			ps = conn.prepareStatement(sql);
			int a = ps.executeUpdate();
			if (a > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return flag;
	}

	// 删除院系信息
	public boolean delDepart(String[] dels) {
		boolean flag = false;
		int size = 0;
		try {
			conn = this.getConn();
			stmt = conn.createStatement();
			// 批量删除
			for (int i = 0; i < dels.length; i++) {
				String sql = "delete from depart where dno='" + dels[i] + "' ";
				stmt.addBatch(sql);
			}
			int[] a = stmt.executeBatch();
			for (int j = 0; j < a.length; j++) {
				if (a[j] > 0) {
					size++;
				}
			}
			if (size > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return flag;
	}

	// 查询院系总数
	public int checkTotalPages() {
		int num = 0;
		try {
			conn = this.getConn();
			String sql = "select count(*) from depart";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return num;
	}

	// 按照条件单独查询时page中的院系总数
	public int checkTotalPagesByCondition(String condition) {
		int num = 0;
		try {
			conn = this.getConn();
			String sql = "select count(*) from depart where dno=? or dname=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, condition);
			ps.setString(2, condition);
			rs = ps.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return num;
	}

	// 按照条件查询院系
	public List<Depart> findDepartByCondition(String con) {
		List<Depart> list = new ArrayList<Depart>();
		try {
			String sql = "select dno,dname,dleader,dphone,dkind_id from depart where dno = ? or dname like ?";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, con);
			ps.setString(2, "%" + con + "%");
			rs = ps.executeQuery();
			while (rs.next()) {
				Depart d = new Depart();
				d.setDno(rs.getString(1));
				d.setDname(rs.getString(2));
				d.setDleader(rs.getString(3));
				d.setDphone(rs.getString(4));
				String sql1 = "select kind from kind where id=" + rs.getInt(5);
				stmt = conn.createStatement();
				rs1 = stmt.executeQuery(sql1);
				if (rs1.next()) {
					d.setDkind_name(rs1.getString(1));
				}
				list.add(d);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	// 添加班级时select下拉框查询所有院系
	public List<Depart> findDepart2() {
		List<Depart> list = new ArrayList<Depart>();
		try {
			String sql = "select dno,dname,dleader,dphone,dkind_id,id from depart ";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Depart d = new Depart();
				d.setDno(rs.getString(1));
				d.setDname(rs.getString(2));
				d.setDleader(rs.getString(3));
				d.setDphone(rs.getString(4));
				d.setId(rs.getInt(6));
				String sql1 = "select kind from kind where id=" + rs.getInt(5);
				stmt = conn.createStatement();
				rs1 = stmt.executeQuery(sql1);
				if (rs1.next()) {
					d.setDkind_name(rs1.getString(1));
				}
				list.add(d);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	/**
	 * 
	 * 班级的相关操作
	 * 
	 * */

	// 查询一个院系下面的所属班级
	public List<Class1> findClassByDeId(int id) {
		List<Class1> list = new ArrayList<Class1>();
		try {
			String sql = "select cid,cname from class where class_did=?";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				Class1 c = new Class1();
				c.setCid(rs.getInt(1));
				c.setCname(rs.getString(2));
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	// 添加班级
	public boolean addClass(Class1 cla) {
		boolean flag = false;
		conn = this.getConn();
		try {
			String sql = "insert into class(cname,class_did) values(?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, cla.getCname());
			ps.setInt(2, cla.getClass_did());
			int a = ps.executeUpdate();
			if (a > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return flag;
	}

	// 查询所有班级
	public List<Class1> findClass(Page page) {
		List<Class1> list = new ArrayList<Class1>();
		try {
			String sql = "select cid,cname,class_did from class limit ?,?";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			int a = (page.getPageIndex() - 1) * page.getPageSize();
			int b = page.getPageSize();
			ps.setInt(1, a);
			ps.setInt(2, b);
			rs = ps.executeQuery();
			while (rs.next()) {
				Class1 c = new Class1();
				c.setCid(rs.getInt(1));
				c.setCname(rs.getString(2));
				String sql1 = "select dname from depart where id="
						+ rs.getInt(3);
				stmt = conn.createStatement();
				rs1 = stmt.executeQuery(sql1);
				if (rs1.next()) {
					c.setC_dname(rs1.getString(1));
				}
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	// 查询班级总页数
	public int checkTotalClassPages() {
		int num = 0;
		try {
			conn = this.getConn();
			String sql = "select count(*) from class";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return num;
	}

	// 按照条件查找班级
	public List<Class1> findClassByCondition(String condition) {
		List<Class1> list = new ArrayList<Class1>();
		try {
			String sql = "select cid,cname,class_did from class where cid = ? or cname = ?";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, condition);
			ps.setString(2, condition);
			rs = ps.executeQuery();
			while (rs.next()) {
				Class1 c = new Class1();
				c.setCid(rs.getInt(1));
				c.setCname(rs.getString(2));
				String sql1 = "select dname from depart where id="
						+ rs.getInt(3);
				stmt = conn.createStatement();
				rs1 = stmt.executeQuery(sql1);
				if (rs1.next()) {
					c.setC_dname(rs1.getString(1));
				}
				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	// 删除班级
	public boolean delClass(String[] delss) {
		boolean flag = false;
		try {
			conn = this.getConn();
			stmt = conn.createStatement();
			int[] dels = new int[delss.length];
			for (int i = 0; i < delss.length; i++) {
				dels[i] = Integer.parseInt(delss[i]);
			}
			// 先找到对应外键
			int[] fks = new int[50];
			for (int i = 0; i < dels.length; i++) {
				String sql = "select class_did from class where cid=" + dels[i];
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					fks[i] = rs.getInt(1);
				}
			}
			//
			// // 批量删除外键
			// for (int i = 0; i < fks.length; i++) {
			// String sql = "delete from depart where id = '" + fks[i] + "' ";
			// stmt.addBatch(sql);
			// }
			// int[] b = stmt.executeBatch();
			// System.out.println("bb==" + b.length);
			// stmt = null;
			// 批量删除
			stmt = conn.createStatement();
			for (int i = 0; i < dels.length; i++) {
				String sql = "delete from class where cid='" + dels[i] + "' ";
				stmt.addBatch(sql);
			}
			int[] a = stmt.executeBatch();
			if (a.length > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return flag;
	}

	// 修改班级
	public boolean updClass(Class1 class1) {
		boolean flag = false;
		try {
			conn = this.getConn();
			String sql = "update class set cname='" + class1.getCname()
					+ "' ,class_did='" + class1.getClass_did()
					+ "'  where cid=" + class1.getCid();
			ps = conn.prepareStatement(sql);
			int a = ps.executeUpdate();
			if (a > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return flag;
	}

	/*****
	 * 
	 * 科室的相关操作
	 * 
	 */
	// 查询所有科室
	public List<Office> findOffice(Page page) {
		List<Office> list = new ArrayList<Office>();
		try {
			String sql = "select oid,oname,oleadername,ophone,o_did from office limit ?,?";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			int a = (page.getPageIndex() - 1) * page.getPageSize();
			int b = page.getPageSize();
			ps.setInt(1, a);
			ps.setInt(2, b);
			rs = ps.executeQuery();
			while (rs.next()) {
				Office o = new Office();
				o.setOid(rs.getInt(1));
				o.setOname(rs.getString(2));
				o.setOleadername(rs.getString(3));
				o.setOphone(rs.getString(4));
				o.setO_did(rs.getInt(5));
				String sql1 = "select dname from depart where id="
						+ rs.getInt(5);
				stmt = conn.createStatement();
				rs1 = stmt.executeQuery(sql1);
				if (rs1.next()) {
					o.setO_dname(rs1.getString(1));
				}
				list.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	// 查询科室总页数
	public int checkTotalOfficePages() {
		int num = 0;
		try {
			conn = this.getConn();
			String sql = "select count(*) from office";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return num;
	}

	// 按照条件查询科室
	public List<Office> findOfficeByCondition(String condition) {
		List<Office> list = new ArrayList<Office>();
		try {
			String sql = "select oid,oname,oleadername,ophone,o_did from office where oid = ? or oname = ?";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, condition);
			ps.setString(2, condition);
			rs = ps.executeQuery();
			while (rs.next()) {
				Office o = new Office();
				o.setOid(rs.getInt(1));
				o.setOname(rs.getString(2));
				o.setOleadername(rs.getString(3));
				o.setOphone(rs.getString(4));
				o.setO_did(rs.getInt(5));
				String sql1 = "select dname from depart where id="
						+ rs.getInt(5);
				stmt = conn.createStatement();
				rs1 = stmt.executeQuery(sql1);
				if (rs1.next()) {
					o.setO_dname(rs1.getString(1));
				}
				list.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	// 添加科室
	public boolean addOffice(Office o) {
		boolean flag = false;
		conn = this.getConn();
		try {
			String sql = "insert into office(oname,oleadername,ophone,o_did) values(?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, o.getOname());
			ps.setString(2, o.getOleadername());
			ps.setString(3, o.getOphone());
			ps.setInt(4, o.getO_did());
			int a = ps.executeUpdate();
			if (a > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return flag;
	}

	// 删除科室
	public boolean delOffice(String[] delss) {
		boolean flag = false;
		try {
			conn = this.getConn();
			stmt = conn.createStatement();
			int[] dels = new int[delss.length];
			for (int i = 0; i < delss.length; i++) {
				dels[i] = Integer.parseInt(delss[i]);
			}
			stmt = conn.createStatement();
			for (int i = 0; i < dels.length; i++) {
				String sql = "delete from office where oid='" + dels[i] + "' ";
				stmt.addBatch(sql);
			}
			int[] a = stmt.executeBatch();
			if (a.length > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return flag;
	}

	// 修改科室
	public boolean updOffice(Office o) {
		boolean flag = false;
		try {
			conn = this.getConn();
			String sql = "update office set oname='" + o.getOname()
					+ "' ,oleadername='" + o.getOleadername() + "' ,ophone='"
					+ o.getOphone() + "' ,o_did='" + o.getO_did()
					+ "' where oid=" + o.getOid();
			ps = conn.prepareStatement(sql);
			int a = ps.executeUpdate();
			if (a > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return flag;
	}

	/*****
	 * 
	 * 岗位部分
	 * 
	 */

	// 查询岗位总数
	public int checkTotalPostPages() {
		int num = 0;
		try {
			conn = this.getConn();
			String sql = "select count(*) from post";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return num;
	}

	// 查询岗位
	public List<Post> findPost(Page page) {
		List<Post> list = new ArrayList<Post>();
		try {
			String sql = "select pid,pname,pleadername,pleaderphone,pcount,p_oid,pcount2,kind from post limit ?,?";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			int a = (page.getPageIndex() - 1) * page.getPageSize();
			int b = page.getPageSize();
			ps.setInt(1, a);
			ps.setInt(2, b);
			rs = ps.executeQuery();
			while (rs.next()) {
				Post p = new Post();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPleadername(rs.getString(3));
				p.setPleaderphone(rs.getString(4));
				p.setPcount(rs.getInt(5));
				p.setP_oid((rs.getInt(6)));
				p.setPcount2(rs.getInt(7));
				p.setKind(rs.getInt(8));
				// 查出岗位所属科室名
				String sql1 = "select oname from office where oid="
						+ rs.getInt(6);
				stmt = conn.createStatement();
				rs1 = stmt.executeQuery(sql1);
				if (rs1.next()) {
					p.setP_oname(rs1.getString(1));
				}
				// 查村岗位所属科室所属的院系名
				// 1.现根据科室id查出他所属的院系id
				String sql2 = "select o_did from office where oid="
						+ rs.getInt(6);
				stmt = conn.createStatement();
				rs2 = stmt.executeQuery(sql2);
				if (rs2.next()) {
					p.setP_did(rs2.getInt(1));
				}

				// 1.再根据查出的院系id查出院系名
				String sql3 = "select dname from depart where id="
						+ rs2.getInt(1);
				stmt = conn.createStatement();
				rs3 = stmt.executeQuery(sql3);
				if (rs3.next()) {
					p.setP_dname(rs3.getString(1));
				}
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	// 按条件查询岗位
	public List<Post> findPostByCondition(String condition) {
		List<Post> list = new ArrayList<Post>();
		try {
			String sql = "select pid,pname,pleadername,pleaderphone,pcount,p_oid,pcount2,kind from post where pid=? or pname like ?";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, condition);
			ps.setString(2, "%" + condition + "%");
			rs = ps.executeQuery();
			while (rs.next()) {
				Post p = new Post();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPleadername(rs.getString(3));
				p.setPleaderphone(rs.getString(4));
				p.setPcount(rs.getInt(5));
				p.setP_oid((rs.getInt(6)));
				p.setPcount2(rs.getInt(7));
				p.setKind(rs.getInt(8));
				// 查出岗位所属科室名
				String sql1 = "select oname from office where oid="
						+ rs.getInt(6);
				stmt = conn.createStatement();
				rs1 = stmt.executeQuery(sql1);
				if (rs1.next()) {
					p.setP_oname(rs1.getString(1));
				}
				// 查村岗位所属科室所属的院系名
				// 1.现根据科室id查出他所属的院系id
				String sql2 = "select o_did from office where oid="
						+ rs.getInt(6);
				stmt = conn.createStatement();
				rs2 = stmt.executeQuery(sql2);
				if (rs2.next()) {
					p.setP_did(rs2.getInt(1));
				}

				// 1.再根据查出的院系id查出院系名
				String sql3 = "select dname from depart where id="
						+ rs2.getInt(1);
				stmt = conn.createStatement();
				rs3 = stmt.executeQuery(sql3);
				if (rs3.next()) {
					p.setP_dname(rs3.getString(1));
				}
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return list;
	}

	// 添加岗位时查询所有科室
	public List<Office> findOffice2() {
		List<Office> list = new ArrayList<Office>();
		try {
			String sql = "select oname,oleadername,ophone,o_did,oid from office ";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Office o = new Office();
				o.setOname(rs.getString(1));
				o.setOleadername(rs.getString(2));
				o.setOphone(rs.getString(3));
				o.setO_did(rs.getInt(4));
				o.setOid(rs.getInt(5));
				list.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	// 添加岗位
	public boolean addPost(Post p) {
		boolean flag = false;
		conn = this.getConn();
		try {
			String sql = "insert into post(pname,pleadername,pleaderphone,pcount,p_oid,kind,pcount2) values(?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, p.getPname());
			ps.setString(2, p.getPleadername());
			ps.setString(3, p.getPleaderphone());
			ps.setInt(4, p.getPcount());
			ps.setInt(5, p.getP_oid());
			ps.setInt(6, p.getKind());
			ps.setInt(7, p.getPcount2());
			int a = ps.executeUpdate();
			if (a > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return flag;
	}

	// 删除岗位
	public boolean delPost(String[] delss) {
		boolean flag = false;
		try {
			conn = this.getConn();
			stmt = conn.createStatement();
			int[] dels = new int[delss.length];
			// 将字符串数组转化成int类型
			for (int i = 0; i < delss.length; i++) {
				dels[i] = Integer.parseInt(delss[i]);
			}
			stmt = conn.createStatement();
			for (int i = 0; i < dels.length; i++) {
				String sql = "delete from post where pid='" + dels[i] + "' ";
				stmt.addBatch(sql);
			}
			int[] a = stmt.executeBatch();
			if (a.length > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return flag;
	}

	// 修改岗位信息
	public boolean updPost(Post p) {
		boolean flag = false;
		try {
			conn = this.getConn();
			String sql = "update post set pname='" + p.getPname()
					+ "' ,pleadername='" + p.getPleadername()
					+ "' ,pleaderphone='" + p.getPleaderphone() + "' ,p_oid='"
					+ p.getP_oid() + "' ,pcount='" + p.getPcount()
					+ "' where pid=" + p.getPid();
			ps = conn.prepareStatement(sql);
			int a = ps.executeUpdate();
			if (a > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return flag;
	}

	// 添加职工时查询所有岗位信息
	public List<Post> findPost2() {
		List<Post> list = new ArrayList<Post>();
		try {
			String sql = "select pid,pname from post ";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Post p = new Post();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	// 同意学生申请岗位
	public boolean askPost(String[] dels2) {
		boolean flag = false;
		try {
			conn = this.getConn();
			stmt = conn.createStatement();
			// 将岗位id转化成int类型
			int chid = Integer.parseInt(dels2[0]);
			// 根据chid 查询uid和pid
			int uid = 0;
			int pid = 0;

			String sql1 = "select uid,pid from checks where chid=" + chid;
			stmt = conn.createStatement();
			rs3 = stmt.executeQuery(sql1);
			if (rs3.next()) {
				uid = rs3.getInt(1);
				pid = rs3.getInt(2);
			}

			// 新增一个职工在某个岗位，该岗位相对应的人数也就要加1
			// 先查出当前没添加该员工时，该岗位的人数
			String sql2 = "select pcount,pname from post where pid='" + pid
					+ "' ";
			stmt = conn.createStatement();
			rs2 = stmt.executeQuery(sql2);
			int count = 0;
			String pname = "";
			if (rs2.next()) {
				count = rs2.getInt(1) + 1;
				pname = rs2.getString(2);
			}

			// 将学生审核状态改成已审核
			stmt = conn.createStatement();
			String sql = "update student set checkstatus = 1,upost= '" + pname
					+ "' where uid='" + uid + "' ";
			stmt.addBatch(sql);

			int[] a = stmt.executeBatch();
			if (a.length > 0) {
				flag = true;
			}

			// 修改该岗位的人数，添加1
			String sql3 = "update post set pcount=" + count + " where pid='"
					+ pid + "' ";
			stmt1 = conn.createStatement();
			int b = stmt1.executeUpdate(sql3);

			// 审核完成后，还要删除掉审核表中的该信息
			String sql4 = "delete from checks where chid = " + chid;
			stmt2 = conn.createStatement();
			int c = stmt1.executeUpdate(sql4);

			// 学生端未读信息通知
			Date date = new Date();
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String time = format.format(date);
			if (c > 0) {
				String sql5 = "insert into news(title,content,ntime,uid) values(?,?,?,?)";
				ps = conn.prepareStatement(sql5);
				ps.setString(1, pname + "岗位申请结果");
				ps.setString(2, "恭喜你申请岗位成功");
				ps.setString(3, time);
				ps.setInt(4, uid);
				int d = ps.executeUpdate();

			} else {
				String sql6 = "insert into news(title,content,ntime) values(?,?,?)";
				ps = conn.prepareStatement(sql6);
				ps.setString(1, pname + "岗位申请结果");
				ps.setString(2, "很抱歉，因为种种原因，您申请该岗位失败功");
				ps.setString(3, time);
				int e = ps.executeUpdate();

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return flag;
	}

	// 学生申请岗位
	public boolean ask(int pid, int uid) {

		boolean flag = false;
		conn = this.getConn();
		try {
			String sql = "insert into checks(uid,pid) values(?,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, uid);
			ps.setInt(2, pid);
			int a = ps.executeUpdate();
			if (a > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return flag;
	}

	/*******
	 * 
	 * 职工部分 用户部分
	 * 
	 * 
	 */
	// 添加职工.添加用户
	public boolean addClerk(Clerk u) {
		boolean flag = false;
		conn = this.getConn();
		try {
			String sql = "insert into student(uid,uname,sex,phone,email,depart,uclass,upost,worktime,kind,account,competence,checkstatus,pwd) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, u.getUid());
			ps.setString(2, u.getUname());
			ps.setString(3, u.getSex());
			ps.setString(4, u.getPhone());
			ps.setString(5, u.getEmail());
			ps.setString(6, u.getDepart());
			ps.setString(7, u.getUclass());
			ps.setString(8, u.getUpost());
			ps.setString(9, u.getWorktime());
			ps.setInt(10, u.getKind());
			ps.setString(11, u.getAccount());
			ps.setString(12, "0");
			ps.setInt(13, u.getCheckstatus());
			ps.setString(14, u.getPwd());
			int a = ps.executeUpdate();
			if (a > 0) {
				flag = true;
			}
			// 新增一个职工在某个岗位，该岗位相对应的人数也就要加1
			// 先查出当前没添加该员工时，该岗位的人数
			String sql2 = "select pcount from post where pname='"
					+ u.getUpost() + "' ";
			stmt = conn.createStatement();
			rs2 = stmt.executeQuery(sql2);
			int count = 0;
			if (rs2.next()) {
				count = rs2.getInt(1) + 1;
			}
			// 修改该岗位的人数，添加1
			String sql3 = "update post set pcount=" + count + " where pname='"
					+ u.getUpost() + "' ";
			stmt1 = conn.createStatement();
			int b = stmt1.executeUpdate(sql3);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return flag;
	}

	// 查询勤工俭学的总人数
	public int checkTotalClerkPages() {
		int num = 0;
		try {
			conn = this.getConn();
			String sql = "select count(*) from student";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return num;
	}

	// 查询所有职工
	public List<Clerk> findClerk(Page page) {
		List<Clerk> list = new ArrayList<Clerk>();
		try {
			String sql = "select id,uid,uname,sex,phone,email,depart,uclass,upost,worktime,kind,account from student limit ?,? ";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			int a = (page.getPageIndex() - 1) * page.getPageSize();
			int b = page.getPageSize();
			ps.setInt(1, a);
			ps.setInt(2, b);
			rs = ps.executeQuery();
			while (rs.next()) {
				Clerk c = new Clerk();
				c.setId(rs.getInt(1));
				c.setUid(rs.getString(2));
				c.setUname(rs.getString(3));
				c.setSex(rs.getString(4));
				c.setPhone(rs.getString(5));
				c.setEmail(rs.getString(6));
				c.setDepart(rs.getString(7));
				c.setUclass(rs.getString(8));
				c.setUpost(rs.getString(9));
				c.setWorktime(rs.getString(10));
				c.setKind(rs.getInt(11));
				c.setAccount(rs.getString(12));
				// 查出学生所属院系名
				String sql1 = "select dname from depart where id="
						+ rs.getString(7);
				stmt = conn.createStatement();
				rs1 = stmt.executeQuery(sql1);
				if (rs1.next()) {
					c.setDname(rs1.getString(1));
				}
				// 查村所属班级名
				String sql2 = "select cname from class where cid="
						+ rs.getString(8);
				stmt = conn.createStatement();
				rs2 = stmt.executeQuery(sql2);
				if (rs2.next()) {
					c.setCname(rs2.getString(1));
				}

				// 查出所属的是长期工还是短期工
				String sql4 = "select kind from kind where id=" + rs.getInt(11);
				stmt = conn.createStatement();
				rs4 = stmt.executeQuery(sql4);
				if (rs4.next()) {
					c.setKname(rs4.getString(1));
				}

				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	// 根据条件查询职工信息
	public List<Clerk> findClerkByCondition(String condition) {
		List<Clerk> list = new ArrayList<Clerk>();
		try {
			String sql = "select id,uid,uname,sex,phone,email,depart,uclass,upost,worktime,kind,account from student where uname=? or uid = ?";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			ps.setString(1, condition);
			ps.setString(2, condition);
			rs = ps.executeQuery();
			while (rs.next()) {
				Clerk c = new Clerk();
				c.setId(rs.getInt(1));
				c.setUid(rs.getString(2));
				c.setUname(rs.getString(3));
				c.setSex(rs.getString(4));
				c.setPhone(rs.getString(5));
				c.setEmail(rs.getString(6));
				c.setDepart(rs.getString(7));
				c.setUclass(rs.getString(8));
				c.setUpost(rs.getString(9));
				c.setWorktime(rs.getString(10));
				c.setKind(rs.getInt(11));
				c.setAccount(rs.getString(12));
				// 查出学生所属院系名
				String sql1 = "select dname from depart where id="
						+ rs.getString(7);
				stmt = conn.createStatement();
				rs1 = stmt.executeQuery(sql1);
				if (rs1.next()) {
					c.setDname(rs1.getString(1));
				}
				// 查村所属班级名
				String sql2 = "select cname from class where cid="
						+ rs.getString(8);
				stmt = conn.createStatement();
				rs2 = stmt.executeQuery(sql2);
				if (rs2.next()) {
					c.setCname(rs2.getString(1));
				}

				// 查出所属的是长期工还是短期工
				String sql4 = "select kind from kind where id=" + rs.getInt(11);
				stmt = conn.createStatement();
				rs4 = stmt.executeQuery(sql4);
				if (rs4.next()) {
					c.setKname(rs4.getString(1));
				}
				// 查出岗位所属科室id
				String sql5 = "select p_oid from post where pname='"
						+ rs.getString(9) + "'";
				stmt = conn.createStatement();
				rs5 = stmt.executeQuery(sql5);
				int oid = -1;
				if (rs5.next()) {
					oid = rs5.getInt(1);
					c.setC_oid(oid);
				}
				// 根据科室id查询科室名
				String sql6 = "select oname from office where oid=" + oid;
				stmt = conn.createStatement();
				rs6 = stmt.executeQuery(sql6);
				if (rs6.next()) {
					c.setC_oname(rs6.getString(1));
				}

				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	// 删除职工
	public boolean delClerk(String[] delss) {
		boolean flag = false;
		try {
			conn = this.getConn();
			stmt = conn.createStatement();
			int[] dels = new int[delss.length];
			// 将字符串数组转化成int类型
			for (int i = 0; i < delss.length; i++) {
				dels[i] = Integer.parseInt(delss[i]);
			}
			stmt = conn.createStatement();
			for (int i = 0; i < dels.length; i++) {
				String sql = "delete from student where id='" + dels[i] + "' ";
				stmt.addBatch(sql);
			}
			int[] a = stmt.executeBatch();
			if (a.length > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return flag;
	}

	// 修改职工信息
	public boolean updClerk(Clerk c) {
		boolean flag = false;
		try {
			conn = this.getConn();
			String sql = "update student set uid='" + c.getUid() + "' ,uname='"
					+ c.getUname() + "' ,sex='" + c.getSex() + "' ,phone='"
					+ c.getPhone() + "' ,email='" + c.getEmail()
					+ "', depart='" + c.getDepart() + "', uclass='"
					+ c.getUclass() + "' ,upost='" + c.getUpost()
					+ "' ,worktime='" + c.getWorktime() + "' ,kind = '"
					+ c.getKind() + "' ,account='" + c.getAccount()
					+ "' where id=" + c.getId();
			ps = conn.prepareStatement(sql);
			int a = ps.executeUpdate();
			if (a > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return flag;
	}

	/********
	 * 
	 * 工资部分
	 * 
	 * 
	 */

	public boolean addSalary(Salary s) {
		// TODO Auto-generated method stub
		boolean flag = false;
		conn = this.getConn();
		int oid = -1;
		// 先查询出该岗位所属的科室
		// 1.根据岗位名查询出所属的科室id
		try {
			String sql = "select p_oid from post where pname='" + s.getPost()
					+ "'";
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				oid = rs.getInt(1);
			}
			// 插入工资表数据
			String sql1 = "insert into salary(uid,uname,salary,post,worktime1,worktime2,s_oid,account) values(?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql1);
			ps.setString(1, s.getUid());
			ps.setString(2, s.getUname());
			ps.setInt(3, s.getSalary());
			ps.setString(4, s.getPost());
			ps.setString(5, s.getWorktime1());
			ps.setString(6, s.getWorktime2());
			ps.setInt(7, oid);
			ps.setString(8, s.getAccount());
			int a = ps.executeUpdate();
			if (a > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return flag;
	}

	// 查询salary总条数
	public int checkTotalSalaryPages() {
		int num = 0;
		try {
			conn = this.getConn();
			String sql = "select count(*) from salary";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				num = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return num;
	}

	// 查询工资报表
	public List<Salary> findSalary(Page page) {
		List<Salary> list = new ArrayList<Salary>();
		try {
			String sql = "select sid,uid,uname,post,s_oid,worktime1,worktime2,salary,account from salary limit ?,?";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			int a = (page.getPageIndex() - 1) * page.getPageSize();
			int b = page.getPageSize();
			ps.setInt(1, a);
			ps.setInt(2, b);
			rs = ps.executeQuery();
			while (rs.next()) {
				Salary s = new Salary();
				s.setSid(rs.getInt(1));
				s.setUid(rs.getString(2));
				s.setUname(rs.getString(3));
				s.setPost(rs.getString(4));
				s.setS_oid(rs.getInt(5));
				s.setWorktime1(rs.getString(6));
				s.setWorktime2(rs.getString(7));
				s.setSalary(rs.getInt(8));
				s.setAccount(rs.getString(9));
				// 查出岗位所属科室名
				String sql1 = "select oname from office where oid="
						+ rs.getInt(5);
				stmt = conn.createStatement();
				rs1 = stmt.executeQuery(sql1);
				if (rs1.next()) {
					s.setS_oname(rs1.getString(1));
				}

				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	// 按照条件查询工资账单
	public List<Salary> findSalaryByCondition(String condition) {
		List<Salary> list = new ArrayList<Salary>();
		try {
			String sql = "select sid,uid,uname,post,s_oid,worktime1,worktime2,salary,account from salary where uid=? or sid =? ";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(condition));
			ps.setString(2, condition);
			rs = ps.executeQuery();
			while (rs.next()) {
				Salary s = new Salary();
				s.setSid(rs.getInt(1));
				s.setUid(rs.getString(2));
				s.setUname(rs.getString(3));
				s.setPost(rs.getString(4));
				s.setS_oid(rs.getInt(5));
				s.setWorktime1(rs.getString(6));
				s.setWorktime2(rs.getString(7));
				s.setSalary(rs.getInt(8));
				s.setAccount(rs.getString(9));
				// 查出岗位所属科室名
				String sql1 = "select oname from office where oid="
						+ rs.getInt(5);
				stmt = conn.createStatement();
				rs1 = stmt.executeQuery(sql1);
				if (rs1.next()) {
					s.setS_oname(rs1.getString(1));
				}

				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	// 按照条件排序工资账单
	public List<Salary> findOrderSalaryByCondition(Page page, String condition) {
		List<Salary> list = new ArrayList<Salary>();
		try {
			String sql = "select sid,uid,uname,post,s_oid,worktime1,worktime2,salary,account from salary "
					+ condition + " limit ?,?";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			int a = (page.getPageIndex() - 1) * page.getPageSize();
			int b = page.getPageSize();
			ps.setInt(1, a);
			ps.setInt(2, b);
			rs = ps.executeQuery();
			while (rs.next()) {
				Salary s = new Salary();
				s.setSid(rs.getInt(1));
				s.setUid(rs.getString(2));
				s.setUname(rs.getString(3));
				s.setPost(rs.getString(4));
				s.setS_oid(rs.getInt(5));
				s.setWorktime1(rs.getString(6));
				s.setWorktime2(rs.getString(7));
				s.setSalary(rs.getInt(8));
				s.setAccount(rs.getString(9));
				// 查出岗位所属科室名
				String sql1 = "select oname from office where oid="
						+ rs.getInt(5);
				stmt = conn.createStatement();
				rs1 = stmt.executeQuery(sql1);
				if (rs1.next()) {
					s.setS_oname(rs1.getString(1));
				}

				list.add(s);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	// 删除账单信息
	public boolean delSalary(String[] delss) {
		boolean flag = false;
		try {
			conn = this.getConn();
			stmt = conn.createStatement();
			int[] dels = new int[delss.length];
			for (int i = 0; i < delss.length; i++) {
				dels[i] = Integer.parseInt(delss[i]);
			}
			stmt = conn.createStatement();
			for (int i = 0; i < dels.length; i++) {
				String sql = "delete from salary where sid='" + dels[i] + "' ";
				stmt.addBatch(sql);
			}
			int[] a = stmt.executeBatch();
			if (a.length > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return flag;
	}

	// 修改工资账单信息
	public boolean updateSalary(Salary s) {
		boolean flag = false;
		try {
			conn = this.getConn();
			String sql = "update salary set uid='" + s.getUid() + "',uname='"
					+ s.getUname() + "',post='" + s.getPost() + "',worktime1='"
					+ s.getWorktime1() + "' ,worktime2='" + s.getWorktime2()
					+ "' ,account = '" + s.getAccount() + "' ,salary = "
					+ s.getSalary() + " ,s_oid=" + s.getS_oid() + " where sid="
					+ s.getSid();
			ps = conn.prepareStatement(sql);
			int a = ps.executeUpdate();
			if (a > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return flag;
	}

	// 查询审核信息
	public List<Checks> findchecks() {
		List<Checks> list = new ArrayList<Checks>();
		try {
			String sql = "select uid,pid,chid from checks";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Checks c = new Checks();
				c.setUid(rs.getInt(1));
				c.setPid(rs.getInt(2));
				c.setChid(rs.getInt(3));

				// 查出岗位名
				String sql1 = "select pname from post where pid="
						+ rs.getInt(2);
				stmt = conn.createStatement();
				rs1 = stmt.executeQuery(sql1);
				if (rs1.next()) {
					c.setPname(rs1.getString(1));
				}

				// 查出学生名
				String sql2 = "select uname from student where uid="
						+ rs.getInt(1);
				stmt = conn.createStatement();
				rs2 = stmt.executeQuery(sql2);
				if (rs2.next()) {
					c.setUname(rs2.getString(1));
				}

				// 查出班级
				String sql3 = "select uclass from student where uid="
						+ rs.getInt(1);
				stmt = conn.createStatement();
				rs3 = stmt.executeQuery(sql3);
				if (rs3.next()) {
					c.setUclass(rs3.getString(1));
				}

				// 查出院系
				String sql4 = "select depart from student where uid="
						+ rs.getInt(1);
				stmt = conn.createStatement();
				rs4 = stmt.executeQuery(sql4);
				if (rs4.next()) {
					c.setDepart(rs3.getString(1));
				}

				// 查出学生工作时长类别
				String sql5 = "select kind from student where uid="
						+ rs.getInt(1);
				stmt = conn.createStatement();
				rs5 = stmt.executeQuery(sql5);
				if (rs5.next()) {
					c.setKind(rs5.getInt(1));
				}

				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	// 查询消息 查询所有消息
	public List<News> findNews(String uid) {
		List<News> list = new ArrayList<News>();
		try {
			String sql = "select nid,title,content,ntime from news where uid = '"+uid+"' order by ntime ";
			conn = this.getConn();
			ps = conn.prepareStatement(sql);

			rs = ps.executeQuery();
			while (rs.next()) {
				News n = new News();
				n.setNid(rs.getInt(1));
				n.setTitle(rs.getString(2));
				n.setContent(rs.getString(3));
				n.setNtime(rs.getString(4));

				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	// 修改密码
	public boolean updPwd(String uid, String pwd) {
		boolean flag = false;
		try {
			conn = this.getConn();
			String sql1 = "update student set pwd='" + pwd + "' where uid = '"
					+ uid + "' ";

			ps = conn.prepareStatement(sql1);
			int a = ps.executeUpdate();
			if (a > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return flag;
	}

	// 查询个人信息
	public List<Clerk> findMyInfo(String uid) {
		List<Clerk> list = new ArrayList<Clerk>();
		try {
			String sql = "select uname,uclass,depart,kind from student where uid = "
					+ uid;
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Clerk c = new Clerk();
				c.setUid(uid);
				c.setUname(rs.getString(1));
				c.setUclass(rs.getString(2));
				c.setDepart(rs.getString(3));
				c.setKind(rs.getInt(4));

				// 查出班级名
				String sql1 = "select cname from class where cid="
						+ rs.getString(2);
				stmt = conn.createStatement();
				rs1 = stmt.executeQuery(sql1);
				if (rs1.next()) {
					c.setCname(rs1.getString(1));
				}

				// 查出院系名
				String sql2 = "select dname from depart where id="
						+ rs.getString(3);
				stmt = conn.createStatement();
				rs2 = stmt.executeQuery(sql2);
				if (rs2.next()) {
					c.setDname(rs2.getString(1));
				}

				// 查出类别
				String sql3 = "select kind from kind where id=" + rs.getInt(4);
				stmt = conn.createStatement();
				rs3 = stmt.executeQuery(sql3);
				if (rs3.next()) {
					c.setKname(rs3.getString(1));
				}

				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

	// 根据id查询职工信息
	public Clerk findClerkById(int cid) {
		Clerk c = new Clerk();
		try {
			String sql = "select uid,uname,email from student where id= " + cid;
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				c.setId(cid);
				c.setUid(rs.getString(1));
				c.setUname(rs.getString(2));
				c.setEmail(rs.getString(3));

				// 查出所属的是长期工还是短期工
				String sql2 = "select kind from student where id=" + cid;
				stmt = conn.createStatement();
				rs1 = stmt.executeQuery(sql2);
				if (rs1.next()) {
					c.setKind(rs1.getInt(1));
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return c;
	}

	//根据kind查询适合职工的岗位 推送岗位 
	public List<Post> findRightPosts(int kind) {
		List<Post> posts = new ArrayList<Post>();
		try {
			String sql = "select pid,pname,pleaderphone,pleadername from post where kind= " + kind;
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Post p = new Post();
				p.setPid(rs.getInt(1));
				p.setPname(rs.getString(2));
				p.setPleaderphone(rs.getString(3));
				p.setPleadername(rs.getString(4));

				posts.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return posts;
	}

	
	//查询当前登录学生是否有岗位
	public boolean checkClerkIsCheked(int uid) {
		boolean flag = true;
		try {
			String sql = "select upost from student where uid= " + uid;
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				if(rs.getString(1)!=""&&rs.getString(1)!=null) {
					flag = false;
				} 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}
		return flag;
	}

	//查询我的岗位
	public List<Clerk> findMyPost(String uid) {
		List<Clerk> list = new ArrayList<Clerk>();
		try {
			String sql = "select uname,uclass,depart,kind,upost from student where uid = "
					+ uid;
			conn = this.getConn();
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				Clerk c = new Clerk();
				c.setUid(uid);
				c.setUname(rs.getString(1));
				c.setUclass(rs.getString(2));
				c.setDepart(rs.getString(3));
				c.setKind(rs.getInt(4));
				c.setUpost(rs.getString(5));

				// 查出班级名
				String sql1 = "select cname from class where cid="
						+ rs.getString(2);
				stmt = conn.createStatement();
				rs1 = stmt.executeQuery(sql1);
				if (rs1.next()) {
					c.setCname(rs1.getString(1));
				}

				// 查出院系名
				String sql2 = "select dname from depart where id="
						+ rs.getString(3);
				stmt = conn.createStatement();
				rs2 = stmt.executeQuery(sql2);
				if (rs2.next()) {
					c.setDname(rs2.getString(1));
				}

				// 查出类别
				String sql3 = "select kind from kind where id=" + rs.getInt(4);
				stmt = conn.createStatement();
				rs3 = stmt.executeQuery(sql3);
				if (rs3.next()) {
					c.setKname(rs3.getString(1));
				}

				list.add(c);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeConn();
		}

		return list;
	}

}
