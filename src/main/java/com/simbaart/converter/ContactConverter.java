package com.simbaart.converter;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import com.simbaart.dto.ContactDTO;
import com.simbaart.entity.ContactEntity;

@Component
public class ContactConverter {
	
	public ContactDTO toDto(ContactEntity entity) {
		ContactDTO result = new ContactDTO();
		result.setId(entity.getId());
		result.setName(entity.getName());
		result.setEmail(entity.getEmail());
		result.setMessage(entity.getMessage());
		result.setCreatedDate(entity.getCreatedDate());
		return result;
	}
	
	public ContactEntity toEntity(ContactDTO dto) {
		ContactEntity result = new ContactEntity();
		result.setName(dto.getName());
		result.setEmail(dto.getEmail());
		result.setMessage(dto.getMessage());
		result.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		return result;
	}
	
}
