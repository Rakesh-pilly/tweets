package com.developer.app;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@EnableWebSecurity
public class SpringSecurity extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {

		auth.jdbcAuthentication().dataSource(dataSource)
				.usersByUsernameQuery("select username, password , enabled from users where username = ?")
				.authoritiesByUsernameQuery("select username, authority from users where username = ?")

		;

//		auth.inMemoryAuthentication()
//		.withUser("rakesh")
//		.password("123")
//		.roles("USER")
//		.and()
//		.withUser("admin")
//		.password("123")
//		.roles("ADIMN")
//		;

		;
	}

	@Bean
	public PasswordEncoder getPasswordEncoder() {

		return NoOpPasswordEncoder.getInstance();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.csrf().disable().authorizeRequests().antMatchers(HttpMethod.POST, "/users").permitAll()
		.antMatchers("/**").hasAnyRole("ROLE_USER","USER")
		
		.and().formLogin().loginPage("/login").permitAll().and().httpBasic();

		;

	}

}
