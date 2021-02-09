package com.simbaart.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.simbaart.entity.PhotoCategoryEntity;

public interface PhotoCategoryRepository extends JpaRepository<PhotoCategoryEntity, Long>{
	List<PhotoCategoryEntity> findAllByOrderByIdDesc();
	
//	PhotoCategoryEntity findOneByCode(String code);
	
}
