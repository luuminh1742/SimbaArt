package com.simbaart.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.simbaart.converter.PhotoPostsConverter;
import com.simbaart.dto.PhotoPostsDTO;
import com.simbaart.entity.PhotoPostsEntity;
import com.simbaart.repository.PhotoCategoryRepository;
import com.simbaart.repository.PhotoPostsRepository;
import com.simbaart.service.IPhotoPostsService;

@Service
public class PhotoPostsService implements IPhotoPostsService{

	@Autowired
	private PhotoPostsRepository photoPostsRepository;
	@Autowired
	private PhotoCategoryRepository photoCategoryRepository;
	@Autowired
	private PhotoPostsConverter photoPostsConverter;
	
	@Override
	public PhotoPostsDTO findById(Long id) {
		return photoPostsConverter.toDto(photoPostsRepository.findOne(id));
	}

	@Override
	public List<PhotoPostsDTO> findAll(Pageable pageable) {
		List<PhotoPostsEntity> entitis = photoPostsRepository.findAllByOrderByIdDesc(pageable);
		List<PhotoPostsDTO> models = new ArrayList<>();
		for (PhotoPostsEntity photoPostsEntity : entitis) {
			PhotoPostsDTO photoPostsDTO = photoPostsConverter.toDto(photoPostsEntity);
			models.add(photoPostsDTO);
		}
		return models;
	}

	@Override
	@Transactional
	public PhotoPostsDTO save(PhotoPostsDTO dto) {
		PhotoPostsEntity photoPostsEntity = new PhotoPostsEntity();
		if (dto.getId() != null) {
			PhotoPostsEntity oldPhotoPosts = photoPostsRepository.findOne(dto.getId());
			photoPostsEntity = photoPostsConverter.toEntity(oldPhotoPosts, dto);
		} else {
			photoPostsEntity = photoPostsConverter.toEntity(dto);
			photoPostsEntity.setCreatedDate(new Timestamp(System.currentTimeMillis()));
		}
		photoPostsEntity.setPhotoCategoryEntity(
				photoCategoryRepository.findOne(dto.getPhotoCategoryId()));
		return photoPostsConverter.toDto(photoPostsRepository.save(photoPostsEntity));
	}

	@Override
	@Transactional
	public void delete(Long id) {
		photoPostsRepository.delete(id);
	}

	@Override
	public int getTotalItem() {
		return (int) photoPostsRepository.count();
	}

}
