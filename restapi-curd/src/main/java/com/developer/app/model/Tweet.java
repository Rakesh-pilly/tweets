package com.developer.app.model;


import java.util.ArrayList;
import java.util.List;



public class Tweet {
	
	private int tweet_id;
	private String tweets;
	private String username;
	private int user_id;
	
	
	public Tweet() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Tweet(int tweet_id, String tweets, int user_id) {
		super();
		this.tweet_id = tweet_id;
		this.tweets = tweets;
		
		this.user_id = user_id;
	}


	public int getTweet_id() {
		return tweet_id;
	}


	public void setTweet_id(int tweet_id) {
		this.tweet_id = tweet_id;
	}


	public String getTweets() {
		return tweets;
	}


	public void setTweets(String tweets) {
		this.tweets = tweets;
	}


	public int getUser_id() {
		return user_id;
	}


	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}
	
	
	
	
	
	
	
	
	

}
