elasticsearchSample
===================

## setup

### require

* Java 6~
* curl
* shell

### initialize

* `script/setup.sh`
	- download and install plugins
* `script/run.sh`
	- run elasticsearch

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

### mapping&data import

`sh ./script/data_import.sh`

you can customize mapping.json, refer from
http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/mapping-core-types.html

(using river-csv plugin)


### testing if data imported correctly

try each curl script in `script/sampleQuery.sh`



### Reset data or index

(when update mapping.json, or ldgourmet index was broken)

`sh ./script/data_import.sh`

## reference

* http://easyramble.com/install-elasticsearch-import-data.html
* http://code46.hatenablog.com/entry/2014/01/21/115620
* http://engineer.wantedly.com/2014/02/25/elasticsearch-at-wantedly-1.html
* http://dev.classmethod.jp/cloud/aws/use-elasticsearch-1-use-kuromoji/
