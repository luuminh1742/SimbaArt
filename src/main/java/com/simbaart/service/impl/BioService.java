package com.simbaart.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simbaart.converter.BioConverter;
import com.simbaart.dto.BioDTO;
import com.simbaart.entity.BioEntity;
import com.simbaart.repository.BioRepository;
import com.simbaart.service.IBioService;

@Service
public class BioService implements IBioService{

	@Autowired
	private BioRepository bioRepository;
	@Autowired 
	private BioConverter bioConverter;
	
	@Override
	public BioDTO findOne() {
		List<BioEntity> entitis = bioRepository.findAll();
		for (BioEntity bioEntity : entitis) {
			return bioConverter.toDto(bioEntity);
		}
		return null;
	}

	@Override
	public BioDTO findById(Long id) {
		return bioConverter.toDto(bioRepository.findOne(id));
	}

	@Override
	@Transactional
	public BioDTO save(BioDTO dto) {
		BioEntity bioEntity = new BioEntity();
		if(dto.getId() != null) {
			BioEntity oldBio = bioRepository.findOne(dto.getId());
			bioEntity = bioConverter.toEntity(oldBio, dto);
		}else {
			bioEntity = bioConverter.toEntity(dto);
		}
		
		return bioConverter.toDto(bioRepository.save(bioEntity));
	}

}
