package com.fuful.db;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JNDISessionFactory {
	public static Connection getConnection(){
			try {
				 //初始化查找命名空间  
			      Context ctx = new InitialContext();   
			      //InitialContext ctx = new InitialContext();亦可   
			      //找到DataSource,对名称进行定位java:comp/env是必须加的,后面跟你的DataSource名  
			      DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/SemesterDemo");
			      System.out.println("数据库获取得到了。。。。");
			      //取出连接  
				 return ds.getConnection();
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
			return null;
	}
	
	public static void close(Connection conn){
		try {
			if(conn!=null&&!conn.isClosed()){
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void close(PreparedStatement ps,Connection conn){
		try {
			if(ps!=null&&!ps.isClosed()){
				ps.close();
				ps = null;
			}
			if(conn!=null&&!conn.isClosed()){
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rs,PreparedStatement ps,Connection conn){
		try {
			if(rs!=null&&!rs.isClosed()){
				rs.close();
				rs = null;
			}
			if(ps!=null&&!ps.isClosed()){
				ps.close();
				ps = null;
			}
			if(conn!=null&&!conn.isClosed()){
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
