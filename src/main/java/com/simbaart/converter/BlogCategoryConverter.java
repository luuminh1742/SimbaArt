package com.simbaart.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.simbaart.dto.BlogCategoryDTO;
import com.simbaart.entity.BlogCategoryEntity;
import com.simbaart.utils.ConvertCodeUtil;

@Component
public class BlogCategoryConverter {
	@Autowired
	private ConvertCodeUtil convertCodeUtil;
	
	
	public BlogCategoryDTO toDto(BlogCategoryEntity entity) {
		BlogCategoryDTO result = new BlogCategoryDTO();
		result.setId(entity.getId());
		result.setName(entity.getName());
		result.setCode(entity.getCode());
		return result;
	}
	
	public BlogCategoryEntity toEntity(BlogCategoryDTO dto) {
		BlogCategoryEntity result = new BlogCategoryEntity();
		result.setName(dto.getName());
		result.setCode(convertCodeUtil.toCode(dto.getName()));
		return result;
	}
	
	public BlogCategoryEntity toEntity(BlogCategoryEntity result, BlogCategoryDTO dto) {
		result.setName(dto.getName());
		result.setCode(convertCodeUtil.toCode(dto.getName()));
		return result;
	}
}
