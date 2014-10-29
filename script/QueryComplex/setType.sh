#!/bin/sh

curl -XPOST 'http://localhost:9200/query_complex/test/_mapping' -d '{
       "test": {
           "properties": {
               "title" : { "type" : "string", "index" : "not_analyzed", "analyzer": "ngram_analyzer"},
                "available" : { "type" : "boolean" },
                "year" : { "type" : "long", "index" : "analyzed" },
                "outline" : { "type" : "string", "index" : "analyzed"},
                "tag" : { "type" : "string", "index" : "not_analyzed" },
               "add_date": { "type":"date", "format":"yyyy/MM/dd"}
           }
       }
   }'
