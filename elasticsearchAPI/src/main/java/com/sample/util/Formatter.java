package com.sample.util;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.elasticsearch.action.search.SearchResponse;

public class Formatter {

	public static List<Map<String, Object>> sourceOf(SearchResponse response) {
		return StreamSupport
				.stream(response.getHits().spliterator(), false)
				.map(s -> s.getSource())
				.collect(Collectors.toList());
	}

}
