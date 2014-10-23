#!/bin/sh

echo "\n\n「猫」で検索\n"

curl -XGET http://localhost:9200/kuromoji_sample/test/_search?pretty -d '
    {
      "query":
      { "match":{"text":"猫"}}
    }'

echo "\n\n「我輩は猫」で検索\n"

curl -XGET http://localhost:9200/kuromoji_sample/test/_search?pretty -d '
     {
        "query":
        { "match":{"text":"我輩は猫"}}
      }'
