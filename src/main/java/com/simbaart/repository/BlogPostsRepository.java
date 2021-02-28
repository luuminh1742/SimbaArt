package com.simbaart.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.simbaart.entity.BlogCategoryEntity;
import com.simbaart.entity.BlogPostsEntity;
import org.springframework.data.jpa.repository.Query;

public interface BlogPostsRepository extends JpaRepository<BlogPostsEntity, Long>{
	List<BlogPostsEntity> findAllByOrderByIdDesc(Pageable pageable);
	List<BlogPostsEntity> findAllByBlogCategoryEntityOrderByCreatedDateDesc(BlogCategoryEntity blogCategoryEntity,Pageable pageable);
	long countByBlogCategoryEntity(BlogCategoryEntity blogCategoryEntity);
	List<BlogPostsEntity> findTop6ByOrderByCreatedDateDesc();
}
