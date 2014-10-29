
## setup

Index定義をしないでやってみます。

いきなり、postSampleData.shを実行します。

## 検索してみる。

searchQuery.sh

```
{
  "took" : 1,
  "timed_out" : false,
  "_shards" : {
    "total" : 5,
    "successful" : 5,
    "failed" : 0
  },
  "hits" : {
    "total" : 1,
    "max_score" : 0.30685282,
    "hits" : [ {
      "_index" : "query_init",
      "_type" : "test",
      "_id" : "1",
      "_score" : 0.30685282,
      "_source":
 {
   "title" : "memo",
   "text"  : "hogehoge"
 }
    } ]
  }
}
```

* took かかった時間（ms）
* timed_out 時間切れか否か
* shards いくつのshardに投げて、どれくらい成功したか（デフォでは5つ立ち上がる。）
* hits（一個目） 結果のsummary
* hits（二個目） 実際に検索に引っかかったデータ群

## メモ

デフォルトだと、elasticsearch.ymlで書かれているAnalzerが使用される。

```
index.analysis.analyzer.default.type: [hoge]
index.analysis.analyzer.default.tokenizer: [hogenizer]
```
