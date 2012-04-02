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
import com.google.appengine.api.datastore.FetchOptions;
import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Text;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.util.Date;
import java.util.List;

@Controller
public class SaveUrlController {

	private static boolean isDeleteDataBetweenRestarts = false;
	
	//Using com.google.appengine.api.datastore.Text as google imposes a 500 char limit on String properties
	private Text datastoreJsonString = new Text("{ nodes:[ ] }");
	private static final String KEY_NAME = "FSDFA3";
	
	  @RequestMapping(value = "/editData", method = RequestMethod.GET)
	  public @ResponseBody String editData(@RequestParam String name) throws EntityNotFoundException {

		    String currentJson = this.getUrlJson();
		    UrlNodes container = new Gson().fromJson(currentJson, UrlNodes.class);
		    
		    UrlNodeDetails u = new UrlNodeDetails();
		    u.setUrl(name);
		    
		    datastoreJsonString = new Text(new Gson().toJson(container));
		    Entity urlEntity = new Entity("json" , KEY_NAME);
		    urlEntity.setProperty("urlVal", datastoreJsonString);
		  
		    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		    datastore.put(urlEntity);   
		    
	    return name;
	  }
	  
	  @RequestMapping(value = "/removeData", method = RequestMethod.GET)
	  public @ResponseBody String getData(@RequestParam String name) throws EntityNotFoundException {

		    String currentJson = this.getUrlJson();
		    UrlNodes container = new Gson().fromJson(currentJson, UrlNodes.class);
		    
		    UrlNodeDetails u = new UrlNodeDetails();
		    u.setUrl(name);
		    container.getNodes().remove(u);
		    
		    datastoreJsonString = new Text(new Gson().toJson(container));
		    Entity urlEntity = new Entity("json" , KEY_NAME);
		    urlEntity.setProperty("urlVal", datastoreJsonString);
		  
		    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
		    datastore.put(urlEntity);   
		    
	    return name;
	  }

	  
  @RequestMapping("/saveurl")
  public ModelAndView doesthismethodnamematter() {
    return new ModelAndView("saveurl", "message", "");
  }
  
  @RequestMapping(value = "/time", method = RequestMethod.GET)
  public @ResponseBody String getTime(@RequestParam String name) {
    String result = "Time for " + name + " is " + new Date().toString();
    return result;
  }
  
  @RequestMapping(value = "/getallurls", method = RequestMethod.GET)
  public @ResponseBody String getUrls() throws EntityNotFoundException {		
    return this.getUrlJson();
  }
   
  @RequestMapping(value = "/addUrl", method = RequestMethod.GET)
  public @ResponseBody String getUrl(@RequestParam String urlVal, @RequestParam String date) throws EntityNotFoundException {		
    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();

    if(isDeleteDataBetweenRestarts){
    	Entity urlEntity = new Entity("json" , KEY_NAME);
    	urlEntity.setProperty("urlVal", datastoreJsonString);
    	datastore.put(urlEntity);   
    	isDeleteDataBetweenRestarts = false;
  }
  
    String currentJson = this.getUrlJson();
    UrlNodes container = new Gson().fromJson(currentJson, UrlNodes.class);
    UrlNodeDetails u = new UrlNodeDetails(urlVal , date);
    container.getNodes().add(u);

    datastoreJsonString = new Text(new Gson().toJson(container));
    Entity urlEntity = new Entity("json" , KEY_NAME);
    urlEntity.setProperty("urlVal", datastoreJsonString);
  
    datastore.put(urlEntity);   
    
    return urlVal;
  }
  
 private String getUrlJson() throws EntityNotFoundException{
	    Key key = KeyFactory.createKey("json", KEY_NAME);
	    DatastoreService datastore = DatastoreServiceFactory.getDatastoreService();
	    
	    Entity entity = datastore.get(key);
	    Text urlValInDB = (Text)entity.getProperty("urlVal");
	    
	    return urlValInDB.getValue();
  }
  
}

