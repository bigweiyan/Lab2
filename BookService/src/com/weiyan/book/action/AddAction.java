package com.weiyan.book.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.weiyan.book.dao.AuthorDao;
import com.weiyan.book.dao.AuthorDaoImpl;
import com.weiyan.book.dao.BookDao;
import com.weiyan.book.dao.BookDaoImpl;

public class AddAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6891608430185209822L;
	private Map<Integer, String> authList;
	BookDao bookDao = new BookDaoImpl();
	AuthorDao authDao = new AuthorDaoImpl();
	
	public String getAuthors(){
		setAuthList(authDao.getAuthorBrief());
		return SUCCESS;
	}
	
	public String addBook(){
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		try{
			String isbn = request.getParameter("isbn");
			int authorID = Integer.parseInt(request.getParameter("authorid"));
			String title = request.getParameter("title");
			String publisher = request.getParameter("publisher");
			String publishDate = request.getParameter("publishDate");
			float price = Float.parseFloat(request.getParameter("price"));
			bookDao.addBook(isbn, title, authorID, publisher, publishDate, price);
		}catch(NumberFormatException e){
			e.printStackTrace();
			setAuthList(authDao.getAuthorBrief());
			return ERROR;
		}
		return SUCCESS;
	}
	
	public String addAuthor(){
		HttpServletRequest request = (HttpServletRequest) ActionContext.getContext().get(ServletActionContext.HTTP_REQUEST);
		try{
			String name = request.getParameter("name");
			int age = Integer.parseInt(request.getParameter("age"));
			String country = request.getParameter("country");
			authDao.addAuthor(name, country, age);
		}catch(NumberFormatException e){
			e.printStackTrace();
			return ERROR;
		}
		return SUCCESS;
	}

	public Map<Integer, String> getAuthList() {
		return authList;
	}

	public void setAuthList(Map<Integer, String> authList) {
		this.authList = authList;
	}
}
