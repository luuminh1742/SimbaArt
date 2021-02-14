package com.simbaart.service;

import com.simbaart.dto.LinkDTO;

public interface ILinkService {
	LinkDTO save(LinkDTO dto);
	LinkDTO findOne();
	LinkDTO findById(Long id);
	LinkDTO saveLogo(LinkDTO dto);
}
