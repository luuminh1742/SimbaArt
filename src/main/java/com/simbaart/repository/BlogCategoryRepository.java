package com.simbaart.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.simbaart.entity.BlogCategoryEntity;

public interface BlogCategoryRepository extends JpaRepository<BlogCategoryEntity, Long>{
	
	

	
}
