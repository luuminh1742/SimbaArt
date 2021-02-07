package com.simbaart.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.simbaart.entity.PhotoPostsEntity;

public interface PhotoPostsRepository extends JpaRepository<PhotoPostsEntity, Long>{

	public List<PhotoPostsEntity> findAllByOrderByIdDesc(Pageable pageable);
}
