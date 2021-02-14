package com.simbaart.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "bio")
public class BioEntity extends BaseEntity {

	@Column(name = "content", columnDefinition = "TEXT")
	private String content;

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
