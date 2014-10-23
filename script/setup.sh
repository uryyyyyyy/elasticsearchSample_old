#!/bin/sh

echo "download elasticsearch"
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.3.4.zip

unzip elasticsearch-1.3.4.zip

echo "install elasticsearch-inquisitor"
./elasticsearch-1.3.4/bin/plugin -install polyfractal/elasticsearch-inquisitor

echo "install marvel"
./elasticsearch-1.3.4/bin/plugin -i elasticsearch/marvel/latest

echo "install elasticsearch-head"
./elasticsearch-1.3.4/bin/plugin -install mobz/elasticsearch-head

echo "install kuromoji"
./elasticsearch-1.3.4/bin/plugin -install elasticsearch/elasticsearch-analysis-kuromoji/2.3.0

echo "install river-csv"
./elasticsearch-1.3.4/bin/plugin -install river-csv -url https://github.com/AgileWorksOrg/elasticsearch-river-csv/releases/download/2.1.1/elasticsearch-river-csv-2.1.1.zip
