package com.simbaart.converter;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

import com.simbaart.dto.NewArtDTO;
import com.simbaart.entity.NewArtEntity;

@Component
public class NewArtConverter {
	
	public NewArtDTO toDto(NewArtEntity entity) {
		NewArtDTO result = new NewArtDTO();
		result.setId(entity.getId());
		result.setBanner(entity.getBanner());
		result.setTitle(entity.getTitle());
		result.setShortDescription(entity.getShortDescription());
		result.setContent(entity.getContent());
		result.setStatus(entity.isStatus());
		result.setCreatedDate(entity.getCreatedDate());
		return result;
	}
	
	public NewArtEntity toEntity(NewArtDTO dto) {
		NewArtEntity result = new NewArtEntity();
		result.setBanner(dto.getBanner());
		result.setTitle(dto.getTitle());
		result.setShortDescription(dto.getShortDescription());
		result.setContent(dto.getContent());
		result.setStatus(dto.isStatus());
		result.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		return result;
	}
	public NewArtEntity toEntity(NewArtEntity result, NewArtDTO dto) {
		result.setBanner(dto.getBanner());
		result.setTitle(dto.getTitle());
		result.setShortDescription(dto.getShortDescription());
		result.setContent(dto.getContent());
		result.setStatus(dto.isStatus());
		return result;
	}
	
}
