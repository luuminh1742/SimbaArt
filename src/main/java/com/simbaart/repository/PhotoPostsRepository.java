package com.simbaart.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.simbaart.entity.PhotoCategoryEntity;
import com.simbaart.entity.PhotoPostsEntity;

public interface PhotoPostsRepository extends JpaRepository<PhotoPostsEntity, Long>{

	List<PhotoPostsEntity> findAllByOrderByIdDesc(Pageable pageable);
	List<PhotoPostsEntity> findAllByPhotoCategoryEntityOrderByIdDesc(PhotoCategoryEntity photoCategoryEntity,Pageable pageable);
	long countByPhotoCategoryEntity(PhotoCategoryEntity photoCategoryEntity);
}
