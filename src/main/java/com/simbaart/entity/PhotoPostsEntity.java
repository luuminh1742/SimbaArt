package com.simbaart.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "photoposts")
public class PhotoPostsEntity extends BaseEntity {
	@Column(name = "title")
	private String title;

	@Column(name = "image")
	private String image;

	@Column(name = "descriptopn",columnDefinition = "TEXT")
	private String description;

	@Column(name = "createddate")
	private Timestamp createdDate;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "photocategoryid")
	private PhotoCategoryEntity photoCategoryEntity;

	public PhotoCategoryEntity getPhotoCategoryEntity() {
		return photoCategoryEntity;
	}

	public void setPhotoCategoryEntity(PhotoCategoryEntity photoCategoryEntity) {
		this.photoCategoryEntity = photoCategoryEntity;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Timestamp getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}
}
