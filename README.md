elasticsearchSample
===================

## setup

### downloads

* elasticsearch : (I use v1.3.4)
* datasets : (https://github.com/livedoor/datasets)


### plugins

* https://github.com/polyfractal/elasticsearch-inquisitor
	- http://localhost:9200/_plugin/inquisitor/
	- check analizer, tokenizer behavior

* http://www.elasticsearch.org/guide/en/marvel/current/
	- http://localhost:9200/_plugin/marvel/
	- check query and response

* http://mobz.github.io/elasticsearch-head/
	- http://localhost:9200/_plugin/head/
	- check status of cluster, node
* https://github.com/elasticsearch/elasticsearch-analysis-kuromoji
	- Japanese Analyzer, tokenizer plugin
* https://github.com/AgileWorksOrg/elasticsearch-river-csv
	- csv converter

### mapping

`curl -XPOST localhost:9200/ldgourmet -d @script/mapping.json`

you can customize mapping.json, refer from http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/mapping-core-types.html

### data import

`curl -XPUT localhost:9200/_river/my_csv_river/_meta -d @script/import.json`

* change your own folder from `YOUR_FOLDER`

(using river-csv plugin)


### testing import data correctly

try `script/sampleQuery.sh`





## reference

* http://easyramble.com/install-elasticsearch-import-data.html
* http://code46.hatenablog.com/entry/2014/01/21/115620
* http://engineer.wantedly.com/2014/02/25/elasticsearch-at-wantedly-1.html
