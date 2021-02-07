package com.simbaart.dto;

import java.sql.Timestamp;

public class BannerDTO extends AbstractDTO<BannerDTO>{

	private String image;
	private String link;
	private Timestamp createdDate;

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

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}
}
