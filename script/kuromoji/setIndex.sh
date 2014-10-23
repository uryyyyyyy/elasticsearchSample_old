#!/bin/sh

curl -XPUT 'http://localhost:9200/kuromoji_sample/' -d'
  {
      "index":{
          "analysis":{
              "tokenizer" : {
                  "kuromoji" : {
                     "type" : "kuromoji_tokenizer"
                  }
              },
              "analyzer" : {
                  "my_kuromoji" : {
                      "type" : "custom",
                      "tokenizer" : "kuromoji"
                  }
              }
          }
      }
  }'
