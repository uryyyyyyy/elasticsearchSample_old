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

public class BoostQuery {

	/**
	 * フリーワード検索する。</br>
	 *
	 * その際、〜〜の項目は重み付けする。(それぞれ2.0ずつ)
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
		
		QueryBuilder query = QueryBuilders
				.multiMatchQuery(keyword, Restaurant.ADDRESS)
				.field(Restaurant.NAME, 2.0f)
				.field(Restaurant.NAME_KANA, 2.0f);

		SearchRequestBuilder request = ClientProvider.searchForRestaurant()
				.setQuery(query);
		System.out.println("-----------------");
		System.out.println(request);
		System.out.println("-----------------");
		SearchResponse response = request.execute().get();
		System.out.println(response);
		System.out.println("-----------------");

		List<RestaurantDTO> sourse = Formatter.sourceOf(response);
		Formatter.print(sourse);
	}

}
