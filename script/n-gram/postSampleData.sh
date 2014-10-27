#!/bin/sh

curl -XPUT http://localhost:9200/ngram_sample/test/1 -d '
   {
     "title" : "本１",
     "text"  : "吾輩は猫である"
   }'

 curl -XPUT http://localhost:9200/ngram_sample/test/2 -d '
   {
     "title" : "本２",
     "text"  : "吾輩は犬かもしれない"
   }'
