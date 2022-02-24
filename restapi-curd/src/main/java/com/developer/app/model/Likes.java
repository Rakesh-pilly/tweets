package com.developer.app.model;

public class Likes {

	
	private int tweet_id;
	private int user_id;
	
	
	
	public Likes() {
		super();
		// TODO Auto-generated constructor stub
	}



	public Likes(int tweet_id, int user_id) {
		super();
		this.tweet_id = tweet_id;
		this.user_id = user_id;
	}



	public int getTweet_id() {
		return tweet_id;
	}



	public void setTweet_id(int tweet_id) {
		this.tweet_id = tweet_id;
	}



	public int getUser_id() {
		return user_id;
	}



	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	
	
	
}
