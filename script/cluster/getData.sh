#!/bin/sh

curl -XGET http://localhost:9201/cluster_sample/test/_search?pretty -d '
  {
    "query":
    { "match":{"title":"test"}}
  }'
