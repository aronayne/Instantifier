package com.instantifier.controllers;

public class UrlNodeDetails {
	
	public UrlNodeDetails(){
		
	}
	
	public UrlNodeDetails(String url, String date){
		this.url = url;
		this.date = date;
	}
	
    public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	private String url;
    private String date;
    // +getters.
}

