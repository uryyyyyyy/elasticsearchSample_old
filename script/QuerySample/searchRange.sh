#!/bin/sh

curl -XGET 'http://localhost:9200/sample/test/_search?pretty' -d'
{
   "query" : {
        "range" : {
            "age" {
                "gte": 20,
                "lte": 30,
                "boost": 2.0
             }
        }
    }
}'
