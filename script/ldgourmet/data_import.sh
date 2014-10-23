#!/bin/sh

mv ./datasets/restaurants.csv.processing.imported ./datasets/restaurants.csv

echo "delete index [ldgourmet]"
curl -XDELETE 'http://localhost:9200/ldgourmet/'

echo ""
echo "delete index [ldgourmet]"
curl -XDELETE 'http://localhost:9200/_river/'

echo ""
echo "create index [ldgourmet] from mapping.json"
curl -XPOST localhost:9200/ldgourmet -d @script/mapping.json

echo ""
echo "insert data from datasets/restaurant.csv"
curl -XPUT localhost:9200/_river/my_csv_river/_meta -d @script/import.json

