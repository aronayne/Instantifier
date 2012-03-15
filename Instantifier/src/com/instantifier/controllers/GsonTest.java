package com.instantifier.controllers;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

public class GsonTest {

	public static void main(String args[]){

		String j = "{\"nodes\":[{\"url\":\"sadfas\",\"date\":\"\"}]}";
		
		Container container = new Gson().fromJson(j, Container.class);
		
	}
}
