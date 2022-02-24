package com.developer.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.developer.app.model.User;

@RestController
public class UserController {
	@Autowired
	private JdbcTemplate jdbctemplate;

	@GetMapping("/users")
	public List<User> getId() {
		
		List<User> users = null;
		try {
			
			users = this.jdbctemplate.query("SELECT * FROM users", new BeanPropertyRowMapper(User.class));

			System.out.println(this.jdbctemplate.query("SELECT * FROM users", new BeanPropertyRowMapper(User.class)));
			
			return users;
		}

		catch (Exception e) {
			System.out.println(e);
		}

		return users;
	}
	

	
	@GetMapping("/users/{id}")
	public List getUserById(@PathVariable("id") String id) {
		
		List user = null;
		
		try {
			 
			user = this.jdbctemplate.query("select * from users where username = '"+id+"';",new BeanPropertyRowMapper(User.class));
			
			System.out.println(this.jdbctemplate.query("select * from users where user_id = 1",new BeanPropertyRowMapper(User.class)));
			 
		
			return user;
		}
		catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		
		}
		
		return user;
		
	}
	

	
	
	
	@PutMapping("/users/{id}")
	public String updateUser(@PathVariable("id") int id, @RequestBody User user) { 

		try {
			this.jdbctemplate.update("UPDATE users SET username = '"+user.getUsername()+"', email = '"+user.getEmail()+"',password = '"+user.getPassword()+"'  WHERE user_id = "+id+";");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}

		return "user created by the id " ;
	}
	
	@PostMapping("/users")
	public String homepage(@RequestBody User user) {
		
		System.out.println(user.getEmail());

		try {
			String query = "insert into users (username,password,email) values ('"+user.getUsername()+"','"+user.getPassword()+"','"+user.getEmail()+"');";
			this.jdbctemplate.update(query);

		} catch (Exception e) {
			System.out.println(e);
		}

		return "updted users succesfull";

	}
	
	
	@DeleteMapping("/users/{id}")
	public String deleteUser(@PathVariable("id") String id) {

		try {
			this.jdbctemplate.update("delete from users where user_id =" + id + ";");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}

		return "delete user susscfully";
	}
	


}
