package com.xoriant.controllers;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.xoriant.dao.BookDao;
import com.xoriant.dao.MemberDao;
import com.xoriant.dao.TransactionDao;
import com.xoriant.dto.Book;
import com.xoriant.dto.Member;
import com.xoriant.dto.Transaction;

@Controller
public class FunctionsController {

	ModelAndView modelAndView;
	
	@RequestMapping(value="/addBook" ,method = RequestMethod.POST)
	public String addBook(@RequestParam("accessionNumber") String num,@RequestParam("title") String title,
			@RequestParam("author") String author,@RequestParam("status") String status) {

		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		BookDao dao = (BookDao) context.getBean("bookDao");

		dao.addBook(new Book(num,title,author,status));
		
		return "redirect:/homepage-librarian";
	}
	
	@RequestMapping(value="/updateBook" ,method = RequestMethod.POST)
	public String updateBook(@RequestParam("accessionNumber") String num,@RequestParam("status") String status) {

		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		BookDao dao = (BookDao) context.getBean("bookDao");

		dao.updateBookStatus(num, status);
		
		return "redirect:/homepage-librarian";
	}
	
	@RequestMapping(value="/deleteBook" ,method = RequestMethod.POST)
	public String deleteBook(@RequestParam("accessionNumber") String num) {

		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		BookDao dao = (BookDao) context.getBean("bookDao");

		dao.deleteBook(num);
		
		return "redirect:/homepage-librarian";
	}
	
	@RequestMapping(value="/addMember" ,method = RequestMethod.POST)
	public String addMember(@RequestParam("memberName") String name,
				@RequestParam("memberAddress") String address,@RequestParam("memberType") String type,@RequestParam("password") String password) {

		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		MemberDao dao = (MemberDao) context.getBean("memberDao");

		dao.addMember(new Member(name, address, type, password));
		
		return "redirect:/homepage-librarian";
	}
	
	@RequestMapping(value="/updateMember" ,method = RequestMethod.POST)
	public String updateMember(@RequestParam("memberId") int id,@RequestParam("memberAddress") String address) {

		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		MemberDao dao = (MemberDao) context.getBean("memberDao");

		dao.updateMemberAddress(id, address);
		
		return "redirect:/homepage-librarian";
	}
	
	@RequestMapping(value="/deleteMember" ,method = RequestMethod.POST)
	public String deleteMember(@RequestParam("memberId") int id) {

		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		MemberDao dao = (MemberDao) context.getBean("memberDao");

		dao.deleteMember(id);
		
		return "redirect:/homepage-librarian";
	}
	
	@RequestMapping(value="/member_homepage/viewBooks" , method = RequestMethod.POST)
	public ModelAndView viewBooksByColumn(@RequestParam("viewBy") String viewBy, @RequestParam("title") String title,
			@RequestParam("author") String author,@RequestParam("accessionNumber") String accNum) {
		
		modelAndView = new ModelAndView("view_books");
	
		try {
				ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
				BookDao dao = (BookDao) context.getBean("bookDao");

				System.out.println(viewBy);
				System.out.println(title);
				System.out.println(author);
				System.out.println(accNum);
				
				List<Book> allBooks = new ArrayList<Book>();
				List<Book> booksByTitle = new ArrayList<Book>();
				List<Book> booksByAuthor = new ArrayList<Book>();
				List<Book> bookByAccessionNumber = new ArrayList<Book>();
				
				for (Book book : dao.getAllBooks()) {
					allBooks.add(book);

					if(viewBy.equals("title")) {
						if(book.getBookTitle().equals(title)) {
							booksByTitle.add(book);
						}
					}
					else if(viewBy.equals("author")) {
						if(book.getBookAuthor().equals(author)) {
							booksByAuthor.add(book);
						}
					}
					else if(viewBy.equals("accessionNumber")) {
						if(book.getBookAccessionNumber().equals(accNum)) {
							bookByAccessionNumber.add(book);
						}
					}

				}
				
				if(viewBy.equals("title")) {
					modelAndView.addObject("listBooks",booksByTitle);	
				}
				else if(viewBy.equals("author")) {
					modelAndView.addObject("listBooks",booksByAuthor);
				}
				else if(viewBy.equals("accessionNumber")) {
					modelAndView.addObject("listBooks",bookByAccessionNumber);
				}
								
			}catch (Exception e) {
				e.printStackTrace();}
		
			return modelAndView;
		
	}

	@RequestMapping(value="/issueBook" ,method = RequestMethod.POST)
	public String issueBook(@RequestParam("memberId") int memberId,
							@RequestParam("accessionNumber") String accessionNumber,
							@RequestParam("dueDate") Date dueDate) {
		
//		ToDo Check existing member?
//		Check the status of book if it is available
//		Is the max limit exceeded for member?
		
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		TransactionDao daoTransaction = (TransactionDao) context.getBean("transactionDao");
		BookDao daoBook = (BookDao) context.getBean("bookDao");		
		
		daoTransaction.issueBookTransaction(new Transaction(memberId,accessionNumber,dueDate));
		daoBook.updateBookStatus(accessionNumber, "borrowed");
		
		return "redirect:/homepage-librarian";
	}
	

	@RequestMapping(value="/returnBook" ,method = RequestMethod.POST)
	public String issueBook(@RequestParam("memberId") int memberId,
							@RequestParam("accessionNumber") String accessionNumber) {
		
		ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
		TransactionDao daoTransaction = (TransactionDao) context.getBean("transactionDao");
		BookDao daoBook = (BookDao) context.getBean("bookDao");		
		MemberDao daoMember = (MemberDao) context.getBean("memberDao");		

		String memberType = daoMember.getMemberDetails(memberId).getMemberType();
		
		List<Transaction> memberTransactions = new ArrayList<Transaction>();
		memberTransactions = daoTransaction.getMemberTransactions(memberId);
		
		for (Transaction transaction : memberTransactions) {
			if(transaction.getAccessionNumber().equals(accessionNumber)) {

				
				java.util.Date dueDate = new java.util.Date(transaction.getDueDate().getTime());
				java.util.Date currentDate = new java.util.Date();
				
				long diff = currentDate.getTime() - dueDate.getTime();
				int daysDifference = (int) TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
						        
					
				if(daysDifference>0 && memberType.equals("student")) {
					transaction.setFineAmount(daysDifference*1);
				}
	
				transaction.setReturnDate(new Date(currentDate.getTime()));
				transaction.setTransactionStatus("closed");
		
				daoTransaction.returnBookTransaction(transaction);
				break;
			}
		}
		
		
		daoBook.updateBookStatus(accessionNumber, "available");
		
		
		return "redirect:/homepage-librarian";
	}
	
}
	