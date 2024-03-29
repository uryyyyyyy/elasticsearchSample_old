package com.sample.query;

import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.MatchQueryBuilder.Type;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.highlight.HighlightField;

import com.sample.data.Restaurant;
import com.sample.util.ClientProvider;
import com.sample.util.Formatter;
import com.sample.util.Pair;
import com.sample.util.RestaurantDTO;
import com.sample.util.SearchExecuter;

public class HighlightQuery {

	/**
	 * ハイライト
	 */
	public static void main(String[] args) throws Exception {
		String prefix = "東京";

		QueryBuilder query = QueryBuilders.multiMatchQuery(prefix, Restaurant.NAME_KANA)
				.field(Restaurant.NAME)
				.type(Type.PHRASE_PREFIX);

		SearchRequestBuilder request = ClientProvider.searchForRestaurant()
				.setQuery(query)
				.addHighlightedField(Restaurant.NAME).setHighlighterRequireFieldMatch(true);

		SearchResponse response = SearchExecuter.exec(request);
		List<Pair<RestaurantDTO, Map<String, HighlightField>>> sourse = highlightOf(response);
		
		sourse.stream()
        .flatMap(x -> x.second.values().stream())
        .flatMap(x -> Arrays.stream(x.getFragments()))
        .forEach(System.out::println);
	}
	
	private static List<Pair<RestaurantDTO, Map<String, HighlightField>>> highlightOf(SearchResponse response) {
		return StreamSupport.stream(response.getHits().spliterator(), false)
				.map(s -> Pair.create(Formatter.toRestaurantDTO(s.getSource()), s.getHighlightFields()))
				.collect(Collectors.toList());
	}

}
