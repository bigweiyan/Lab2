package com.weiyan.book.dao;

import java.util.Map;

public interface AuthorDao {
	/**
	 * 获取作者条目
	 * @return 作者条目，每个对象包含作者与其id
	 */
	public Map<Integer, String> getAuthorBrief();
	
	/**
	 * 新增作者
	 * @param name 作者名
	 * @param country 国籍
	 * @param age 年龄
	 */
	public void addAuthor(String name, String country, int age);
	
}
