#!/bin/sh

curl -XPOST 'http://localhost:9200/kuromoji_sample/_analyze?analyzer=my_kuromoji&petty' -d $1
