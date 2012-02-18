package com.instantifier.domain;

import java.util.Date;

public class UrlLink {

	private String urlString;
	private String urlName;
	private String urlDescription;
	private Date dateAdded;

	public String getUrlString() {
		return urlString;
	}

	public void setUrlString(String urlString) {
		this.urlString = urlString;
	}

	public String getUrlName() {
		return urlName;
	}

	public void setUrlName(String urlName) {
		this.urlName = urlName;
	}

	public String getUrlDescription() {
		return urlDescription;
	}

	public void setUrlDescription(String urlDescription) {
		this.urlDescription = urlDescription;
	}

	public Date getDateAdded() {
		return dateAdded;
	}

	public void setDateAdded(Date dateAdded) {
		this.dateAdded = dateAdded;
	}

}
