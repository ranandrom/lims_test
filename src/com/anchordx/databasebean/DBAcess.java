package com.anchordx.databasebean;

import java.sql.Connection; 
import java.sql.DriverManager; 
import java.sql.ResultSet; 
import java.sql.SQLException; 
import java.sql.Statement;

//import com.mysql.jdbc.Driver;

/**数据库操作类 
 * <p>Title:DBAcess </p> 
 * <p>Description:TODO </p> 
 * <p>Company: </p> 
 * @author Luzhirong 
 * @date 2017-6-7 上午
 * */ 

public class DBAcess {
	
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://120.25.193.203:3306/lim_test"; 
	private String username = "zhirong_lu"; 
	private String password = "woshengri"; 
	private Connection conn; 
	private Statement stm; 
	private ResultSet rs;
	
	//创建连接 
	public boolean createConn() { 
		boolean b = false; 
		try { 
			Class.forName(driver);// 加载Oracle驱动程序 
			conn = DriverManager.getConnection(url, username, password); 
			b = true; 
		} catch (SQLException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		}// 获取连接 
		catch (ClassNotFoundException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		} 
		return b; 
	}
	
	//修改 
	public boolean update(String sql){ 
		boolean b = false; 
		try { 
			stm = conn.createStatement(); 
			stm.execute(sql); 
			b = true; 
		} catch (SQLException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		} 
		return b; 
	}
	
	//修改数据 
	public boolean updateDB(String sql){ 
		boolean b = false; 
		try { 
			stm = conn.createStatement(); 
			int i = stm.executeUpdate(sql);
			b = true;
		} catch (SQLException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		} 
		return b; 
	}
	 
	//查询 
	public void query(String sql){ 
		try { 
			stm = conn.createStatement(); 
			rs = stm.executeQuery(sql); 
		} catch (SQLException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		} 
	}
	
	//查询并返回一个字段的数据 
	public String find(String sql){
		String data = null;
		try { 
			stm = conn.createStatement(); 
			rs = stm.executeQuery(sql);
			//System.out.println("find！");
			//next（）获取里面的内容
			while(rs.next()){
                //getString（n）获取第n列的内容,数据库中的列数是从1开始的
				//System.out.println("find: " + sql + "==="+rs.getString(1));
				data = rs.getString(1);
			}
		} catch (SQLException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		}
		return data; 
	}
 
	//判断有无数据 
	public boolean next(){ 
		boolean b = false; 
		try { 
			if(rs.next()){ 
				b = true; 
			} 
		} catch (SQLException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		} 
		return b; 
	}
	
	//获取表字段值 
	public String getValue(String field) { 
		String value = null; 
		try { 
			if (rs != null) { 
				value = rs.getString(field); 
			} 
		} catch (SQLException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		} 
		return value; 
	}
	
	//关闭连接 
	public void closeConn() { 
		try { 
			if (conn != null) { 
				conn.close(); 
			} 
		} catch (SQLException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		} 
	}
	
	//关闭statement 
	public void closeStm() { 
		try { 
			if (stm != null) { 
				stm.close(); 
			} 
		} catch (SQLException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		} 
	}
	
	//关闭ResultSet 
	public void closeRs() { 
		try { 
			if (rs != null) { 
				rs.close(); 
			} 
		} catch (SQLException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); 
		} 
	}
	
	public String getDriver() { 
		return driver; 
	}
	
	public void setDriver(String driver) { 
		this.driver = driver; 
	}
	
	public String getUrl() { 
		return url; 
	}
	
	public void setUrl(String url) { 
		this.url = url; 
	}
	
	public String getUsername() { 
		return username; 
	} 
	
	public void setUsername(String username) { 
		this.username = username; 
	} 
	
	public String getPassword() { 
		return password; 
	}
	
	public void setPassword(String password) { 
		this.password = password; 
	} 
	
	public Statement getStm() { 
		return stm; 
	}
	
	public void setStm(Statement stm) { 
		this.stm = stm; 
	}
	
	public ResultSet getRs() { 
		return rs; 
	} 
	
	public void setRs(ResultSet rs) { 
		this.rs = rs; 
	}
	
	public void setConn(Connection conn) { 
		this.conn = conn; 
	}
	
	public Connection getConn() { 
		return conn; 
	} 
} 