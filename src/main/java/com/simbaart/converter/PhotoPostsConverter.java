package com.simbaart.converter;

import org.springframework.stereotype.Component;

import com.simbaart.dto.PhotoPostsDTO;
import com.simbaart.entity.PhotoPostsEntity;

@Component
public class PhotoPostsConverter {
	public PhotoPostsDTO toDto(PhotoPostsEntity entity) {
		PhotoPostsDTO result = new PhotoPostsDTO();
		result.setId(entity.getId());
		result.setTitle(entity.getTitle());
		result.setImage(entity.getImage());
		result.setDescription(entity.getDescription());
		result.setCreatedDate(entity.getCreatedDate());
		result.setPhotoCategoryId(entity.getPhotoCategoryEntity().getId());
		return result;
	}
	
	public PhotoPostsEntity toEntity(PhotoPostsDTO dto) {
		PhotoPostsEntity result = new PhotoPostsEntity();
		result.setTitle(dto.getTitle());
		result.setImage(dto.getImage());
		result.setDescription(dto.getDescription());
		result.setCreatedDate(dto.getCreatedDate());
		return result;
	}
	
	public PhotoPostsEntity toEntity(PhotoPostsEntity result, PhotoPostsDTO dto) {
		result.setTitle(dto.getTitle());
		result.setImage(dto.getImage());
		result.setDescription(dto.getDescription());
		return result;
	}
}
