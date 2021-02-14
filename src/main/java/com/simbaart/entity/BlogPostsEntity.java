package com.simbaart.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.data.annotation.CreatedDate;

@Entity
@Table(name = "blogposts")
public class BlogPostsEntity extends BaseEntity{

	@Column(name = "title")
	private String title;
	
	@Column(name = "shortdescription")
	private String shortDescription;
	
	@Column(name = "thumbnail")
	private String thumbnail;
	
	@Column(name = "content", columnDefinition = "TEXT")
	private String content;
	
	@Column(name = "createddate")
	@CreatedDate
	private Timestamp createdDate;
	
	@Column(name = "createdby")
	private String createdBy;
	
	@Column(name = "modifieddate")
	private Timestamp modifiedDate;
	
	@Column(name = "modifiedby")
	private String modifiedBy;
	
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "blogcategoryid")
	private BlogCategoryEntity blogCategoryEntity;
	

	public BlogCategoryEntity getBlogCategoryEntity() {
		return blogCategoryEntity;
	}

	public void setBlogCategoryEntity(BlogCategoryEntity blogCategoryEntity) {
		this.blogCategoryEntity = blogCategoryEntity;
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

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
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

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Timestamp getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(Timestamp modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

}
