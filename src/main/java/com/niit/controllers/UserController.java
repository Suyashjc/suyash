package com.niit.controllers;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.DAO.UserDAO;
import com.niit.model.UserDetails;

@Controller
public class UserController
{
	
	@Autowired
	UserDAO userDAO;
	
	@RequestMapping(value="/Register")
	public String m3(Model m)
	{
	UserDetails userdetails=new UserDetails();
	m.addAttribute("userdetails",userdetails);
	return "Register";	
	}

	@RequestMapping(value="/InsertUser" , method = RequestMethod.POST)
	public String insertUser(@ModelAttribute("userdetails")UserDetails userdetails,Model m)
	{
		UserDetails userdetails1=new UserDetails();
		m.addAttribute(userdetails1);
		userdetails.setEnable(true);
		userdetails.setRole("ROLE_USER");
		userDAO.addUser(userdetails);
		return"Home";
	}
	
	@RequestMapping("/Login_success")
	public String showHomePage(HttpSession session,Model m)
	{
	
	String page="";
	boolean loggedIn=false;
	
	SecurityContext securityContext=SecurityContextHolder.getContext();
	Authentication authentication=securityContext.getAuthentication();
	
	String username=authentication.getName();
	
	Collection<GrantedAuthority> roles=(Collection<GrantedAuthority>)authentication.getAuthorities();
	
	for(GrantedAuthority role:roles)
	{
		session.setAttribute("role", role);
		
		if(role.getAuthority().equals("ROLE_ADMIN"))
		{
			loggedIn=true;
			page="AdminHome";
			session.setAttribute("loggedIn", loggedIn);
			session.setAttribute("username", username);
		}
		else
		{
			loggedIn=true;
			page="UserHome";
			session.setAttribute("loggedIn", loggedIn);
			session.setAttribute("username", username);
		}
	}
	return page;
	}
	
	@RequestMapping("/Login_Error")
	public String showError()
	{
		return "Error";
	}
}
