#!/bin/sh

curl -XGET 'http://localhost:9200/query_complex/test/_search?pretty' -d'
{
     "query" : { "match":{"title":"ti"}}
}'

curl -XGET 'http://localhost:9200/query_complex/test/_search?pretty' -d'
{
     "query" : { "match":{"title":"title1"}}
}'
