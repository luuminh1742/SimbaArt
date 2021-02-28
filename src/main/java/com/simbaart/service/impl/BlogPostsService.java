package com.simbaart.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.simbaart.converter.BlogPostsConverter;
import com.simbaart.dto.BlogPostsDTO;
import com.simbaart.entity.BlogCategoryEntity;
import com.simbaart.entity.BlogPostsEntity;
import com.simbaart.repository.BlogCategoryRepository;
import com.simbaart.repository.BlogPostsRepository;
import com.simbaart.service.IBlogPostsService;
import com.simbaart.utils.SecurityUtils;

@Service
public class BlogPostsService implements IBlogPostsService{

	@Autowired
	private BlogPostsRepository blogPostsRepository;
	@Autowired
	private BlogCategoryRepository blogCategoryRepository;
	@Autowired
	private BlogPostsConverter blogPostsConverter;
	@Override
	public List<BlogPostsDTO> findAll(Pageable pageable) {
		List<BlogPostsDTO> models = new ArrayList<>();
		blogPostsRepository.findAllByOrderByIdDesc(pageable).forEach(entity->{
			models.add(blogPostsConverter.toDto(entity));
		});
		return models;
	}

	@Override
	public int getTotalItem() {
		return (int) blogPostsRepository.count();
	}

	@Override
	public BlogPostsDTO findById(Long id) {
		return blogPostsConverter.toDto(blogPostsRepository.findOne(id));
	}

	@Override
	@Transactional
	public BlogPostsDTO save(BlogPostsDTO dto) {
		BlogPostsEntity entity = new BlogPostsEntity();
		if(dto.getId() != null) {
			BlogPostsEntity oldBlogPosts = blogPostsRepository.findOne(dto.getId());
			entity = blogPostsConverter.toEntity(oldBlogPosts, dto);
		}else {
			entity = blogPostsConverter.toEntity(dto);
			entity.setCreatedBy(SecurityUtils.getPrincipal().getFullName());
		}
		entity.setBlogCategoryEntity(blogCategoryRepository.findOne(dto.getBlogCategoryId()));
		return blogPostsConverter.toDto(blogPostsRepository.save(entity));
	}

	@Override
	@Transactional
	public void delete(Long id) {
		blogPostsRepository.delete(id);
		
	}

	@Override
	public List<BlogPostsDTO> findAllByCategoryCode(String code, Pageable pageable) {
		BlogCategoryEntity blogCategoryEntity = blogCategoryRepository.findOneByCode(code);
		List<BlogPostsDTO> models = new ArrayList<>();
		blogPostsRepository.findAllByBlogCategoryEntityOrderByCreatedDateDesc(blogCategoryEntity,pageable)
		.forEach(entity->{
			models.add(blogPostsConverter.toDto(entity));
		});
		return models;
	}

	@Override
	public int getTotalItemByCategoryCode(String code) {
		BlogCategoryEntity blogCategoryEntity = blogCategoryRepository.findOneByCode(code);
		return (int) blogPostsRepository.countByBlogCategoryEntity(blogCategoryEntity);
	}

	@Override
	public List<BlogPostsDTO> findTop6() {
		List<BlogPostsDTO> models = new ArrayList<>();
		blogPostsRepository.findTop6ByOrderByCreatedDateDesc().forEach(entity->{
			models.add(blogPostsConverter.toDto(entity));
		});
		return models;
	}


}
