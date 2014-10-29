#!/bin/sh

curl -XGET 'http://localhost:9200/query_complex/test/_search?pretty' -d'
{
     "query" : { "match":{"tag":"tag"}}
}'

curl -XGET 'http://localhost:9200/query_complex/test/_search?pretty' -d'
{
     "query" : { "match":{"tag":"tag1"}}
}'
