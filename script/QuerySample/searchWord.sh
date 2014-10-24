#!/bin/sh

curl -XGET 'http://localhost:9200/sample/test/_search?pretty' -d'
{
   "query" : {
        "query_string" : {
            "query" : "hoge"
        }
    }
}'
