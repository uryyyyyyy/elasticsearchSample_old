package com.sample.query;

import java.util.List;
import java.util.concurrent.ExecutionException;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;

import com.sample.data.Restaurant;
import com.sample.util.ClientProvider;
import com.sample.util.Formatter;
import com.sample.util.RestaurantDTO;
import com.sample.util.SearchExecuter;

public class OffsetAndSizeQuery {

	/**
	 * フリーワード検索する。</br>
	 *
	 * @param keyword
	 * @param size
	 * @param offset
	 * @return
	 * @throws ExecutionException 
	 * @throws InterruptedException 
	 */
	public static void main(String[] args) throws Exception {
		String keyword = "東京";
		int size = 10;
		int offset = 11;

		QueryBuilder query = QueryBuilders
				.multiMatchQuery(keyword, Restaurant.ADDRESS);

		SearchRequestBuilder request = ClientProvider.searchForRestaurant()
				.setQuery(query)
				.setFrom(offset)
				.setSize(size);
		SearchResponse response = SearchExecuter.exec(request);
		List<RestaurantDTO> sourse = Formatter.sourceOf(response);
		Formatter.print(sourse);
	}

}
