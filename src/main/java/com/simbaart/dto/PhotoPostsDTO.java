package com.simbaart.dto;

import java.sql.Timestamp;

public class PhotoPostsDTO extends AbstractDTO<PhotoPostsDTO> {

	private String title;
	private String image;
	private String base64;
	private String description;
	private Timestamp createdDate;
	private Long photoCategoryId;

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

	public Long getPhotoCategoryId() {
		return photoCategoryId;
	}

	public void setPhotoCategoryId(Long photoCategoryId) {
		this.photoCategoryId = photoCategoryId;
	}

	public String getBase64() {
		return base64;
	}

	public void setBase64(String base64) {
		this.base64 = base64;
	}

}
