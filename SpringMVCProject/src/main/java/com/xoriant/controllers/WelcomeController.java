package com.xoriant.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WelcomeController {

	@RequestMapping(value="/welcome")
	public ModelAndView getRegisterationForm() {
		
		String url = "https://www.eui.eu/Content-Types-Assets/Web-Unit/Two-library-researchers-looking-up-books-together.x6dbfd805.jpg?w=1920&h=1080";
		ModelAndView modelAndView = new ModelAndView("welcome");
		modelAndView.addObject("msg","Welcome to Library Management System!");
		modelAndView.addObject("imgURL",url);
		
		return modelAndView;
	}

}
