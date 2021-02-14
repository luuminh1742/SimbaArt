package com.simbaart.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simbaart.converter.BlogCategoryConverter;
import com.simbaart.dto.BlogCategoryDTO;
import com.simbaart.entity.BlogCategoryEntity;
import com.simbaart.repository.BlogCategoryRepository;
import com.simbaart.service.IBlogCategoryService;

@Service
public class BlogCategoryService implements IBlogCategoryService{

	@Autowired 
	private BlogCategoryRepository blogCategoryRepository;
	@Autowired
	private BlogCategoryConverter blogCategoryConverter;
	@Override
	public List<BlogCategoryDTO> findAll() {
		List<BlogCategoryDTO> result = new ArrayList<>();
		blogCategoryRepository.findAll().forEach(entity->{
			result.add(blogCategoryConverter.toDto(entity));
		});
		return result;
	}
	@Override
	public BlogCategoryDTO findById(Long id) {
		return blogCategoryConverter.
				toDto(blogCategoryRepository.findOne(id));
	}
	@Override
	@Transactional
	public BlogCategoryDTO save(BlogCategoryDTO dto) {
		BlogCategoryEntity entity = new BlogCategoryEntity();
		if(dto.getId() != null) {
			BlogCategoryEntity oldBlogCategory = blogCategoryRepository.findOne(dto.getId());
			entity = blogCategoryConverter.toEntity(oldBlogCategory, dto);
		}else {
			entity = blogCategoryConverter.toEntity(dto);
		}
		return blogCategoryConverter.toDto(blogCategoryRepository.save(entity));
	}
	@Override
	@Transactional
	public void delete(Long id) {
		blogCategoryRepository.delete(id);
	}

}
