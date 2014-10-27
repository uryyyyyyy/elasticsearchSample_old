package com.sample.query;

import java.util.List;
import java.util.concurrent.ExecutionException;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.QueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.index.query.SimpleQueryStringBuilder.Operator;
import org.elasticsearch.search.sort.SortBuilders;
import org.elasticsearch.search.sort.SortOrder;

import com.sample.data.Restaurant;
import com.sample.util.ClientProvider;
import com.sample.util.Formatter;
import com.sample.util.RestaurantDTO;
import com.sample.util.SearchExecuter;

public class SortQuery {

	/**
	 * sort AND検索
	 *
	 * @param keyword
	 * @param size
	 * @param offset
	 * @return
	 * @throws ExecutionException 
	 * @throws InterruptedException 
	 */
	public static void main(String[] args) throws Exception {
		String queryString = "東京";
		
		QueryBuilder query = QueryBuilders
				.simpleQueryString(queryString)
				.field(Restaurant.NAME)
				.field(Restaurant.NAME_KANA)
				.field(Restaurant.ADDRESS)
				.defaultOperator(Operator.AND);

		SearchRequestBuilder request = ClientProvider.searchForRestaurant()
				.setQuery(query)
				.addSort(SortBuilders.fieldSort(Restaurant.ACCESS_COUNT).order(SortOrder.DESC).missing("_last"));
		SearchResponse response = SearchExecuter.exec(request);
		List<RestaurantDTO> sourse = Formatter.sourceOf(response);
		Formatter.print(sourse);
	}

}
