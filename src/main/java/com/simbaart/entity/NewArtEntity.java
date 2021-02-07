package com.simbaart.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;

@Entity
@Table(name = "newart")
public class NewArtEntity extends BaseEntity{

	@Column(name="banner")
	private String banner;
	
	@Column(name="title")
	private String title;
	
	@Column(name="shortdescription")
	private String shortDescription;
	
	@Column(name="content",columnDefinition = "TEXT")
	private String content;
	
	@CreatedDate
	@Column(name="createddate")
	private Timestamp createdDate;
	
	@Column(name="status",columnDefinition = "bit")
	private boolean status;
	

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getBanner() {
		return banner;
	}

	public void setBanner(String banner) {
		this.banner = banner;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getShortDescription() {
		return shortDescription;
	}

	public void setShortDescription(String shortDescription) {
		this.shortDescription = shortDescription;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}
}
