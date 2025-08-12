package com.yobil.TodoApplication.my_springboot_todo_application.security;

import static org.springframework.security.config.Customizer.withDefaults;

import java.util.function.Function;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfiguration {
	
	
	
	@Bean
	public InMemoryUserDetailsManager userDetails() {
		
		
		
		Function<String, String> passwordEncoder=
				input->passwordEncoder().encode(input);
		
		UserDetails user=User.builder()
				.passwordEncoder(passwordEncoder)
				.username("Eyob")
				.password("Eyob")
				.roles("USER")
				.build();
		
				
		return new InMemoryUserDetailsManager (user);
				
				
	}

	@Bean
	public PasswordEncoder passwordEncoder(){
	return new BCryptPasswordEncoder();
	}

	@Bean
	public SecurityFilterChain filterchin(HttpSecurity http) throws Exception {
		http.authorizeHttpRequests(auth -> auth.anyRequest().authenticated());
		http.formLogin(withDefaults());

		http.csrf(csrf -> csrf.disable());
		http
	    .csrf(csrf -> {}) // default enable, empty config
	    .logout(logout -> logout
	        .logoutUrl("/logout")
	    );


		http.headers(headers -> headers.frameOptions(frame -> frame.disable()));

		return http.build();
	}

}
