package com.simbaart.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "photocategory")
public class PhotoCategoryEntity extends BaseEntity{

	@Column(name="name")
	private String name;
	
	@Column(name="code")
	private String code;
	
	@OneToMany(mappedBy = "photoCategoryEntity")
	private List<PhotoPostsEntity> listPhotoPosts = new ArrayList<>();

	public List<PhotoPostsEntity> getListPhotoPosts() {
		return listPhotoPosts;
	}

	public void setListPhotoPosts(List<PhotoPostsEntity> listPhotoPosts) {
		this.listPhotoPosts = listPhotoPosts;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
}
