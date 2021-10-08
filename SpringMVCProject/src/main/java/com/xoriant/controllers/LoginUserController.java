package com.xoriant.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.xoriant.dao.BookDao;
import com.xoriant.dto.Book;

@Controller
public class LoginUserController {

	ModelAndView modelAndView;
	
	@RequestMapping(value="/loginuser" , method = RequestMethod.GET)
	public ModelAndView getLoginForm() {
		ModelAndView modelAndView = new ModelAndView("loginuser");
		return modelAndView;
	}

	@RequestMapping(value="/submitLogin" , method = RequestMethod.POST)
	public String loginUser(@RequestParam("uname") String user, @RequestParam("pwrd") String password, @RequestParam("user") String memberType) {
		
		//Check Credentials Here
		
		if(memberType.equals("librarian")) {
			return "redirect:/homepage-librarian";
		}
		else {
			return "redirect:/homepage-member";
		}
	}

	@RequestMapping(value="/homepage-librarian")
	public ModelAndView homePageLibrarian() {

		modelAndView = new ModelAndView("librarian_homepage");
		try {
				ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
				BookDao dao = (BookDao) context.getBean("bookDao");

				List<Book> books = new ArrayList<Book>();
				for (Book book : dao.getAllBooks()) {
					books.add(book);
				}
				
				modelAndView.addObject("listBooks",books);
			}catch (Exception e) {
				e.printStackTrace();}
			return modelAndView;
		}

	@RequestMapping(value="/homepage-member")
	public ModelAndView homePageMember() {

		modelAndView = new ModelAndView("member_homepage");
		try {
				ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
				BookDao dao = (BookDao) context.getBean("bookDao");

				List<Book> allBooks = new ArrayList<Book>();
				
				for (Book b : dao.getBorrowedBooks()) {
					allBooks.add(b);
				}
							
				modelAndView.addObject("books",allBooks);

			}catch (Exception e) {
				e.printStackTrace();
			}

			return modelAndView;
		}

}


