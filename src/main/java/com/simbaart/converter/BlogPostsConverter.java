package com.simbaart.converter;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import com.simbaart.dto.BlogPostsDTO;
import com.simbaart.entity.BlogPostsEntity;

@Component
public class BlogPostsConverter {
	
	
	public BlogPostsDTO toDto(BlogPostsEntity entity) {
		BlogPostsDTO result = new BlogPostsDTO();
		result.setId(entity.getId());
		result.setTitle(entity.getTitle());
		result.setShortDescription(entity.getShortDescription());
		result.setThumbnail(entity.getThumbnail());
		result.setContent(entity.getContent());
		result.setCreatedDate(entity.getCreatedDate());
		result.setCreatedBy(entity.getCreatedBy());
		result.setModifiedDate(entity.getModifiedDate());
		result.setModifiedBy(entity.getModifiedBy());
		result.setBlogCategoryId(entity.getBlogCategoryEntity().getId());
		return result;
	}
	
	public BlogPostsEntity toEntity(BlogPostsDTO dto) {
		BlogPostsEntity result = new BlogPostsEntity();
		result.setTitle(dto.getTitle());
		result.setShortDescription(dto.getShortDescription());
		result.setThumbnail(dto.getThumbnail());
		result.setContent(dto.getContent());
		result.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		//result.setCreatedBy(dto.getCreatedBy());
		return result;
	}
	
	public BlogPostsEntity toEntity(BlogPostsEntity result, BlogPostsDTO dto) {
		result.setTitle(dto.getTitle());
		result.setShortDescription(dto.getShortDescription());
		result.setThumbnail(dto.getThumbnail());
		result.setContent(dto.getContent());
		result.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		return result;
	}
}
