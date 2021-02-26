package com.simbaart.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.simbaart.converter.NewArtConverter;
import com.simbaart.dto.NewArtDTO;
import com.simbaart.entity.NewArtEntity;
import com.simbaart.repository.NewArtRepository;
import com.simbaart.service.INewArtService;

@Service
public class NewArtService implements INewArtService{

	@Autowired
	private NewArtRepository newArtRepository;
	@Autowired
	private NewArtConverter newArtConverter;
	
	@Override
	public List<NewArtDTO> findAll(Pageable pageable) {
		List<NewArtDTO> result = new ArrayList<>();
		newArtRepository.findAllByOrderByIdDesc(pageable).forEach(entity->{
			result.add(newArtConverter.toDto(entity));
		});
		return result;
	}

	@Override
	public NewArtDTO findById(Long id) {
		return newArtConverter.toDto(newArtRepository.findOne(id));
	}

	@Override
	public int getTotalItem() {
		return (int) newArtRepository.count();
	}

	@Override
	@Transactional
	public NewArtDTO save(NewArtDTO dto) {
		NewArtEntity entity = new NewArtEntity();
		if (dto.getId() != null) {
			NewArtEntity oldNewArt = newArtRepository.findOne(dto.getId());
			entity = newArtConverter.toEntity(oldNewArt, dto);
		} else {
			entity = newArtConverter.toEntity(dto);
		}
		return newArtConverter.toDto(newArtRepository.save(entity));
	}

	@Override
	@Transactional
	public void delete(Long id) {
		newArtRepository.delete(id);
		
	}

	@Override
	public List<NewArtDTO> findAllByStatus() {
		List<NewArtDTO> result = new ArrayList<>();
		newArtRepository.findAllByStatusOrderByIdDesc(true).forEach(entity->{
			result.add(newArtConverter.toDto(entity));
		});
		return result;
	}

}
