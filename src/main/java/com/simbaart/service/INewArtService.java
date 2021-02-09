package com.simbaart.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.simbaart.dto.NewArtDTO;

public interface INewArtService {

	List<NewArtDTO> findAll(Pageable pageable);
	NewArtDTO findById(Long id);
	int getTotalItem();
	NewArtDTO save(NewArtDTO dto);
	void delete(Long id);
}
