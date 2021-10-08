package com.xoriant.dao;

import java.util.List;

import com.xoriant.dto.Book;

public interface BookDao {

	public void addBook(Book book);
	public void updateBookStatus(String bookAccNum,String status);
	public void deleteBook(String bookAccNum);
	public List<Book> getAllBooks();
	public List<Book> getBorrowedBooks();
	public List<Book> getAvailableBooks();
	
}
