package com.simbaart.converter;

import org.springframework.stereotype.Component;

import com.simbaart.dto.BioDTO;
import com.simbaart.entity.BioEntity;

@Component
public class BioConverter {
	public BioDTO toDto(BioEntity entity) {
		BioDTO result = new BioDTO();
		result.setId(entity.getId());
		result.setContent(entity.getContent());
		return result;
	}
	
	public BioEntity toEntity(BioDTO dto) {
		BioEntity result = new BioEntity();
		result.setContent(dto.getContent());
		return result;
	}
	
	public BioEntity toEntity(BioEntity result, BioDTO dto) {
		result.setContent(dto.getContent());
		return result;
	}
}
