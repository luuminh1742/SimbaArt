package com.simbaart.dto;

public class UserDTO extends AbstractDTO<UserDTO> {
	private String userName;
	private String password;
	private String fullName;
	private String avatar;
	private String phone;
	private String email;
	private String youtube;
	private String facebook;
	private String twitter;
	private String instagram;
	private String pinterest;
	private String shoppe;
	private String etsy;
	private String bioContent;
	private String bannerBelow;
	private String linkBanner;
	private String base64;
	private String logo;
	private Long roleId;
	private boolean status;
	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getBase64() {
		return base64;
	}

	public void setBase64(String base64) {
		this.base64 = base64;
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

	public String getBioContent() {
		return bioContent;
	}

	public void setBioContent(String bioContent) {
		this.bioContent = bioContent;
	}

	public String getLinkBanner() {
		return linkBanner;
	}

	public void setLinkBanner(String linkBanner) {
		this.linkBanner = linkBanner;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}
