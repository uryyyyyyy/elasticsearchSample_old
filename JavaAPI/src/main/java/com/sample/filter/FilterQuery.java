package com.sample.filter;

import java.util.List;
import java.util.concurrent.ExecutionException;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.FilterBuilders;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;

import com.sample.data.Restaurant;
import com.sample.util.ClientProvider;
import com.sample.util.Formatter;
import com.sample.util.RestaurantDTO;
import com.sample.util.SearchExecuter;

public class FilterQuery {

	/**
	 * category_id1の値でフィルターする
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
		int category_id1 = 505;

		QueryBuilder query = QueryBuilders
				.filteredQuery(QueryBuilders.disMaxQuery()
						.add(QueryBuilders.matchQuery(Restaurant.NAME, keyword))
						.add(QueryBuilders.matchQuery(Restaurant.NAME_KANA, keyword)),
						FilterBuilders.termFilter(Restaurant.CATEGORY_ID1, category_id1));

		SearchRequestBuilder request = ClientProvider.searchForRestaurant()
				.setQuery(query);
		SearchResponse response = SearchExecuter.exec(request);
		List<RestaurantDTO> sourse = Formatter.sourceOf(response);
		Formatter.print(sourse);
	}

}
