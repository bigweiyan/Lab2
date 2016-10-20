package com.weiyan.book.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.weiyan.book.sql.DataBaseConnector;

public class AuthorDaoImpl implements AuthorDao {
	DataBaseConnector conn = new DataBaseConnector();
	private static final String SEARCH_SQL = "SELECT authorid, name FROM author";
	private static final String INSERT_SQL = "INSERT INTO author(name,age,country) VALUES (?,?,?)";
	
	@Override
	public Map<Integer, String> getAuthorBrief() {
		Map<Integer, String> authList = new HashMap<Integer, String>();
		conn.ConnectDataBase();
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try{
			pst = conn.connect.prepareStatement(SEARCH_SQL);
			rs = pst.executeQuery();
			
			while(rs.next()){
				authList.put(rs.getInt(1), rs.getString(2));
			}
			pst.close();
		}catch(SQLException e){
			e.printStackTrace();
		}

		return authList;
	}

	@Override
	public void addAuthor(String name, String country, int age) {
		conn.ConnectDataBase();
		PreparedStatement pst = null;
		
		try{
			pst = conn.connect.prepareStatement(INSERT_SQL);
			pst.setString(1, name);
			pst.setInt(2, age);
			pst.setString(3, country);
			pst.executeUpdate();
			pst.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

}
