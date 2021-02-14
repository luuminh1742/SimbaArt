package com.simbaart.converter;

import org.springframework.stereotype.Component;

import com.simbaart.dto.UserDTO;
import com.simbaart.entity.UserEntity;

@Component
public class UserConverter {
	public UserDTO toDto(UserEntity entity) {
		UserDTO result = new UserDTO();
		result.setId(entity.getId());
		result.setUsername(entity.getUsername());
		result.setFullName(entity.getFullName());
		result.setEmail(entity.getEmail());
		result.setPassword(entity.getPassword());
		return result;
	}
	
	public UserEntity toEntity(UserDTO dto) {
		UserEntity result = new UserEntity();
		result.setUsername(dto.getUsername());
		result.setFullName(dto.getFullName());
		result.setEmail(dto.getEmail());
		return result;
	}
	
	public UserEntity toEntity(UserEntity result, UserDTO dto) {
		result.setUsername(dto.getUsername());
		result.setFullName(dto.getFullName());
		result.setEmail(dto.getEmail());
		return result;
	}
}
