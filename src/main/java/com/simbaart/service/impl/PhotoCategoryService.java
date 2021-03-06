package com.simbaart.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.simbaart.converter.PhotoCategoryConverter;
import com.simbaart.dto.PhotoCategoryDTO;
import com.simbaart.entity.PhotoCategoryEntity;
import com.simbaart.repository.PhotoCategoryRepository;
import com.simbaart.service.IPhotoCategoryService;

@Service
public class PhotoCategoryService implements IPhotoCategoryService{

	@Autowired
	private  PhotoCategoryRepository photoCategoryRepository;
	@Autowired
	private PhotoCategoryConverter photoCategoryConverter;
	
	@Override
	@Transactional
	public PhotoCategoryDTO save(PhotoCategoryDTO dto) {
		PhotoCategoryEntity photoCategoryEntity = new PhotoCategoryEntity();
		if (dto.getId() != null) {
			PhotoCategoryEntity oldPhotoCategory = photoCategoryRepository.findOne(dto.getId());
			photoCategoryEntity = photoCategoryConverter.toEntity(oldPhotoCategory, dto);
		} else {
			photoCategoryEntity = photoCategoryConverter.toEntity(dto);
		}
		return photoCategoryConverter.toDto(photoCategoryRepository.save(photoCategoryEntity));
	}

	@Override
	public List<PhotoCategoryDTO> findAll() {
		List<PhotoCategoryDTO> models = new ArrayList<>();
		photoCategoryRepository.findAllByOrderByIdDesc().forEach(entity->{
			models.add(photoCategoryConverter.toDto(entity));
		});
		return models;
	}

	@Override
	@Transactional
	public void delete(Long id) {
		photoCategoryRepository.delete(id);
	}
}
