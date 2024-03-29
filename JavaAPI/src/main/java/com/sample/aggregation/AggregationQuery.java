package com.sample.aggregation;

import java.util.Collection;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.search.aggregations.AggregationBuilders;
import org.elasticsearch.search.aggregations.bucket.terms.Terms;
import org.elasticsearch.search.aggregations.bucket.terms.TermsBuilder;

import com.sample.data.Restaurant;
import com.sample.util.ClientProvider;
import com.sample.util.Pair;
import com.sample.util.SearchExecuter;

public class AggregationQuery {

	/**
	 * フィールド(路線名)で駅を集計する。
	 */
	public static void main(String[] args) throws Exception {

		TermsBuilder agg = AggregationBuilders
				.terms("agg_name")
				.field(Restaurant.LOCATION);

		SearchRequestBuilder request = ClientProvider.searchForRestaurant()
				.addAggregation(agg);
		SearchResponse response = SearchExecuter.exec(request);

		Terms terms = response.getAggregations().<Terms>get("agg_name");
		Collection<Terms.Bucket> buckets = terms.getBuckets();
		buckets.stream()
			.map((Terms.Bucket s) -> Pair.create(s.getKey(), s.getDocCount()))
			.forEach(p -> System.out.println(p.first));
	}

}
