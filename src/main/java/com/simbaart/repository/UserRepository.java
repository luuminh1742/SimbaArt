package com.simbaart.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.simbaart.entity.UserEntity;

public interface UserRepository extends JpaRepository<UserEntity, Long>{
	
	UserEntity findOneByUserNameAndStatus(String name, boolean status);
	
}
