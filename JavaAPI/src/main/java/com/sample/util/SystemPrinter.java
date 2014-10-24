package com.sample.util;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;

public class SystemPrinter {
	
	public static SearchResponse print(SearchRequestBuilder request){
		System.out.println("request body -----------------");
		System.out.println(request);
		System.out.println("response body -----------------");
		SearchResponse response = request.get();
		System.out.println(response);
		System.out.println("-----------------");
		return response;
	}
}
