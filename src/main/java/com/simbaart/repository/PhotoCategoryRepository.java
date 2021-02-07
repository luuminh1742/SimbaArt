package com.simbaart.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.simbaart.entity.PhotoCategoryEntity;

public interface PhotoCategoryRepository extends JpaRepository<PhotoCategoryEntity, Long>{

}
