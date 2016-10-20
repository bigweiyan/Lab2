package com.weiyan.book.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.weiyan.book.domain.Book;
import com.weiyan.book.domain.BookBrief;
import com.weiyan.book.sql.DataBaseConnector;

public class BookDaoImpl implements BookDao {
	DataBaseConnector conn = new DataBaseConnector();
	private static final String SEARCH_SQL = "SELECT isbn, title FROM book NATURAL JOIN author WHERE name = ?";
	private static final String DELETE_SQL = "DELETE FROM book WHERE isbn = ?";
	private static final String INFO_SQL = "SELECT title, publisher, authorid, publishdate, price, name, age, country FROM book NATURAL JOIN author WHERE isbn = ?";
	private static final String UPDATE_SQL = "UPDATE book SET authorid=?, publisher=?, publishdate=?, price=? WHERE isbn=?;";
	private static final String INSERT_SQL = "INSERT INTO book(isbn,title,authorid,publisher,publishdate,price) VALUES (?,?,?,?,?,?)";
	
	@Override
	public ArrayList<BookBrief> searchBook(String authorName) {

		ArrayList<BookBrief> bookList = new ArrayList<BookBrief>();
		conn.ConnectDataBase();
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try{
			pst = conn.connect.prepareStatement(SEARCH_SQL);
			pst.setString(1, authorName);
			rs = pst.executeQuery();
			
			while(rs.next()){
				BookBrief brief = new BookBrief();
				brief.setIsbn(rs.getString(1));
				brief.setTitle(rs.getString(2));
				bookList.add(brief);
			}
			pst.close();
		}catch(SQLException e){
			e.printStackTrace();
		}

		return bookList;
	}

	@Override
	public void removeBook(String isbn) {
		conn.ConnectDataBase();
		PreparedStatement pst = null;
		
		try{
			pst = conn.connect.prepareStatement(DELETE_SQL);
			pst.setString(1, isbn);
			pst.executeUpdate();
			pst.close();
		}catch(SQLException e){
			e.printStackTrace();
		}

	}

	@Override
	public Book getBookInfo(String isbn) {
		Book book = new Book();
		conn.ConnectDataBase();
		PreparedStatement pst = null;
		ResultSet rs = null;
		
		try{
			pst = conn.connect.prepareStatement(INFO_SQL);
			pst.setString(1, isbn);
			rs = pst.executeQuery();
			
			while(rs.next()){
				book.setIsbn(isbn);
				book.setTitle(rs.getString("title"));
				book.setPublisher(rs.getString("publisher"));
				book.setAuthorID(rs.getInt("authorid"));
				book.setAge(rs.getInt("age"));
				book.setPrice(rs.getFloat("price"));
				book.setCountry(rs.getString("country"));
				book.setPublishDate(rs.getString("publishdate"));
				book.setName(rs.getString("name"));
			}
			pst.close();
		}catch(SQLException e){
			e.printStackTrace();
		}

		return book;
	}

	@Override
	public void updateBook(String isbn, int authorID, String publisher, String publishDate, float price) {
		conn.ConnectDataBase();
		PreparedStatement pst = null;
		
		try{
			pst = conn.connect.prepareStatement(UPDATE_SQL);
			pst.setInt(1, authorID);
			pst.setString(2, publisher);
			pst.setString(3, publishDate);
			pst.setFloat(4, price);
			pst.setString(5, isbn);
			pst.executeUpdate();
			pst.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

	@Override
	public void addBook(String isbn, String title, int authorID, String publisher, String publishDate, float price) {
		conn.ConnectDataBase();
		PreparedStatement pst = null;
		
		try{
			pst = conn.connect.prepareStatement(INSERT_SQL);
			pst.setString(1, isbn);
			pst.setString(2, title);
			pst.setInt(3, authorID);
			pst.setString(4, publisher);
			pst.setDate(5, Date.valueOf(publishDate));
			pst.setFloat(6, price);
			pst.executeUpdate();
			pst.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
	}

}
