package com.simbaart.service;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.simbaart.dto.ContactDTO;

public interface IContactService {
	List<ContactDTO> findAll(Pageable pageable);
	ContactDTO findById(Long id);
	ContactDTO save(ContactDTO dto);
	void delete(Long[] ids);
	int getTotalItem();
}
