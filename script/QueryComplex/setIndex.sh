#!/bin/sh

curl -XPOST 'http://localhost:9200/query_complex/' -d '{
    "settings": {
    "analysis": {
      "analyzer": {
        "ngram_analyzer": {
          "tokenizer": "ngram_tokenizer"
        }
      },
      "tokenizer": {
        "ngram_tokenizer": {
          "type": "nGram",
          "min_gram": "2",
          "max_gram": "3",
          "token_chars": [
            "letter",
            "digit"
          ]
        }
      }
    }
  }
}'
