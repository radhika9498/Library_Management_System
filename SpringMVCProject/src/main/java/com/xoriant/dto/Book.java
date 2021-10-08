package com.xoriant.dto;

public class Book {

	private String bookAccessionNumber;
	private String bookTitle;
	private String bookAuthor;
	private String bookStatus;
	
	public Book() {
		// TODO Auto-generated constructor stub
	}
	
	public Book(String bookAccessionNumber, String bookTitle, String bookAuthor, String bookStatus) {
		super();
		this.bookAccessionNumber = bookAccessionNumber;
		this.bookTitle = bookTitle;
		this.bookAuthor = bookAuthor;
		this.bookStatus = bookStatus;
	}
	public Book(String bookAccessionNumber, String bookTitle, String bookAuthor) {
		super();
		this.bookAccessionNumber = bookAccessionNumber;
		this.bookTitle = bookTitle;
		this.bookAuthor = bookAuthor;
	}

	public String getBookAccessionNumber() {
		return bookAccessionNumber;
	}
	public void setBookAccessionNumber(String bookAccessionNumber) {
		this.bookAccessionNumber = bookAccessionNumber;
	}
	public String getBookTitle() {
		return bookTitle;
	}
	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}
	public String getBookAuthor() {
		return bookAuthor;
	}
	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}
	public String getBookStatus() {
		return bookStatus;
	}
	public void setBookStatus(String bookStatus) {
		this.bookStatus = bookStatus;
	}
	
	@Override
	public String toString() {
		return "Book [bookAccessionNumber=" + bookAccessionNumber + ", bookTitle=" + bookTitle + ", bookAuthor="
				+ bookAuthor + ", bookStatus=" + bookStatus + "]";
	}
	
	
}
