package com.yobil.TodoApplication.my_springboot_todo_application.controller;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yobil.TodoApplication.my_springboot_todo_application.entity.Todo;
import com.yobil.TodoApplication.my_springboot_todo_application.repository.TodoRepository;

@Controller
public class TodoController {
	
	private TodoRepository todoRepository;

	public TodoController(TodoRepository todoRepository) {
		super();
		this.todoRepository = todoRepository;
	}
	
	
	private String getLoginDetail() {
		return SecurityContextHolder.getContext().getAuthentication().getName();
		
	}
	
	@GetMapping("/")
	public String showWelcomePage(ModelMap model) {
		
		model.put("name",getLoginDetail());
		return "welcome";	
		
	}
	
	@GetMapping("/manage-todo")
	public String showManageTodoPage(ModelMap model) {
		List<Todo> todoes=todoRepository.findByuserName(getLoginDetail());
		model.addAttribute("todoes",todoes);
		return "manageTodo";
		
		
	}
	
	@GetMapping("/add-todo")
   public String showAddTodoPage(ModelMap model) {
		Todo todo=new Todo(getLoginDetail(),"",LocalDate.now(),"High",false);
		model.addAttribute("todo",todo);
	   return "addTodo";
	   
   }
	
	@PostMapping("/add-todo")
	   public String addTodoPage(ModelMap model,Todo todo) {
			
		  //todo.setUserName(getLoginDetail());
			todoRepository.save(todo);
			
		   return "redirect:manage-todo";
		   
	   }
	@GetMapping("/delete")
	public String deleteTodo(@RequestParam int id) {
		todoRepository.deleteById(id);
		return "redirect:manage-todo";
		
	}
	 
	@GetMapping("/update")
	public String showUpdatePage(@RequestParam int id,ModelMap model) {
		Optional<Todo> todoo=todoRepository.findById(id);
		model.addAttribute("todo",todoo);
		return "addTodo";
		
	}
	
	@PostMapping("/update")
	public String updateTodo(ModelMap model,Todo todo,@RequestParam int id) {
		todoRepository.deleteById(id);
		todoRepository.save(todo);
		
		   return "redirect:manage-todo";
	}
	

}
