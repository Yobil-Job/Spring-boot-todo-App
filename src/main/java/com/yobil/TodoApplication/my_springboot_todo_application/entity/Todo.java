package com.yobil.TodoApplication.my_springboot_todo_application.entity;

import java.time.LocalDate;


import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.validation.constraints.FutureOrPresent;
import jakarta.validation.constraints.Size;

@Entity
public class Todo {
	
	@Id
	@GeneratedValue
	private int id;
	
	private String userName;
	//private String password;
	
	@Size(min = 10, max = 50 ,message = "Number of characters should be Between 50")
	private String description;
	
	@FutureOrPresent(message = "Please select present or future time")
	private LocalDate targetDate;
	private String priority;
	private boolean done;
	
	public Todo() {}
	
	public Todo( String userName, String description, LocalDate targetDate, String priority, boolean done) {
		super();
		//this.id = id;
		this.userName = userName;
		this.description = description;
		this.targetDate = targetDate;
		this.priority = priority;
		this.done = done;
	}

	public int getId() {
		return id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDate getTargetDate() {
		return targetDate;
	}

	public void setTargetDate(LocalDate targetDate) {
		this.targetDate = targetDate;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public boolean isDone() {
		return done;
	}

	public void setDone(boolean done) {
		this.done = done;
	}

	@Override
	public String toString() {
		return "Todo [id=" + id + ", userName=" + userName + ", description=" + description + ", targetDate="
				+ targetDate + ", priority=" + priority + ", done=" + done + "]";
	}
	
	

}
