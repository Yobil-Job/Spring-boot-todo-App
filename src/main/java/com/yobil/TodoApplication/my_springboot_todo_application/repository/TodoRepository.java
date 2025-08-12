package com.yobil.TodoApplication.my_springboot_todo_application.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.yobil.TodoApplication.my_springboot_todo_application.entity.Todo;


@Repository 
public interface TodoRepository extends JpaRepository<Todo, Integer> {
	
	public List<Todo> findByuserName(String userName);
	

}

