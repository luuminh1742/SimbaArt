package com.simbaart.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.simbaart.entity.BlogPostsEntity;

public interface BlogPostsRepository extends JpaRepository<BlogPostsEntity, Long>{
	List<BlogPostsEntity> findAllByOrderByIdDesc(Pageable pageable);
	
}
