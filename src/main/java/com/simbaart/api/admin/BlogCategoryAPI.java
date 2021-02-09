package com.simbaart.api.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.simbaart.dto.BlogCategoryDTO;
import com.simbaart.service.IBlogCategoryService;

@RestController(value = "blogCategoryAPIOfAdmin")
public class BlogCategoryAPI {
	@Autowired
	private IBlogCategoryService blogCategoryService;
	
	@PostMapping("/api/blog/category")
	public BlogCategoryDTO createPhotoCategory(@RequestBody BlogCategoryDTO dto) {
		return blogCategoryService.save(dto);
	}
	
	@PutMapping("/api/blog/category")
	public BlogCategoryDTO updatePhotoCategory(@RequestBody BlogCategoryDTO dto) {
		return blogCategoryService.save(dto);
	}
	@DeleteMapping("/api/blog/category")
	public BlogCategoryDTO deleteBlogCategory(@RequestBody BlogCategoryDTO dto) {
		blogCategoryService.delete(dto.getId());
		return dto;
	}
}
