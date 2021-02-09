package com.simbaart.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.simbaart.dto.PhotoCategoryDTO;
import com.simbaart.entity.PhotoCategoryEntity;
import com.simbaart.utils.ConvertCodeUtil;

@Component
public class PhotoCategoryConverter {
	@Autowired
	private ConvertCodeUtil convertCodeUtil;
	
	
	public PhotoCategoryDTO toDto(PhotoCategoryEntity entity) {
		PhotoCategoryDTO result = new PhotoCategoryDTO();
		result.setId(entity.getId());
		result.setName(entity.getName());
		result.setCode(entity.getCode());
		return result;
	}
	
	public PhotoCategoryEntity toEntity(PhotoCategoryDTO dto) {
		PhotoCategoryEntity result = new PhotoCategoryEntity();
		result.setName(dto.getName());
		result.setCode(convertCodeUtil.toCode(dto.getName()));
		return result;
	}
	
	public PhotoCategoryEntity toEntity(PhotoCategoryEntity result, PhotoCategoryDTO dto) {
		result.setName(dto.getName());
		result.setCode(convertCodeUtil.toCode(dto.getName()));
		return result;
	}
}
