package com.simbaart.service;

import com.simbaart.dto.BioDTO;

public interface IBioService {
	BioDTO findOne();
	BioDTO findById(Long id);
	BioDTO save(BioDTO dto);
}
