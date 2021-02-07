package com.simbaart.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class UserEntity extends BaseEntity{

	@Column(name = "username")
	private String username;
	
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
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
