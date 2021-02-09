package com.simbaart.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class UserEntity extends BaseEntity{

	@Column(name = "username")
	private String userName;
	
	@Column(name = "password")	
	private String password;
	
	@Column(name = "fullname")
	private String fullName;
	
	@Column(name = "phone", columnDefinition = "char(15)")
	private String phone;
	
	@Column
	private String email;
	
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
	private String avatar;
	
	@Column
	private String logo;
	
	@Column
	private String bannerBelow;
	
	@Column
	private String linkBanner;
	
	@Column
	private boolean status;
	
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "userid"), 
	inverseJoinColumns = @JoinColumn(name = "roleid"))
	private List<RoleEntity> roles = new ArrayList<>();
	
	
	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	
	
	
	public List<RoleEntity> getRoles() {
		return roles;
	}

	public void setRoles(List<RoleEntity> roles) {
		this.roles = roles;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
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

	@Column(name = "biocontent", columnDefinition = "TEXT")
	private String bioContent;
	public String getBioContent() {
		return bioContent;
	}

	public void setBioContent(String bioContent) {
		this.bioContent = bioContent;
	}

	public String getUsername() {
		return userName;
	}

	public void setUsername(String username) {
		this.userName = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

}
