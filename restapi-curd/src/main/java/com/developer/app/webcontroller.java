package com.developer.app;

import org.springframework.security.core.Authentication;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.Mapping;

@Controller
public class webcontroller {

	@GetMapping("/")
	public String home(Authentication authentication, ModelMap model) {
		System.out.println(authentication.getName());
		System.out.println(authentication.getAuthorities() );
		
		model.addAttribute("usesr_name",authentication.getName() );
		
		return "home";
	}
	@GetMapping("/edituser")
	public String edituser(Authentication authentication, ModelMap model) {
		model.addAttribute("usesr_name",authentication.getName() );
		return "edituser";

	}
	

	@GetMapping("/login")
	public String login() {

		return "login";

	}

}
