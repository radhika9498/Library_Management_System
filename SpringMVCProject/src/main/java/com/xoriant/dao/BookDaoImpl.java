package com.xoriant.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.xoriant.dto.Book;

@Component("bookDao")
public class BookDaoImpl implements BookDao{

	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;
	
	public DataSource getDataSource() {
		return dataSource;
	}

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void addBook(Book book) {
		String query = "insert into books(AccessionNumber,Title,Author,Status) values(?,?,?,?)";
		if(book.getBookStatus()==null) {
			jdbcTemplate.update(query,book.getBookAccessionNumber(),book.getBookTitle(),book.getBookAuthor(),"available");			
		}
		else {
			jdbcTemplate.update(query,book.getBookAccessionNumber(),book.getBookTitle(),book.getBookAuthor(),book.getBookStatus());
		}
		System.out.println("Record Inserted!");


	}

	@Override
	public void updateBookStatus(String bookAccNum, String status) {
		String query = "update books set status =? where AccessionNumber=?";
		jdbcTemplate.update(query,status,bookAccNum);					
		System.out.println("Record Updated!");
		
	}

	@Override
	public void deleteBook(String bookAccNum) {
		String query = "delete from books where AccessionNumber =?";
		jdbcTemplate.update(query,bookAccNum);					
		System.out.println("Record Deleted!");
		
	}

	@Override
	public List<Book> getAllBooks() { 	
		// TODO Auto-generated method stub
		String sql = "select * from books";
		
//		List<Book> books = new ArrayList<Book>();
//		books.add(new Book("A123","ABCD","ABCD","ABCD"));
//		books.add(new Book("A123","ABCD","ABCD","ABCD"));
//		books.add(new Book("A123","ABCD","ABCD","ABCD"));
//		return books;

		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Book>>() {
			public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException 
			{
				List<Book> books = new ArrayList<Book>();
				while(rs.next()) {
					Book book = new Book();
					book.setBookAccessionNumber(rs.getString(1));
					book.setBookTitle(rs.getString(2));
					book.setBookAuthor(rs.getString(3));
					book.setBookStatus(rs.getString(4));
					
					books.add(book);
				}
				
				return books;
			}
		});

//			return jdbcTemplate.query(sql, new RowMapper<Book>() {
//			
//			@Override
//			public Book mapRow(ResultSet rs, int arg1) throws SQLException {
//				Book book = new Book();
//				book.setBookAccessionNumber(String.valueOf(rs.getInt(1)));
//				book.setBookTitle(rs.getString(2));
//				book.setBookStatus(String.valueOf(rs.getDouble(3)));
//				return book;
//			}
//		});
		
	}

	@Override
	public List<Book> getBorrowedBooks() {
		String sql = "select * from books where status=\"borrowed\"";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Book>>() {
			public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException 
			{
				List<Book> books = new ArrayList<Book>();
				while(rs.next()) {
					Book book = new Book();
					book.setBookAccessionNumber(rs.getString(1));
					book.setBookTitle(rs.getString(2));
					book.setBookAuthor(rs.getString(3));
					book.setBookStatus(rs.getString(4));
					
					books.add(book);
				}
				
				return books;
			}
		});

	}

	@Override
	public List<Book> getAvailableBooks() {
		String sql = "select * from books where status=\"available\"";
		return jdbcTemplate.query(sql, new ResultSetExtractor<List<Book>>() {
			public List<Book> extractData(ResultSet rs) throws SQLException, DataAccessException 
			{
				List<Book> books = new ArrayList<Book>();
				while(rs.next()) {
					Book book = new Book();
					book.setBookAccessionNumber(rs.getString(1));
					book.setBookTitle(rs.getString(2));
					book.setBookAuthor(rs.getString(3));
					book.setBookStatus(rs.getString(4));
					
					books.add(book);
				}
				
				return books;
			}
		});
	}

}
