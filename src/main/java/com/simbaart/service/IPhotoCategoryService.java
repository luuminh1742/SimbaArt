package com.simbaart.service;

import java.util.List;

import com.simbaart.dto.PhotoCategoryDTO;

public interface IPhotoCategoryService {
	PhotoCategoryDTO save(PhotoCategoryDTO dto);
	List<PhotoCategoryDTO> findAll();
	void delete(Long id);
	PhotoCategoryDTO findOneByCode(String code);
}
