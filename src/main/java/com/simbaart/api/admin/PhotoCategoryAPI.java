package com.simbaart.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.simbaart.dto.PhotoCategoryDTO;
import com.simbaart.service.IPhotoCategoryService;

@RestController(value = "photoCategoryAPIOfAdmin")
public class PhotoCategoryAPI {
	@Autowired
	private IPhotoCategoryService photoCategoryService;
	
	@PostMapping("/api/photo/category")
	public PhotoCategoryDTO createPhotoCategory(@RequestBody PhotoCategoryDTO dto) {
		return photoCategoryService.save(dto);
	}
	
	@PutMapping("/api/photo/category")
	public PhotoCategoryDTO updatePhotoCategory(@RequestBody PhotoCategoryDTO dto) {
		return photoCategoryService.save(dto);
	}
	
	@DeleteMapping("/api/photo/category")
	public void deletePhotoCategory(@RequestBody PhotoCategoryDTO dto) {
		photoCategoryService.delete(dto.getId());
	}
	
}
