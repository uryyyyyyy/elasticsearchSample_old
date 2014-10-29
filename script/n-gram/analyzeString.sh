#!/bin/sh

curl -XPOST 'http://localhost:9200/ngram_sample/_analyze?analyzer=my_ngram&petty' -d $1
