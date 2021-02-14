package com.simbaart.converter;

import org.springframework.stereotype.Component;

import com.simbaart.dto.LinkDTO;
import com.simbaart.entity.LinkEntity;

@Component
public class LinkConverter {
	public LinkDTO toDto(LinkEntity entity) {
		LinkDTO result = new LinkDTO();
		result.setId(entity.getId());
		result.setPhone(entity.getPhone());
		result.setYoutube(entity.getYoutube());
		result.setFacebook(entity.getFacebook());
		result.setTwitter(entity.getTwitter());
		result.setInstagram(entity.getInstagram());
		result.setPinterest(entity.getPinterest());
		result.setShoppe(entity.getShoppe());
		result.setEtsy(entity.getEtsy());
		result.setBannerBelow(entity.getBannerBelow());
		result.setLinkBanner(entity.getLinkBanner());
		result.setLogo(entity.getLogo());
		return result;
	}
	
	public LinkEntity toEntity(LinkDTO dto) {
		LinkEntity result = new LinkEntity();
		result.setPhone(dto.getPhone().trim());
		result.setYoutube(dto.getYoutube().trim());
		result.setFacebook(dto.getFacebook().trim());
		result.setTwitter(dto.getTwitter().trim());
		result.setInstagram(dto.getInstagram().trim());
		result.setPinterest(dto.getPinterest().trim());
		result.setShoppe(dto.getShoppe().trim());
		result.setEtsy(dto.getEtsy().trim());
		result.setBannerBelow(dto.getBannerBelow());
		result.setLinkBanner(dto.getLinkBanner().trim());
		return result;
	}
	
	public LinkEntity toEntity(LinkEntity result, LinkDTO dto) {
		result.setPhone(dto.getPhone().trim());
		result.setYoutube(dto.getYoutube().trim());
		result.setFacebook(dto.getFacebook().trim());
		result.setTwitter(dto.getTwitter().trim());
		result.setInstagram(dto.getInstagram().trim());
		result.setPinterest(dto.getPinterest().trim());
		result.setShoppe(dto.getShoppe().trim());
		result.setEtsy(dto.getEtsy().trim());
		result.setBannerBelow(dto.getBannerBelow());
		result.setLinkBanner(dto.getLinkBanner().trim());
		return result;
	}
}
