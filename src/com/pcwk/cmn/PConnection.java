package com.pcwk.cmn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import org.apache.log4j.Logger;

public class PConnection {
	
	final Logger LOG = Logger.getLogger(getClass());
	// Java™ Naming and Directory (JNDI) API
	private DataSource dataSource;
	
	public PConnection(){
		// DataSource 객체생성
		
		// 이름으로 객체 접근
		try {
			Context ctx = new InitialContext();
			
			Context envContext = (Context)ctx.lookup("java://comp/env");
			LOG.debug("1. envContext : " + envContext);
			
			dataSource = (DataSource)envContext.lookup("jdbc/oracle");
			LOG.debug("2. dataSource : " + dataSource);
		} catch (NamingException e) {
			LOG.debug("=========================");
			LOG.debug("NamingException : " + e.getMessage());
			e.printStackTrace();
			LOG.debug("=========================");
		}
	}
	
	public Connection connect() {
		Connection connection = null;
		
		try {
			connection = dataSource.getConnection();
			LOG.debug("**. connection : " + connection);
		} catch (SQLException e) {
			LOG.debug("=========================");
			LOG.debug("SQLException : " + e.getMessage());
			e.printStackTrace();
			LOG.debug("=========================");
		}
		
		
		return connection;
	}
	
//	public Connection connect() {
//		
//		Connection connection = null; // DB연결 정보
//		
//		// jdbc:oracle:thin:@IP:PORT:전역DB명칭
//		String dbURL = "jdbc:oracle:thin:@192.168.3.101:1521:xe"; // URL
//		String dbUSER = "scott"; // ID
//		String dbPASS = "pcwk"; // PW
//		
//		
//		try {
//			// jdbc oracle driver load
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			
//			// DB 연결
//			connection = DriverManager.getConnection(dbURL, dbUSER, dbPASS);
//			LOG.debug("connection : " + connection);
//			
//		} catch (ClassNotFoundException e) {
//			LOG.debug("ClassNotFoundException : " + e.getMessage());
//			e.printStackTrace();
//		} catch (SQLException e) {
//			LOG.debug("SQLException : " + e.getMessage());
//			e.printStackTrace();
//		}
//		
//		return connection;
//	}
}
