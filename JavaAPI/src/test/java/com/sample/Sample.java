package com.sample;

import java.util.List;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.junit.Test;

import com.sample.util.ClientProvider;
import com.sample.util.Formatter;
import com.sample.util.RestaurantDTO;
import com.sample.util.SearchExecuter;


public class Sample {

	@Test
	public void test() {
		QueryBuilder query = QueryBuilders.matchAllQuery();
		SearchRequestBuilder request = ClientProvider.searchForRestaurant()
				.setQuery(query);
		SearchResponse response = SearchExecuter.exec(request);
		List<RestaurantDTO> sourse = Formatter.sourceOf(response);
		Formatter.print(sourse);
	}
}
