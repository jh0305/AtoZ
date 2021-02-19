package com.spring.AtoZ.exception;

import java.sql.SQLException;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionControllerAdvisor {
	@ExceptionHandler(NotFoundIdException.class)
	public ModelAndView notFoundIdException(Exception e) {
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("exception/notfoundid");
		mnv.addObject("message", e);
		return mnv;
	}
	
	@ExceptionHandler(MissingPasswordException.class)
	public ModelAndView missingPwdException(Exception e) {
		ModelAndView mnv = new ModelAndView();
		mnv.setViewName("exception/missingpassword");
		mnv.addObject("message", e);
		return mnv;
	}
	
	@ExceptionHandler(SQLException.class)
	public ModelAndView sqlException(Exception e) {
		ModelAndView mnv = new ModelAndView();
		return mnv;
	}
}
