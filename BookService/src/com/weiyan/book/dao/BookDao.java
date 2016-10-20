package com.weiyan.book.dao;

import java.util.ArrayList;
import com.weiyan.book.domain.Book;
import com.weiyan.book.domain.BookBrief;

public interface BookDao {
	/**
	 * 输入作者名字，查询所有他写的书
	 * @param authorName 作者名字
	 * @return 书本简介列表
	 */
	public ArrayList<BookBrief> searchBook(String authorName);
	/**
	 * 根据isbn号进行图书删除
	 * @param isbn
	 */
	public void removeBook(String isbn);
	/**
	 * 根据isbn号获取书本信息
	 * @param isbn
	 * @return
	 */
	public Book getBookInfo(String isbn);
	
	/**
	 * 更新书本信息
	 * @param authorID 新作者
	 * @param publisher 新出版社
	 * @param publishDate 新出版日期
	 * @param price 新价格
	 */
	public void updateBook(String isbn, int authorID, String publisher, String publishDate, float price);
	
	/**
	 * 添加新书本
	 * @param isbn 书本isbn号
	 * @param title 书名
	 * @param authorID 作者ID
	 * @param publisher 出版商
	 * @param publishDate 出版日期
	 * @param price 价格
	 */
	public void addBook(String isbn, String title, int authorID, 
			String publisher, String publishDate, float price);
}
