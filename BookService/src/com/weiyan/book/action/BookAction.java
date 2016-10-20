package com.weiyan.book.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.weiyan.book.dao.AuthorDao;
import com.weiyan.book.dao.AuthorDaoImpl;
import com.weiyan.book.dao.BookDao;
import com.weiyan.book.dao.BookDaoImpl;
import com.weiyan.book.domain.Book;
import com.weiyan.book.domain.BookBrief;

public class BookAction extends ActionSupport {

	private List<BookBrief> bookList;
	private Map<Integer, String> authList;
	private String authorName;
	private Book book;
	BookDao bookDao = new BookDaoImpl();
	AuthorDao authDao = new AuthorDaoImpl();
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String getBookBrief(){
		setBookList(bookDao.searchBook(authorName));
		return SUCCESS;
	}
	
	public String removeBook(){
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		String isbn = request.getParameter("isbn");

		bookDao.removeBook(isbn);
		getBookBrief();
		return SUCCESS;
	}
	
	public String getBookInfo(){
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		String isbn = request.getParameter("isbn");
		
		book = bookDao.getBookInfo(isbn);
		setAuthList(authDao.getAuthorBrief());
		return SUCCESS;
	}
	
	public String updateBook(){
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		String isbn = request.getParameter("isbn");
		try{
			int authorID = Integer.parseInt(request.getParameter("authorid"));
			String publisher = request.getParameter("publisher");
			String publishDate = request.getParameter("publishdate");
			float price = Float.parseFloat(request.getParameter("price"));
			bookDao.updateBook(isbn, authorID, publisher, publishDate, price);
		}catch(NumberFormatException e){
			e.printStackTrace();
			return ERROR;
		}
		getBookInfo();
		return SUCCESS;
	}

	public List<BookBrief> getBookList() {
		return bookList;
	}

	public void setBookList(List<BookBrief> bookList) {
		this.bookList = bookList;
	}


	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Map<Integer, String> getAuthList() {
		return authList;
	}

	public void setAuthList(Map<Integer, String> authList) {
		this.authList = authList;
	}

}
