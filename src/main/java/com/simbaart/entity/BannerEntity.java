package com.simbaart.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;


@Entity
@Table(name = "banner")
public class BannerEntity extends BaseEntity{

	@Column(name = "image")
	private String image;
	
	@Column(name = "link")
	private String link;
	
	@CreatedDate
	@Column(name = "createddate")
	private Timestamp createdDate;

	
	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public Timestamp getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Timestamp createdDate) {
		this.createdDate = createdDate;
	}
}
