#!/bin/sh

curl -XPUT 'http://localhost:9200/ngram_sample/' -d'
  {
      "index":{
          "analysis":{
              "tokenizer" : {
                  "my_ngram_tokenizer" : {
                     "type": "nGram",
                     "min_gram": "2",
                     "max_gram": "3",
                     "token_chars": [
                       "letter",
                       "digit"
                     ]
                  }
              },
              "analyzer" : {
                  "my_ngram" : {
                      "tokenizer" : "my_ngram_tokenizer"
                  }
              }
          }
      }
  }'
