package com.simbaart.service;

import java.util.List;

import com.simbaart.dto.BlogCategoryDTO;

public interface IBlogCategoryService {

	List<BlogCategoryDTO> findAll();
	BlogCategoryDTO findById(Long id);
	BlogCategoryDTO save(BlogCategoryDTO dto);
	void delete(Long id);
}
