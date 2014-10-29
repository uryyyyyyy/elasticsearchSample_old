#!/bin/sh

curl -XPUT http://localhost:9200/query_init/test/1?pretty -d '
 {
   "title" : "memo",
   "text"  : "hogehoge"
 }'
