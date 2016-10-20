package com.weiyan.book.dao;

import java.util.Map;

public interface AuthorDao {
	/**
	 * ��ȡ������Ŀ
	 * @return ������Ŀ��ÿ�����������������id
	 */
	public Map<Integer, String> getAuthorBrief();
	
	/**
	 * ��������
	 * @param name ������
	 * @param country ����
	 * @param age ����
	 */
	public void addAuthor(String name, String country, int age);
	
}
