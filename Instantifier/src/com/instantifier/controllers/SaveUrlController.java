package com.instantifier.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.appengine.api.datastore.DatastoreService;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.EntityNotFoundException;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

import java.util.Date;

@Controller
public class SaveUrlController {

	
  @RequestMapping("/saveurl")
  public ModelAndView helloWorld() {
    return new ModelAndView("saveurl", "message", "");
  }
 
  @RequestMapping(value = "/time", method = RequestMethod.GET)
  public @ResponseBody String getTime(@RequestParam String name) {
    String result = "Time for " + name + " is " + new Date().toString();
    return result;
  }
  
  @RequestMapping(value = "/getallurls", method = RequestMethod.GET)
  public @ResponseBody String getUrls() throws EntityNotFoundException {		
	  
	    Key key = KeyFactory.createKey("jsonString", "jsonString");
	    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	    
	    Entity entity = datastore.get(key);
	    String urlValInDB = (String)entity.getProperty("urlVal");
	    
    return "here";
  }
   
  @RequestMapping(value = "/addUrl", method = RequestMethod.GET)
  public @ResponseBody String getUrl(@RequestParam String urlVal) {		
    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
    
    Key key = KeyFactory.createKey("jsonString", "jsonString");
    Entity urlEntity = new Entity("jsonString" , key);
    urlEntity.setProperty("urlVal", urlVal);

    com.google.appengine.api.datastore.Key urlEntityKey = datastore.put(urlEntity);   


    Entity entity = null;
    try {
		entity = datastore.get(urlEntityKey);
	} catch (EntityNotFoundException e) {
	}    
	String urlValInDB = (String)entity.getProperty("urlVal");

    String json = "{\"url\":\"<a href=\""+urlValInDB+"\""+">"+urlValInDB+"</a>\"}";
    return json;
  }
  
}

