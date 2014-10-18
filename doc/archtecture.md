
## Cluster

耐障害性・スケーリングの観点から、複数のサーバ間で協調して動作させることができる。

それらのサーバ群のことをClusterと呼ぶ。

スケーリングには大きく、

* Replica
* Sharding

の二種類がある。

デフォルトではelasticsearchというクラスタが立ち上がる。node名はランダム。

変更したい場合は起動オプションか設定ファイルを編集。

`./elasticsearch --cluster.name my_cluster_name --node.name my_node_name`

## Node

（一般的なNodeとほぼ同意）

Cluster内にある個々のサーバを指す。

RDBで言うDBサーバに相当。

## Index

データ群の集合。

RDBでいうスキーマに相当。

## Type

データ（Document）を保存する場所の単位。

RDBでいうテーブルに相当。


## Document

実際に格納されるデータの単位。

Documentの中にはIdや、Typeを持ったデータが含まれる。

RDBで言うテーブルのレコードに相当。

### Field

ドキュメント内に含まれるデータの一つ。

Data Typeと値を持つ。

RDBのカラムに相当。

## Shard

ドキュメントを複数のサーバに分散させること。

これによって一台のマシンではスペックが足りないデータ量・高負荷も処理できる。

elasticsearchは、クライアント側がシャードを意識しなくても使えるように隠蔽している。

RDBのシャードに相当

## Replica

PrimaryNodeの完全なコピーをする。
これによって並列処理・バックアップが可能になる。

PrimaryNodeが死んだ場合、クラスタはReplicaから新しいPrimaryNodeを選ぶ。

## 図解

http://blog.liip.ch/archive/2013/07/19/on-elasticsearch-performance.html

http://blog.johtani.info/images/entries/20130830/IntroductionES20130829.pdf

http://sssslide.com/speakerdeck.com/johtani/elasticsearchru-men
