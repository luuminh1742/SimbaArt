package com.simbaart.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.simbaart.dto.PhotoPostsDTO;

public interface IPhotoPostsService {
	PhotoPostsDTO findById(Long id);
	List<PhotoPostsDTO> findAll(Pageable pageable);
	PhotoPostsDTO save(PhotoPostsDTO dto);
	void delete(Long id);
	int getTotalItem();
}
