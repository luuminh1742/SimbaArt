package com.simbaart.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.simbaart.entity.LinkEntity;

public interface LinkRepository extends JpaRepository<LinkEntity, Long>{

}
