#!/bin/sh

curl -XPOST 'http://localhost:9200/ngram_sample/_analyze?analyzer=analyzer&petty' -d $1
