package com.sample;

import java.util.List;
import java.util.Map;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.junit.Test;

import com.sample.util.ClientProvider;
import com.sample.util.Formatter;
import com.sample.util.SystemPrinter;


public class Sample {

	@Test
	public void test() {
		QueryBuilder query = QueryBuilders.matchAllQuery();
		SearchRequestBuilder request = ClientProvider.searchForRestaurant()
				.setQuery(query);
		SearchResponse response = SystemPrinter.print(request);
		List<Map<String, Object>> sourse = Formatter.sourceOf(response);
		sourse.stream().map(e -> e.get("name")).forEach(System.out::println);
	}
}
