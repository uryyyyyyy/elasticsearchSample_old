#!/bin/sh

curl -XGET http://localhost:9200/query_init/test/_search?pretty -d '
 {
   "query":
   { "match":{"title":"memo"}}
 }'
