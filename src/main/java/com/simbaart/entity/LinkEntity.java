package com.simbaart.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "link")
public class LinkEntity extends BaseEntity {

	@Column(name = "phone", columnDefinition = "char(15)")
	private String phone;

	@Column
	private String youtube;

	@Column
	private String facebook;

	@Column
	private String twitter;

	@Column
	private String instagram;

	@Column
	private String pinterest;

	@Column
	private String shoppe;

	@Column
	private String etsy;

	@Column
	private String bannerBelow;

	@Column
	private String linkBanner;

	@Column
	private String logo;

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getYoutube() {
		return youtube;
	}

	public void setYoutube(String youtube) {
		this.youtube = youtube;
	}

	public String getFacebook() {
		return facebook;
	}

	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}

	public String getTwitter() {
		return twitter;
	}

	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}

	public String getInstagram() {
		return instagram;
	}

	public void setInstagram(String instagram) {
		this.instagram = instagram;
	}

	public String getPinterest() {
		return pinterest;
	}

	public void setPinterest(String pinterest) {
		this.pinterest = pinterest;
	}

	public String getShoppe() {
		return shoppe;
	}

	public void setShoppe(String shoppe) {
		this.shoppe = shoppe;
	}

	public String getEtsy() {
		return etsy;
	}

	public void setEtsy(String etsy) {
		this.etsy = etsy;
	}

	public String getBannerBelow() {
		return bannerBelow;
	}

	public void setBannerBelow(String bannerBelow) {
		this.bannerBelow = bannerBelow;
	}

	public String getLinkBanner() {
		return linkBanner;
	}

	public void setLinkBanner(String linkBanner) {
		this.linkBanner = linkBanner;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

}
