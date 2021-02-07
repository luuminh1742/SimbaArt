package com.simbaart.converter;

import org.springframework.stereotype.Component;

import com.simbaart.dto.PhotoCategoryDTO;
import com.simbaart.entity.PhotoCategoryEntity;

@Component
public class PhotoCategoryConverter {
	public PhotoCategoryDTO toDto(PhotoCategoryEntity entity) {
		PhotoCategoryDTO result = new PhotoCategoryDTO();
		result.setId(entity.getId());
		result.setName(entity.getName());
		return result;
	}
	
	public PhotoCategoryEntity toEntity(PhotoCategoryDTO dto) {
		PhotoCategoryEntity result = new PhotoCategoryEntity();
		result.setName(dto.getName());
		return result;
	}
	
	public PhotoCategoryEntity toEntity(PhotoCategoryEntity result, PhotoCategoryDTO dto) {
		result.setName(dto.getName());
		return result;
	}
}
