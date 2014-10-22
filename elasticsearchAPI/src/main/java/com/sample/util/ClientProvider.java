package com.sample.util;

import org.elasticsearch.action.search.SearchRequestBuilder;
import org.elasticsearch.client.Client;
import org.elasticsearch.client.transport.TransportClient;
import org.elasticsearch.common.settings.ImmutableSettings;
import org.elasticsearch.common.transport.InetSocketTransportAddress;

import com.sample.data.Restaurant;

public class ClientProvider {

	private static volatile TransportClient client;
	private static final String DEFAULT_SERVER_HOST = "localhost";
	private static final int DEFAULT_SERVER_PORT = 9300;
	private static final String DEFAULT_CLUSTER_NAME = "elasticsearch";

	private ClientProvider() {
	}

	private static Client getClient() {
		if (client == null) {
			client = new TransportClient(ImmutableSettings.builder()
					.put("cluster.name", DEFAULT_CLUSTER_NAME));
			client.addTransportAddress(new InetSocketTransportAddress(DEFAULT_SERVER_HOST, DEFAULT_SERVER_PORT));
		}
		return client;
	}
	
	public static SearchRequestBuilder searchForRestaurant() {
		Client client = ClientProvider.getClient();
		return client.prepareSearch(Restaurant.INDEX).setTypes(Restaurant.TYPE);
	}

}