package com.simbaart.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "blogcategory")
public class BlogCategoryEntity extends BaseEntity{
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "code")
	private String code;

	@OneToMany(mappedBy = "blogCategoryEntity")
	private List<BlogPostsEntity> listBlogPosts = new ArrayList<>();
	
	public List<BlogPostsEntity> getListBlogPosts() {
		return listBlogPosts;
	}

	public void setListBlogPosts(List<BlogPostsEntity> listBlogPosts) {
		this.listBlogPosts = listBlogPosts;
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
