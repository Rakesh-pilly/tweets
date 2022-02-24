package com.developer.app.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LikesController {
	@Autowired
	private JdbcTemplate jdbctemplate;

	
	
	@GetMapping("/likes/tweets/{id}")
	public List getLikesTweets(@PathVariable int id) {
		
		
		List count = this.jdbctemplate.queryForList("select count(*) from likes where tweet_id = "+id+";");
		
//		System.out.println( this.jdbctemplate.queryForList("select count(*) from likes;"));
		
		return count;
	}
	
	@GetMapping("/likes/{id}/{tid}")
	public List getLikesByuser(@PathVariable int id, @PathVariable int tid) {
		
		
		List count = this.jdbctemplate.queryForList("select count(*) from likes where tweet_id = "+tid+" and user_id = "+id+";");
		
//		System.out.println( this.jdbctemplate.queryForList("select count(*) from likes;"));
		
		return count;
	}
	
	@PostMapping("/likes/{id}/{tid}")
	public String updateLike(@PathVariable int id, @PathVariable int tid) {
		
		
		this.jdbctemplate.update("insert into likes (tweet_id, user_id) values ("+tid+" , "+id+") ;");
		
		return "created susscfully";
	}
	
	@DeleteMapping("/likes/{id}/{tid}")
	public String deletLike(@PathVariable int id , @PathVariable int tid) {
		
		
		this.jdbctemplate.update("delete from likes where tweet_id = "+tid+" and user_id = "+id+" ;");
		
		return "like deleted";
	}

}
