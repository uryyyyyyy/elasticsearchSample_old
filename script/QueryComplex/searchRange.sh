#!/bin/sh

curl -XGET 'http://localhost:9200/query_complex/test/_search?pretty' -d'
{
    "query" : {
        "filtered" : {
            "filter" : {
                "range" : {
                    "year" : {
                        "gte" : 2000,
                        "lt"  : 2020
                    }
                }
            }
        }
    }
}'
