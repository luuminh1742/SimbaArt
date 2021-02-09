package com.simbaart.repository;

import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.simbaart.entity.ContactEntity;

public interface ContactRepository extends JpaRepository<ContactEntity, Long>{
	
	List<ContactEntity> findAllByOrderByIdDesc(Pageable pageable);

	
}
