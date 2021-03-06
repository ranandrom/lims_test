package com.anchordx.businessbean;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.anchordx.databasebean.DBAcess; 
import com.anchordx.util.GenerateUUID;
import com.anchordx.util.ImageUtil;


/** 
 * <p>Title:UserBean </p> 
 * <p>Description:TODO </p> 
 * <p>Company: </p> 
 * @author Luzhirong 
 * @date 2017-6-7 上午
 * */

public class UserBean {
	
	//登录验证 
	public boolean valid(String username,String password){ 
		boolean isValid = false; 
		DBAcess db = new DBAcess(); 
		if(db.createConn()){
			//System.out.println("db.createConn()==" + db.createConn());
			String sql = "select * from p_user where username='"+username+"' and password='"+password+"'"; 
			db.query(sql); 
			if(db.next()){ 
				isValid = true; 
			} 
			db.closeRs(); 
			db.closeStm(); 
			db.closeConn(); 
		} else {
			//System.out.println("db.createConn()" + db.createConn());
		} 
		return isValid; 
	}
	
	//注册验证 
	public boolean isExist(String username){ 
		boolean isValid = false; 
		DBAcess db = new DBAcess(); 
		if(db.createConn()){ 
			String sql = "select * from p_user where username='"+username+"'"; 
			db.query(sql); 
			if(db.next()){ 
				isValid = true; 
			} 
			db.closeRs(); 
			db.closeStm(); 
			db.closeConn(); 
		} 
		return isValid; 
	}
	
	//注册用户 
	public boolean add(String username,String password,String email,String company,String Telephone,String address){ 
		boolean isValid = false; 
		DBAcess db = new DBAcess(); 
		if(db.createConn()){ 
			String sql = "insert into p_user(id,username,password,email,company,Telephone,address) values('"
						+GenerateUUID.next()
						+"','"+username+"','"+password+"','"+email
						+"','"+company+"','"+Telephone+"','"+address
						+"')"; 
			isValid = db.update(sql); 
			db.closeStm(); 
			db.closeConn(); 
		} 
		return isValid; 
	}
	
	//修改用户信息 
	/*public boolean ModifyUserInformation(String username,String email,String company,String Telephone,String address){
		//System.out.println("updatedata");
		boolean isValid = false; 
		DBAcess db = new DBAcess(); 
		if(db.createConn()){ 
			String sql = "update p_user set email='" 
						+email+"', company='"
						+company+"', Telephone='"
						+Telephone+"', address= '"
						+address+ "' where username = '"
						+username+"'"; 
			isValid = db.updateDB(sql); 
			//System.out.println("UserBean: " + isValid);
			db.closeStm(); 
			db.closeConn(); 
		} 
		return isValid; 
	}*/
	
	//修改用户信息 
	public boolean ModifyUserInformation(String username,String email,String company,String Telephone,String address){
		String user = "zhirong_lu";
		String password = "woshengri";
		String url = "jdbc:mysql://120.25.193.203:3306/lim_test?characterEncoding=utf-8";
		Connection connection = null;
		boolean isValid = true;
		try {
			connection = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String sql = "update p_user set email=?, company=?, Telephone=?, address=? where username = '"+username+"'";
		PreparedStatement preparedStatement = null;
		InputStream inputStream = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, email);
			//preparedStatement.setString(2, company);
			preparedStatement.setString(3, Telephone);
			preparedStatement.setString(4, "广州");
			inputStream = new ByteArrayInputStream(company.getBytes());
			preparedStatement.setBinaryStream(2, inputStream, inputStream.available());
			preparedStatement.execute();
			isValid = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (preparedStatement != null)
					preparedStatement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return isValid;
	}
	
	//修改密码 
	public boolean ModifyPassword(String username,String password){
		boolean isValid = false; 
		DBAcess db = new DBAcess(); 
		if(db.createConn()){ 
			String sql = "update p_user set password = '"+password+"' where username = '"+username+"'"; 
			isValid = db.updateDB(sql); 
			//System.out.println("UserBean: " + isValid);
			db.closeStm(); 
			db.closeConn(); 
		} 
		return isValid; 
	}
	
	//查找数据 
	public String findData(String username, String data){
		//System.out.println("findData");
		String isValid = null; 
		DBAcess db = new DBAcess(); 
		if(db.createConn()){ 
			String sql = "select "+data+" from p_user where username='"+username+"'";
			//String sql = "select * from p_user";
			//String sql = "select email from p_user where username='anchordx'";
			isValid = db.find(sql); 
			//System.out.println("isValid: " + isValid);
			db.closeRs(); 
			db.closeStm(); 
			db.closeConn(); 
		} 
		return isValid; 
	}
	
}
