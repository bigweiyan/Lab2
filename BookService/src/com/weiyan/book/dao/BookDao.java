package com.weiyan.book.dao;

import java.util.ArrayList;
import com.weiyan.book.domain.Book;
import com.weiyan.book.domain.BookBrief;

public interface BookDao {
	/**
	 * �����������֣���ѯ������д����
	 * @param authorName ��������
	 * @return �鱾����б�
	 */
	public ArrayList<BookBrief> searchBook(String authorName);
	/**
	 * ����isbn�Ž���ͼ��ɾ��
	 * @param isbn
	 */
	public void removeBook(String isbn);
	/**
	 * ����isbn�Ż�ȡ�鱾��Ϣ
	 * @param isbn
	 * @return
	 */
	public Book getBookInfo(String isbn);
	
	/**
	 * �����鱾��Ϣ
	 * @param authorID ������
	 * @param publisher �³�����
	 * @param publishDate �³�������
	 * @param price �¼۸�
	 */
	public void updateBook(String isbn, int authorID, String publisher, String publishDate, float price);
	
	/**
	 * ������鱾
	 * @param isbn �鱾isbn��
	 * @param title ����
	 * @param authorID ����ID
	 * @param publisher ������
	 * @param publishDate ��������
	 * @param price �۸�
	 */
	public void addBook(String isbn, String title, int authorID, 
			String publisher, String publishDate, float price);
}
