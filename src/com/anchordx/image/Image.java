package com.anchordx.image;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.anchordx.util.ImageUtil;

public class Image {
	
	public int InsertImage(String filename, String field, String username) {
		String driver = "com.mysql.jdbc.Driver";
		int i = -1;
		try	{
			Class.forName(driver).newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String user = "zhirong_lu";
		String password = "woshengri";
		String url = "jdbc:mysql://120.25.193.203:3306/lim_test?characterEncoding=utf-8";
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		PreparedStatement preparedStatement = null;
		InputStream inputStream = null;
		inputStream = ImageUtil.getImageByte(filename);
		try {
			String sql = "update p_user set "+field+"=? where username='"+username+"'";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setBinaryStream(1, inputStream, inputStream.available());
			preparedStatement.execute();
			i = 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			 try {
				if (inputStream != null)
					inputStream.close();
			}catch (IOException e) {
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
		}
		return i;
	}
	
	public int GetImage(String filename, String field, String username) {
		int i = -1;
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		String user = "zhirong_lu";
		String password = "woshengri";
		String url = "jdbc:mysql://120.25.193.203:3306/lim_test?characterEncoding=utf-8";
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		Statement statement = null;
		ResultSet resultSet = null;
		InputStream inputStream = null;
		try	{
			statement = connection.createStatement();
			String sql = "select p."+field+" from p_user p where username='"+username+"'";
			resultSet = statement.executeQuery(sql);
			resultSet.next();
			inputStream = resultSet.getBinaryStream(field);
			ImageUtil.readBlob(inputStream, filename);
			i = 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (inputStream != null)
					inputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}finally {
				try {
					if (resultSet != null)
						resultSet.close();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					if (statement != null)
						if (statement != null)
							try {
								statement.close();
							} catch (SQLException e) {
								e.printStackTrace();
							} finally {
								if (connection != null)
									try {
										connection.close();
									} catch (SQLException e) {
										e.printStackTrace();
									}
							}
				}
			}
		}
		return i;
	}
}