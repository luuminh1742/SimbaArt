package com.simbaart.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.simbaart.entity.NewArtEntity;

public interface NewArtRepository extends JpaRepository<NewArtEntity, Long>{
	List<NewArtEntity> findAllByOrderByIdDesc(Pageable pageable);
	List<NewArtEntity> findAllByStatus(boolean status);
}
