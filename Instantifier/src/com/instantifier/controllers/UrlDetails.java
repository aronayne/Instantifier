package com.instantifier.controllers;

import java.io.Serializable;
import java.util.List;

public class UrlDetails{

	private String details = "details";
	private List<Url> urlList;
	
	private class Url{
		private String url = "www.google.com";
	}
}