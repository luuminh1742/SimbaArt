package com.simbaart.converter;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import com.simbaart.dto.BioDTO;
import com.simbaart.entity.BioEntity;

@Component
public class BioConverter {
	public BioDTO toDto(BioEntity entity) {
		BioDTO result = new BioDTO();
		result.setId(entity.getId());
		result.setTitle(entity.getTitle());
		result.setContent(entity.getContent());
		result.setCreatedDate(entity.getCreatedDate());
		result.setModifiedDate(entity.getModifiedDate());
		return result;
	}
	
	public BioEntity toEntity(BioDTO dto) {
		BioEntity result = new BioEntity();
		result.setTitle(dto.getTitle());
		result.setContent(dto.getContent());
		result.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		return result;
	}
	
	public BioEntity toEntity(BioEntity result, BioDTO dto) {
		result.setTitle(dto.getTitle());
		result.setContent(dto.getContent());
		result.setModifiedDate(new Timestamp(System.currentTimeMillis()));
		return result;
	}
}
