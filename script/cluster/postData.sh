#!/bin/sh

curl -XPUT http://localhost:9200/cluster_sample/test/1 -d '
  {
    "title" : "test",
    "text"  : "node A"
  }'
