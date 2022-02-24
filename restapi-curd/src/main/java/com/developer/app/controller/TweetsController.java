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

import com.developer.app.model.Tweet;

@RestController
public class TweetsController {
	
	
	@Autowired
	private JdbcTemplate jdbctemplate;
	
	
	@GetMapping("/tweets")
	public List<Tweet> getTweets() {
		
		List<Tweet> tweets = null;

		try {
			tweets = this.jdbctemplate.query("SELECT tweet_id,tweets,tweets.user_id,username FROM tweets left join users on tweets.user_id = users.user_id  order by tweet_id desc", new BeanPropertyRowMapper(Tweet.class));

			System.out.println(this.jdbctemplate.query("SELECT tweet_id,tweets,tweets.user_id,username FROM tweets left join users on tweets.user_id = users.user_id", new BeanPropertyRowMapper(Tweet.class)));
			
			

		}

		catch (Exception e) {
			System.out.println(e);
		}

		return tweets;
	}
	
	
	
	@GetMapping("/tweets/{id}")
	public List<Tweet> tweetById(@PathVariable("id") String id) {

			List<Tweet> tweet = null;
		try {
			
			
			tweet = this.jdbctemplate.query("SELECT tweet_id,tweets,tweets.user_id,username FROM tweets left join users on tweets.user_id = users.user_id where tweet_id ="+id+";",
					new BeanPropertyRowMapper(Tweet.class));

			System.out.println(this.jdbctemplate.query("SELECT tweet_id,tweets,tweets.user_id,username FROM tweets left join users on tweets.user_id = users.user_id where tweet_id ="+id+";",
					new BeanPropertyRowMapper(Tweet.class)));
			
			

		} catch (Exception e) {
			// TODO: handle exception

			System.out.println(e);
		}

		return tweet;

	}
	
	
	@PostMapping("/tweets")
	public String postTweet(@RequestBody Tweet tweet) {

		
		System.out.println("post is called");
		try {
			String query = "insert into tweets (tweets, user_id) values ('"+tweet.getTweets()+"',"+tweet.getUser_id()+");";
			this.jdbctemplate.update(query);

		} catch (Exception e) {
			System.out.println(e);
		}

		return "updted succesfull";

	}

	
	
	
	
	

	@PutMapping("/tweets/{id}")
	public String updateTweets(@PathVariable("id") int id , @RequestBody Tweet tweet) {
		System.out.println(tweet.getTweets());

		try {
			this.jdbctemplate.update("UPDATE tweets SET tweets = '"+tweet.getTweets()+"' WHERE tweet_id = "+id+";");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}

		return "updated the tweet";
	}


	@DeleteMapping("/tweets/{id}")
	public String deleteTweet(@PathVariable("id") String id) {

		try {
			this.jdbctemplate.update("delete from tweets where tweet_id =" + id + ";");

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}

		return "delete tweet susscfully";
	}



}
