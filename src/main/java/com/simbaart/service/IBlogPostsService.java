package com.simbaart.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.simbaart.dto.BlogPostsDTO;

public interface IBlogPostsService {

	List<BlogPostsDTO> findAll(Pageable pageable);
	BlogPostsDTO findById(Long id);
	int getTotalItem();
	BlogPostsDTO save(BlogPostsDTO dto);
	void delete(Long id);
}
